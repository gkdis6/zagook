package com.project.feed;

import java.io.Console;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ServiceConfigurationError;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class FeedRestController {
	// 반경 내 검색(개별 단위): 100m, 1km, 5km, 10km, 20km, 30km
	final double[] base_distance = {0.001 / 2, 0.01 / 2, 0.05 / 2, 0.1 / 2, 0.2 / 2, 0.3 / 2};
	final int minimum_feed_cnt = 10;
	final int sublist_max_size = 4;
	int result_base_idx = 0;
	List<FeedDTO> feed_list = null;
	int sublist_idx = 0;
	int url_flag = 0;
	
	@Autowired
	@Qualifier("com.project.feed.FeedServiceImpl")
	private FeedService service;

	@Autowired
    FeedCachingService feedCachingService;

	@PostMapping(value = "/feed/contents", produces = "application/json;charset=UTF-8")
	public ResponseEntity<Map> postFeedList_ajax(@RequestBody FeedDTO dto, HttpSession session) {
		List<FeedDTO> sub_list = null;
		boolean end_flag = false;
		
		if ((url_flag == 1 && dto.getUrl_id().equals("myread")) || (url_flag == 2 && dto.getUrl_id().equals("read")))
			sublist_idx = 0;
		
//	#1 초기 list 생성 부분 - sublist를 활용한 paging 적용
		if (sublist_idx == 0) {
			//		Post 방식으로 FeedDTO에 삽입된 id를 사용
			//		id값으로 Friends 테이블의 친구id 조회
			//		조회된 친구 id값으로 contents 테이블의 각 row를 FeedDTO에 담아옴
			//		**추가: base_distance를 기준으로 받아온 list의 size가 minimum_feed_cnt 이상일 경우 정렬 단계로 이동
			dto.setId((String) session.getAttribute("id"));
			//		url_id에 따라 내 or 친구 피드를 검색하는 sql문 mapping
			if (dto.getUrl_id().equals("myread")) {
				feed_list = service.mylist(dto);
				url_flag = 2;
			} else if (dto.getUrl_id().equals("read")) {					
				for (int base_idx = 0; base_idx < base_distance.length; base_idx++) {
					dto.setBase_distance(base_distance[base_idx]);
					result_base_idx = base_idx;
						feed_list = service.list(dto);
						url_flag = 1;
					if (feed_list.size() > minimum_feed_cnt) {
						break;
					}
				}
			}
	
	//		list 내의 정보를 x, y 좌표에 따라 재정렬
			Collections.sort(feed_list, new Comparator<FeedDTO>() {
				@Override
				public int compare(FeedDTO o1, FeedDTO o2) {
					double x1 = dto.getX_site();
					double y1 = dto.getY_site();
					double x2 = o1.getX_site();
					double y2 = o1.getY_site();
					double x3 = o2.getX_site();
					double y3 = o2.getY_site();
					double dst1 = Math.sqrt(Math.pow(x2 - x1, 2) + Math.pow(y2 - y1, 2));
					double dst2 = Math.sqrt(Math.pow(x3 - x1, 2) + Math.pow(y3 - y1, 2));
					return (dst1 - dst2) > 0 ? 1 : -1;
				}
			});
			
	//		profile image, name 처리
			int k = 0;
			while (k < feed_list.size()) {
				FeedDTO dst = feed_list.get(k);
				FeedDTO src = service.profile(dst.getId());
				dst.setMname(src.getMname());
				dst.setFname(src.getFname());		
				k++;
			}
			
	//		Post tag 처리
			List<String> tag_list;
			k = 0;
			while (k < feed_list.size()) {
				FeedDTO tmp = feed_list.get(k);
				System.out.println("feed contentsno: " + tmp.getContentsno());
				tag_list = service.tag(tmp.getContentsno());
				//tag_list mapper xml test
	//					if (tag_list != null && !tag_list.isEmpty()) {
	//						System.out.println("tag_list " + tag_list.get(0));
	//					}
				tmp.setTag_list(tag_list);
				k++;
			}
	
	//		while문으로 list 내의 contentsno를 받아 DB에서 좋아요 여부 counting
			k = 0;
			while (k < feed_list.size()) {
				int cnt = 0;
				FeedDTO tmp = feed_list.get(k);
				Map map = new HashMap();
				map.put("id", dto.getId());
				map.put("contentsno", tmp.getContentsno());
				cnt = service.likecheck(map);
				tmp.setLike_clicked(cnt);
				k++;
			}
		}
//	#2 sublist 호출 부분
//		sublist 생성
		int feed_idx = sublist_idx * sublist_max_size;
		sub_list = new ArrayList<>();
		while (feed_idx < feed_list.size()) {
			if (sub_list.size() >= sublist_max_size)
				break;
			sub_list.add(feed_list.get(feed_idx));
			feed_idx++;
		}
		sublist_idx++;
		
		if (sub_list.size() < sublist_max_size) {
			end_flag = true;
			sublist_idx = 0;
		}
		
		Map result_map = new HashMap<>();
		result_map.put("sub_list", sub_list);
		if (dto.getUrl_id().equals("myread")) {			
			result_map.put("base_distance", "no distance");
		} else if (dto.getUrl_id().equals("read")) {
			result_map.put("base_distance", base_distance[result_base_idx]);			
		}
		result_map.put("end_flag", end_flag);

		return new ResponseEntity<Map>(result_map, HttpStatus.OK);
	}
	
	@PostMapping(value = "/feed/like", produces = "application/json;charset=UTF-8")
	public ResponseEntity<Map> feed_like_ajax(@RequestBody FeedDTO dto, HttpSession session) {
		// like count 검사
		int cnt = 0;
		Map map = new HashMap();
		System.out.println("first check id: " + (String) session.getAttribute("id"));
		map.put("id", (String) session.getAttribute("id"));
		map.put("contentsno", dto.getContentsno());
		cnt = service.likecheck(map);
		if (cnt > 0) {
			// contents 테이블 like_check 수 -1, like 테이블 접속 id, contentsno 기준으로 삭제
			System.out.println(map.get("id"));
			service.unlike(map);
			service.updatelikecnt(map);
		} else {
			// contents 테이블 like_check 수 +1, like 테이블 접속 id, contentsno 기준으로 추가
			System.out.println(map.get("id"));
			service.like(map);
			service.updatelikecnt(map);
		}
		
		Map result_map = new HashMap<>();
		if (cnt > 0) {
			result_map.put("like", "unlike");
		} else {
			result_map.put("like", "like");
		}
		result_map.put("like_cnt", service.likecnt(map));
		return new ResponseEntity<Map>(result_map, HttpStatus.OK);
	}
}
