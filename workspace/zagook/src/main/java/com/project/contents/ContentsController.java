package com.project.contents;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ContentsController {

	@Autowired
	@Qualifier("com.project.contents.ContentsServiceImpl")
	private ContentsService service;
	
	@GetMapping("/")
	public String home() {

		return "/home";
	}
}
