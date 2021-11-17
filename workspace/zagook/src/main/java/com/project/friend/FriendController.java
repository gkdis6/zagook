package com.project.friend;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.reply.ReplyDTO;
import com.project.reply.ReplyMapper;

@Controller
public class FriendController {
	
	@Autowired
	private ReplyMapper mapper;
	
	@GetMapping("/friend")
	public String newFriendForm() {
		return "/friend";
	}
	@GetMapping("/reply/read")
	public String read(int contentsno, Model model, HttpServletRequest request) {

		mapper.upViewcnt(contentsno);
		ReplyDTO dto = mapper.read(contentsno);

		String content = dto.getContent().replaceAll("\r\n", "<br>");
		dto.setContent(content);

		model.addAttribute("dto", dto);
		
        /* 댓글 관련 시작 */
        int nPage = 1;
        if (request.getParameter("nPage") != null) {
                nPage = Integer.parseInt(request.getParameter("nPage"));
        }
        int recordPerPage = 3;

        int sno = ((nPage - 1) * recordPerPage) + 1;
        int eno = nPage * recordPerPage;

        Map map = new HashMap();
        map.put("sno", sno);
        map.put("eno", eno);
        map.put("nPage", nPage);

        model.addAllAttributes(map);

        /* 댓글 처리 끝 */

		return "/reply/read";
	}
}