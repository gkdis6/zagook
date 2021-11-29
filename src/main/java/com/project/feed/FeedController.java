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
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
	
	@GetMapping("/")
	public String homefeed() {
		return "/feed/home";
	}
	
	@GetMapping("/feed/read")
	public String friendsfeed() {
		return "/feed/read";
	}
	
	@GetMapping("/feed/myread")
	public String myfeed() {

		return "/feed/myread";
	}
	
	@PostMapping("/feed/tag")
	public String tagfeed() {
		
		return "/feed/tag";
	}
	
	@PostMapping("/feed/friend")
	public String friendfeed() {
		return "/feed/friend";
	}
	
	@GetMapping("/alert/feed_login")
	public String login_alert() {
		return "/alert/feed_login";
	}
	
	@GetMapping(value="/submit_friend", produces = "application/json")
	@ResponseBody
	public Map accept_friend(HttpServletRequest request, HttpSession session) {
		Map map = new HashMap();
		String id2 = request.getParameter("id2");
		String id = (String) session.getAttribute("id");
		if (session.getAttribute("id") != null) {
			map.put("id", id);
			map.put("id2", id2);
			service.submit_friend(map);
			service.submit_friend2(map);
		}
		return map;
	}
	@GetMapping(value="/feed_delete", produces = "application/json")
	@ResponseBody
	public Map feed_delete(HttpServletRequest request, HttpSession session) {
		Map map = new HashMap();
		int contentsno = Integer.parseInt(request.getParameter("contentsno"));
		String id = (String) session.getAttribute("id");
		if (session.getAttribute("id") != null) {
			map.put("contentsno", contentsno);
			map.put("id", id);
			service.delete_feed(map);
		}
		return map;
	}

	
}