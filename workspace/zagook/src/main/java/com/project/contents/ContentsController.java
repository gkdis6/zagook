package com.project.contents;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.project.Utility.Utility;

@Controller
public class ContentsController {
	@Autowired
	@Qualifier("com.project.contents.ContentsServiceImpl")
	private ContentsService service;

	@GetMapping("/contents/create")
	public String create() {

		return "/contents/create";
	}

	@PostMapping("/contents/create")
	public String create(ContentsDTO dto, HttpServletRequest request) throws IOException {// exception 지우기
		String upDir = new ClassPathResource("/static/images").getFile().getAbsolutePath();
		String fname = Utility.saveFileSpring(dto.getFilenameMF(), upDir);
		
		int size = (int) dto.getFilenameMF().getSize();

		if (size > 0) {
			dto.setFilename(fname);
		} else {
			dto.setFilename("default.jpg");
		}

		if (service.create(dto) > 0) {
			return "redirect:/list";
		} else {
			return "error";
		}
	}

	@GetMapping("/contents/update/{contentsno}")
	public String update(@PathVariable("contentsno") int contentsno, Model model) {
		ContentsDTO dto = service.detail(contentsno);
		model.addAttribute("dto", dto);
		return "/contents/update";
	}

	@PostMapping("/contents/update")
	public String update(ContentsDTO dto) {
		int cnt = service.update(dto);

		if (cnt == 1) {
			return "redirect:/list";
		} else {
			return "error";
		}
	}

	@GetMapping("/contents/delete/{contentsno}")
	public String delete(@PathVariable("contentsno") int contentsno) {

		return "/contents/delete";
	}

	@PostMapping("/contents/delete")
	public String delete(HttpServletRequest request, int contentsno) {

		int cnt = 0;
			cnt = service.delete(contentsno);

		if (cnt == 1) {
			return "redirect:/list";
		} else {
			return "/error";
		}
	}

	@GetMapping("/contents/updateFile/{contentsno}/{oldfile}")
	public String updateFile(@PathVariable("contentsno") int contentsno, @PathVariable("oldfile") String oldfile,
			Model model) {
		model.addAttribute("contentsno", contentsno);
		model.addAttribute("oldfile", oldfile);
		return "/contents/updateFile";
	}

	@PostMapping("/contents/updateFile")
	public String updateFile(MultipartFile filenameMF, String oldfile, int contentsno, HttpServletRequest request)
			throws IOException {
		String basePath = new ClassPathResource("/static/images").getFile().getAbsolutePath();

		if (oldfile != null && !oldfile.equals("default.jpg")) { // 원본파일 삭제
			Utility.deleteFile(basePath, oldfile);
		}

		// images에 변경 파일 저장
		Map map = new HashMap();
		map.put("contentsno", contentsno);
		map.put("fname", Utility.saveFileSpring(filenameMF, basePath));

		// 디비에 파일명 변경
		int cnt = service.updateFile(map);

		if (cnt == 1) {
			return "redirect:/list";
		} else {
			return "./error";
		}
	}

	@GetMapping("/contents/detail/{contentsno}")
	public String detail(@PathVariable("contentsno") int contentsno, Model model) {
		model.addAttribute("dto", service.detail(contentsno));
		return "/contents/detail";
	}

	@RequestMapping("/contents/list")
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
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);

		int total = service.total(map);

		List<ContentsDTO> list = service.list(map);

		String paging = Utility.paging(total, nowPage, recordPerPage, col, word);

		// request에 Model사용 결과 담는다
		request.setAttribute("list", list);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("paging", paging);

		return "/contents/list";

	}

}
