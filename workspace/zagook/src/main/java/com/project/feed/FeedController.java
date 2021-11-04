package com.project.feed;

import java.io.File;
import java.io.IOException;
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
	public FeedDTO postFeedList_ajax(@RequestBody FeedDTO dto) {
		List<FeedDTO> results;
		
//		call DB function
		results = service.list(dto);
		
//		logic 처리
		
//		페이징 처리
		
//		return 일부?
		return (results.get(0));
	}
}