package com.project.friend;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class FriendController {
	@Autowired
	@Qualifier("com.project.friend.FriendServiceImpl")
	private FriendService service;
	
	@GetMapping("/friend")
	public String friend(HttpServletRequest request, HttpSession session) {
		if (session.getAttribute("id") != null) {
			Map map = new HashMap();
			String id = (String) session.getAttribute("id");

			map.put("id", id);

			List<FriendDTO> list = service.friendList(map);
			
			request.setAttribute("list", list);
		}
		
		return "/friend";
	}
	
	@GetMapping(value="/friend_delete", produces = "application/json")
	@ResponseBody
	public Map delete_friend(HttpServletRequest request, HttpSession session) {
		Map map = new HashMap();
		String id2 = request.getParameter("id2");
		System.out.println(request.getParameter("id2"));
		String id = (String) session.getAttribute("id");
		if (session.getAttribute("id") != null) {
			System.out.println(id);
			map.put("id", id);
			map.put("id2", id2);
			map.put("status", "0");
			if(service.delete_friend(map) > 0) {
				map.put("status", "1");
			}
		}
		return map;
	}
}
