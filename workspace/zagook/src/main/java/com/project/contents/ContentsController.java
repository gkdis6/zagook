package com.project.contents;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ContentsController {
	@GetMapping("/create")
	public String create() {

		return "/contents/create";
	}
	@GetMapping("/update")
	public String update() {

		return "/contents/update";
	}
	@GetMapping("/delete")
	public String delete() {

		return "/contents/delete";
	}
	@GetMapping("/updateFile")
	public String updateFile() {

		return "/contents/updateFile";
	}
	@GetMapping("/detail")
	public String detail() {

		return "/contents/detail";
	}
	
}
