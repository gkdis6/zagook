package com.project.feed;

import java.io.File;

import java.io.IOException;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.net.URLEncoder;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FeedController {
	@Autowired
	@Qualifier("com.project.feed.FeedServiceImpl")
	private FeedService service;

	@GetMapping("/feed/read")
	public String home() {

		return "/feed/read";
	}
	
	@PostMapping(value = "/feed/contents", produces = "application/json;charset=UTF-8")
	public void postFeedList_ajax(@RequestBody FeedDTO dto) {
		List<FeedDTO> feed_list;
		
//		call DB function
		System.out.println(dto.getId());
		
//		Post 방식으로 FeedDTO에 삽입된 id를 사용
//		id값으로 Friends 테이블의 친구id 조회
//		조회된 친구 id값으로 contents 테이블의 각 row를 FeedDTO에 담아옴
		feed_list = service.list(dto.getId());
		
//		@@feed_list test code
//		int i = 0;
//		while (i < feed_list.size()) {
//			System.out.println(String.valueOf(feed_list.size()));
//			FeedDTO tmp = feed_list.get(i);
//			if (tmp != null) {				
//				System.out.println(tmp.getContents());
//			}
//			i++;
//		}
		
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
		
//		@@ sort test code
//		int i = 0;
//		while (i < feed_list.size()) {
//			System.out.println(String.valueOf(feed_list.size()));
//			FeedDTO tmp = feed_list.get(i);
//			if (tmp != null) {
//				System.out.println(tmp.getContents());
//				System.out.println(tmp.getX_site());
//				System.out.println(tmp.getY_site());
//			}
//			i++;
//		}
		
//		while문으로 list 내의 contentsno를 받아 DB에서 좋아요 여부 counting
		int k = 0;
		while (k < feed_list.size()) {
			int cnt = 0;
			FeedDTO tmp = feed_list.get(k);
			Map map = new HashMap();
			map.put("id", dto.getId());
			map.put("contentsno", tmp.getContentsno());
			cnt = service.like(map);
			dto.setLike_clicked(cnt);
			k++;
		}
		
//		Post tag 처리
		List<String> tag_list;
		k = 0;
		while (k < feed_list.size()) {
			FeedDTO tmp = feed_list.get(k);
			tag_list = service.tag(tmp.getContentsno());
			dto.setTag_list(tag_list);
			k++;
		}
		
//		paging?처리
	}
}