package com.project.friend;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	@PostMapping(value="/friend", produces = "application/json")
	public Map friend_status(HttpServletRequest request, HttpSession session) {
		Map<> map = new HashMap<>();
		if (session.getAttribute("id") != null) {
			
		}
		return map;
	}
}
