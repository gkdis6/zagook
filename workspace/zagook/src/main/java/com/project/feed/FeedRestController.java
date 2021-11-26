package com.project.feed;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.project.member.MemberDTO;

@RestController
public class FeedRestController {
	// 반경 내 검색(개별 단위): 100m, 1km, 5km, 10km, 20km, 30km, 50km, 80km, 100km
	final double[] base_distance = {0.001 / 2, 0.01 / 2, 0.05 / 2, 0.1 / 2, 0.2 / 2, 0.3 / 2, 0.5 / 2, 0.8 / 2, 1.0 / 2};
	final int minimum_feed_cnt = 10;
	final int sublist_max_size = 10;
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
		int end_flag = 0;
		Map result_map = new HashMap<>();
		// load type 구분 : reload or scroll
		if (dto.getLoad_type().equals("reload"))
			sublist_idx = 0;
		
		// page 간 이동 구분 > url_flag = 1(read page), = 2(myread page), =3(tag page), =4(friend page)
		int cur_url_flag = 0;
		if (dto.getUrl_id().equals("read"))
			cur_url_flag = 1;
		else if (dto.getUrl_id().equals("myread"))
			cur_url_flag = 2;
		else if (dto.getUrl_id().equals("tag"))
			cur_url_flag = 3;
		else if (dto.getUrl_id().equals("friend")) {
			cur_url_flag = 4;
		}
		
		// 생성된 list를 전역으로 controller가 보관하고 있기 때문에, 페이지 url 변경 시 이를 버리고 다시 list를 생성해야 함
		if (cur_url_flag != url_flag)
			sublist_idx = 0;

//========================================================== < 초기 list 생성 part 시작> =======================================================
//	#1 초기 list 생성 부분 - sublist를 활용한 paging 적용
		if (sublist_idx == 0) {
			end_flag = -1;
			if (dto.getUrl_id().equals("myread") || dto.getUrl_id().equals("read")) {
				dto.setId((String) session.getAttribute("id"));
			} else if (dto.getUrl_id().equals("tag") || dto.getUrl_id().equals("friend")) {
				dto.setId(dto.getSelected_id());
			}
//----------------------------------------------------------- < myread > --------------------------------------------------------------------
			if (dto.getUrl_id().equals("myread")) {
				if (dto.getRange().equals("null")) {
					for (int base_idx = 0; base_idx < base_distance.length; base_idx++) {
						dto.setBase_distance(base_distance[base_idx]);
						result_base_idx = base_idx;
						String order_type = dto.getOrder_type();
						if (order_type.equals("distance")) {
							feed_list = service.mylist(dto);
						} else if (order_type.equals("recent")) {
							feed_list = service.mylistbyrecent(dto);
						} else if (order_type.equals("old")) {
							feed_list = service.mylistbyold(dto);
						}
						url_flag = 2;
						if (feed_list.size() > minimum_feed_cnt) {
							break;
						}
					}
				} else {
					double selected_range = Double.parseDouble(dto.getRange()) / 100 / 2;
					for (int i = 0; i < base_distance.length; i++) {
						result_base_idx = i;
						if (base_distance[i] == selected_range)
							break;
					}
					dto.setBase_distance(selected_range);
					String order_type = dto.getOrder_type();
					if (order_type.equals("distance")) {
						feed_list = service.mylist(dto);
					} else if (order_type.equals("recent")) {
						feed_list = service.mylistbyrecent(dto);
					} else if (order_type.equals("old")) {
						feed_list = service.mylistbyold(dto);
					}
					url_flag = 2;
				}
				MemberDTO dto_member = service.read((String) dto.getId());
				result_map.put("dto_member", dto_member);
			}
//--------------------------------------------------------------- < read > -------------------------------------------------------------------
			else if (dto.getUrl_id().equals("read")) {
				if (dto.getRange().equals("null")) {
					for (int base_idx = 0; base_idx < base_distance.length; base_idx++) {
						dto.setBase_distance(base_distance[base_idx]);
						result_base_idx = base_idx;
						String order_type = dto.getOrder_type();
						if (order_type.equals("distance")) {
							feed_list = service.list(dto);
						} else if (order_type.equals("recent")) {
							feed_list = service.listbyrecent(dto);
						} else if (order_type.equals("old")) {
							feed_list = service.listbyold(dto);
						}
						url_flag = 1;
						if (feed_list.size() > minimum_feed_cnt) {
							break;
						}
					}
				} else {
					double selected_range = Double.parseDouble(dto.getRange()) / 100 / 2;
					for (int i = 0; i < base_distance.length; i++) {
						result_base_idx = i;
						if (base_distance[i] == selected_range)
							break;
					}
					dto.setBase_distance(selected_range);
					String order_type = dto.getOrder_type();
					if (order_type.equals("distance")) {
						feed_list = service.list(dto);
					} else if (order_type.equals("recent")) {
						feed_list = service.listbyrecent(dto);
					} else if (order_type.equals("old")) {
						feed_list = service.listbyold(dto);
					}
					url_flag = 1;
				}
			}
//-------------------------------------------------------------- < tag > ---------------------------------------------------------------------
			else if (dto.getUrl_id().equals("tag")) {
				if (dto.getRange().equals("null")) {
					for (int base_idx = 0; base_idx < base_distance.length; base_idx++) {
						dto.setBase_distance(base_distance[base_idx]);
						result_base_idx = base_idx;
						String order_type = dto.getOrder_type();
						if (order_type.equals("distance")) {
							feed_list = service.taglist(dto);
						} else if (order_type.equals("recent")) {
							feed_list = service.taglistbyrecent(dto);
						} else if (order_type.equals("old")) {
							feed_list = service.taglistbyold(dto);
						}
						url_flag = 3;
						if (feed_list.size() > minimum_feed_cnt) {
							break;
						}
					}
				} else {
					double selected_range = Double.parseDouble(dto.getRange()) / 100 / 2;
					for (int i = 0; i < base_distance.length; i++) {
						result_base_idx = i;
						if (base_distance[i] == selected_range)
							break;
					}
					dto.setBase_distance(selected_range);
					String order_type = dto.getOrder_type();
					if (order_type.equals("distance")) {
						feed_list = service.taglist(dto);
					} else if (order_type.equals("recent")) {
						feed_list = service.taglistbyrecent(dto);
					} else if (order_type.equals("old")) {
						feed_list = service.taglistbyold(dto);
					}
					url_flag = 3;
				}
				result_map.put("tagcnt", service.tagcnt(dto));
				result_map.put("tag", dto.getSelected_id());
			}
//---------------------------------------------------------------  < friend >-------------------------------------------------------------------
			else if (dto.getUrl_id().equals("friend")) {
				Map friend_check_map = new HashMap<>();
				friend_check_map.put("session_id", (String) session.getAttribute("id"));
				friend_check_map.put("selected_id", (String) dto.getSelected_id());
				if (dto.getRange().equals("null")) {
					for (int base_idx = 0; base_idx < base_distance.length; base_idx++) {
						dto.setBase_distance(base_distance[base_idx]);
						result_base_idx = base_idx;
						String order_type = dto.getOrder_type();
						if (service.friendcheck(friend_check_map) > 0) {
							if(service.friendcheck_2(friend_check_map) == 3) {
								if (order_type.equals("distance")) {
									feed_list = service.friendlist(dto);
								} else if (order_type.equals("recent")) {
									feed_list = service.friendlistbyrecent(dto);
								} else if (order_type.equals("old")) {
									feed_list = service.friendlistbyold(dto);
								}
							}
						} else {
							if (order_type.equals("distance")) {
								feed_list = service.notfriendlist(dto);
							} else if (order_type.equals("recent")) {
								feed_list = service.notfriendlistbyrecent(dto);
							} else if (order_type.equals("old")) {
								feed_list = service.notfriendlistbyold(dto);
							}
						}
						url_flag = 4;
						if (feed_list.size() > minimum_feed_cnt) {
							break;
						}
					}
				} else {
					double selected_range = Double.parseDouble(dto.getRange()) / 100 / 2;
					for (int i = 0; i < base_distance.length; i++) {
						result_base_idx = i;
						if (base_distance[i] == selected_range)
							break;
					}
					dto.setBase_distance(selected_range);
					String order_type = dto.getOrder_type();
					if (service.friendcheck(friend_check_map) > 0) {
						if(service.friendcheck_2(friend_check_map) == 3) {
							if (order_type.equals("distance")) {
								feed_list = service.friendlist(dto);
							} else if (order_type.equals("recent")) {
								feed_list = service.friendlistbyrecent(dto);
							} else if (order_type.equals("old")) {
								feed_list = service.friendlistbyold(dto);
							}
						}
					} else {
						if (order_type.equals("distance")) {
							feed_list = service.notfriendlist(dto);
						} else if (order_type.equals("recent")) {
							feed_list = service.notfriendlistbyrecent(dto);
						} else if (order_type.equals("old")) {
							feed_list = service.notfriendlistbyold(dto);
						}
					}
					url_flag = 4;
				} 
				MemberDTO dto_member = service.read((String) dto.getSelected_id());
				result_map.put("dto_member", dto_member);
				if (service.friendcheck(friend_check_map) > 0 ) {
					result_map.put("friend_status", service.friendcheck_2(friend_check_map));
				}else {
					result_map.put("friend_status", 0);
				}
				
			}
//------------------------------------------------------------------------------------------------------------------------------------------
//========================================================= < 초기 list 생성 part 끝> =========================================================
	
			if (dto.getOrder_type().equals("distance")) {
				//	list 내의 정보를 x, y 좌표에 따라 재정렬
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
			}
			
	//		profile image, name 처리
			int k = 0;
			System.out.println("size: " + feed_list.size());
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
		
		if ((sub_list.size() < sublist_max_size) || 
				((sub_list.size() == sublist_max_size) && ((feed_list.size() / sublist_max_size) + 1 == sublist_idx))) {
			if (end_flag == -1)
				end_flag = -2;
			else
				end_flag = 1;
			sublist_idx = 0;
		}
		
		result_map.put("sub_list", sub_list);
		result_map.put("base_distance", base_distance[result_base_idx]);			
		result_map.put("end_flag", end_flag);

		return new ResponseEntity<Map>(result_map, HttpStatus.OK);
	}
	
	@PostMapping(value = "/feed/like", produces = "application/json;charset=UTF-8")
	public ResponseEntity<Map> feed_like_ajax(@RequestBody FeedDTO dto, HttpSession session) {
		// like count 검사
		int cnt = 0;
		Map map = new HashMap();
		map.put("id", (String) session.getAttribute("id"));
		map.put("contentsno", dto.getContentsno());
		cnt = service.likecheck(map);
		if (cnt > 0) {
			// contents 테이블 like_check 수 -1, like 테이블 접속 id, contentsno 기준으로 삭제
			service.unlike(map);
			service.updatelikecnt(map);
		} else {
			// contents 테이블 like_check 수 +1, like 테이블 접속 id, contentsno 기준으로 추가
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
