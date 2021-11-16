package com.project.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.Utility.Utility;

@Controller
public class NoticeController {
	@GetMapping("/notice/create")
	public String create() {

		return "/notice/create";
	}
	@GetMapping("/notice/update")
	public String update() {

		return "/notice/update";
	}
	@GetMapping("/notice/delete")
	public String delete() {

		return "/notice/delete";
	}
	@GetMapping("/notice/detail")
	public String detail() {

		return "/notice/detail";
	}
	@RequestMapping("/notice/list")
	public String list(HttpServletRequest request) {
		// 검색관련------------------------
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));

		if (col.equals("total")) {
			word = "";
		}

		// 페이지관련-----------------------
		int nowPage = 1;// 현재 보고있는 페이지
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 5;// 한페이지당 보여줄 레코드갯수

		// DB에서 가져올 순번-----------------
		int sno = ((nowPage - 1) * recordPerPage)+1;
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("cnt", recordPerPage);

//		int total = service.total(map);
//
//		List<NoticeDTO> list = service.list(map);

//		String paging = Utility.paging(total, nowPage, recordPerPage, col, word);
//
//		// request에 notice사용 결과 담는다
//		request.setAttribute("list", list);
//		request.setAttribute("nowPage", nowPage);
//		request.setAttribute("col", col);
//		request.setAttribute("word", word);
//		request.setAttribute("paging", paging);

		// view페이지 리턴
		return "/notice/list";
	}
	
}
