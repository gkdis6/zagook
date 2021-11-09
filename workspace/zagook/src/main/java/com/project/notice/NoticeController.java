package com.project.notice;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NoticeController {
	@GetMapping("/notice/create")
	public String create() {

		return "/notice/create";
	}
	@GetMapping("/admin/notice/update")
	public String update() {

		return "/notice/update";
	}
	@GetMapping("/admin/notice/delete")
	public String delete() {

		return "/notice/delete";
	}
	@GetMapping("/notice/detail")
	public String detail() {

		return "/notice/detail";
	}
	
}
