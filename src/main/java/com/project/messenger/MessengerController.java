package com.project.messenger;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * Handles requests for the application home page.
 */
@Controller
public class MessengerController {

	@Autowired
	@Qualifier("com.project.messenger.MessengerServiceImpl")
	private MessengerService service;

	// 메세지 목록
	@RequestMapping(value = "/messenger_list")
	public String message_list(HttpServletRequest request, HttpSession session) {
		// System.out.println("현대 사용자 id : " + session.getAttribute("id"));

		String id = (String) session.getAttribute("id");

		MessengerDTO dto = new MessengerDTO();
		dto.setId(id);

		// 메세지 리스트
		ArrayList<MessengerDTO> list = service.messageList(dto);

		request.setAttribute("list", list);

		return "/messenger_list";
	}

	// 메세지 목록
	@RequestMapping(value = "/messenger_ajax_list")
	public String message_ajax_list(HttpServletRequest request, HttpSession session) {
		// System.out.println("현대 사용자 id : " + session.getAttribute("id"));

		String id = (String) session.getAttribute("id");

		MessengerDTO dto = new MessengerDTO();
		dto.setId(id);

		// 메세지 리스트
		ArrayList<MessengerDTO> list = service.messageList(dto);

		request.setAttribute("list", list);

		return "/messenger_ajax_list";
	}

	@RequestMapping(value = "/messenger_content_list")
	public String message_content_list(HttpServletRequest request, HttpSession session) {

		int room = Integer.parseInt(request.getParameter("room"));

		MessengerDTO dto = new MessengerDTO();
		dto.setRoom(room);
		dto.setId((String) session.getAttribute("id"));

		// 메세지 내용을 가져온다.
		ArrayList<MessengerDTO> clist = service.roomContentList(dto);

		request.setAttribute("clist", clist);

		return "/messenger_content_list";
	}

	// 메세지 리스트에서 메세지 보내기
	@ResponseBody
	@RequestMapping(value = "/messenger_send_inlist")
	public int message_send_inlist(@RequestParam int room, @RequestParam String other_id,
			@RequestParam String content, HttpSession session) {

		MessengerDTO dto = new MessengerDTO();
		dto.setRoom(room);
		dto.setSend_id((String) session.getAttribute("id"));
		dto.setRecv_id(other_id);
		dto.setContent(content);

		int flag = service.messageSendInlist(dto);

		return flag;
	}

}