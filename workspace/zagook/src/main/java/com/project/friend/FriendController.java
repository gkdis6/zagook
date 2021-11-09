package com.project.friend;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FriendController {
	
	@GetMapping("/friend")
	public String newFriendForm() {
		return "/friend";
	}

}
