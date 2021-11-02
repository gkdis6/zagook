package com.project.notice;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NoticeController {
	@GetMapping("/create")
	public String create() {

		return "/notice/create";
	}
	@GetMapping("/update")
	public String update() {

		return "/notice/update";
	}
	@GetMapping("/delete")
	public String delete() {

		return "/notice/delete";
	}
	@GetMapping("/detail")
	public String detail() {

		return "/notice/detail";
	}
	
}
