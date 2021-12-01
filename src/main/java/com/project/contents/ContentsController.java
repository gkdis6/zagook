package com.project.contents;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import com.project.Utility.Utility;
import com.project.feed.FeedDTO;
import com.project.member.Member;
import com.project.reply.ReplyDAO;
import com.project.reply.ReplyTO;

@Controller
public class ContentsController {
	@Autowired
	@Qualifier("com.project.contents.ContentsServiceImpl")
	private ContentsService service;

//	@GetMapping("/")
	public String home(HttpServletRequest request, HttpSession session) {
		if (session.getAttribute("id") != null) {
			Map map = new HashMap();
			String id = (String) session.getAttribute("id");

			map.put("id", id);

			List<ContentsDTO> list = service.list(map);
			List<String> tag_list = new ArrayList();

			request.setAttribute("list", list);

			int k = 0;
			while (k < list.size()) {
				int cnt = 0;
				int check = 0;
				ContentsDTO dto = list.get(k);
				map.put("contentsno", dto.getContentsno());

				
				check = service.likeCheck(map); 
				if(check > 0) {
					dto.setLike_clicked(check);
				}

				tag_list = service.getTag(dto.getContentsno());
				dto.setTag_list(tag_list);
				k++;
			}

		}
		return "/home";
	}

	@GetMapping("/contents/create")
	public String create() {

		return "/contents/create";
	}

	@PostMapping("/contents/create")
	public String create(ContentsDTO dto, String tag, HttpServletRequest request) throws IOException {// exception 지우기
		String upDir = new ClassPathResource("/static/images").getFile().getAbsolutePath();
		String fname = Utility.saveFileSpring(dto.getFilenameMF(), upDir);

		int size = (int) dto.getFilenameMF().getSize();

		if (size > 0) {
			dto.setFilename(fname);
		} else {
			dto.setFilename("default.jpg");
		}
		int cnt = service.create(dto);
		System.out.println("태그 값 확인:" + tag);
		if (tag.trim().length() != 0) {
			String t[] = tag.split("#");
			for (int i = 0; i < t.length; i++) {
				if (t[i].trim().length() != 0) {
					dto.setTag(t[i].trim().replace(" ", "_"));
					int cnt2 = service.create2(dto);
					int cnt3 = service.create3(dto);
					if (cnt3 <= 0) {
						return "error";
					}
				}
			}
		}else {
			if(cnt<=0) {
				return "error";
			}
		}
		return "redirect:/";
	}

	@GetMapping("/contents/update/{contentsno}")
	public String update(@PathVariable("contentsno") int contentsno, Model model) {
		ContentsDTO dto = service.detail(contentsno);
		model.addAttribute("contentsno", contentsno);
		System.out.println("파일이름:" + dto.getFilename());
		model.addAttribute("oldfile", dto.getFilename());
		model.addAttribute("dto", dto);
		if (dto.getTag() == null) {
			String tag = "";
		}
		return "/contents/update";
	}

	@PostMapping("/contents/update")
	public String update(ContentsDTO dto, String tag, int contentsno, MultipartFile filenameMF, String oldfile,
			HttpServletRequest request) throws IOException {
		String basePath = Contents.getUploadDir();
		if (oldfile != null && !oldfile.equals("default.jpg")) { // 원본파일 삭제
			Utility.deleteFile(basePath, oldfile);
		}
		// pstorage에 변경 파일 저장
		Map map = new HashMap();
		map.put("contentsno", contentsno);
		int size = (int) dto.getFilenameMF().getSize();
		if (size <= 0) {
			map.put("fname", oldfile);
		} else {
			map.put("fname", Utility.saveFileSpring(filenameMF, basePath));
		}
		// 디비에 파일명 변경
		int cnt = service.updateFile(map);
		int cnt2 = service.update(dto);
		int cnt5 = service.delete(contentsno);
		if (tag.trim().length() != 0) {
			String t[] = tag.split(",");
			for (int i = 0; i < t.length; i++) {
				if (t[i].trim().length() != 0) {
					dto.setTag(t[i].trim().replace(" ", "_"));
					int cnt3 = service.create2(dto);
					int cnt4 = service.update2(dto);
					if (cnt <= 0 || cnt2 <= 0 || cnt4 <= 0) {
						return "error";
					}
				}
			}
		}else {
			if(cnt<=0 || cnt2<=0 || cnt5<=0) {
				return "error";
			}
		}
		return "redirect:/";

	}

	@GetMapping("/contents/delete/{contentsno}")
	public String delete(@PathVariable("contentsno") int contentsno) {

		return "/contents/delete";
	}

	@PostMapping("/contents/delete")
	public String delete(HttpServletRequest request, int contentsno) {

		int cnt = service.delete(contentsno);
		int cnt2 = service.delete2(contentsno);
		if (cnt2 > 0) {
			return "redirect:/";
		} else {
			return "/error";
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

	@GetMapping("/search")
	public String search() {
		return "/search";
	}

	@GetMapping(value = "/searchInput", produces = "application/json")
	@ResponseBody
	public List<Map> searchInput(HttpServletRequest request) throws IOException {
		String searchInput = Utility.checkNull(request.getParameter("searchInput"));
		List<Map> searchlist = service.searchInput(searchInput);
		System.out.println(searchInput);
		System.out.println(searchlist);
		return searchlist;
	}

	@GetMapping("/search/friend")
	public String search_friend() {
		return "/search/friend";
	}

	@GetMapping(value = "/searchInput_friend", produces = "application/json")
	@ResponseBody
	public List<Map> searchInput_friend(HttpServletRequest request) throws IOException {
		String searchInput = Utility.checkNull(request.getParameter("searchInput_friend"));
		List<Map> searchFriendlist = service.searchInput_friend(searchInput);
		System.out.println(searchInput);
		System.out.println(searchFriendlist);
		return searchFriendlist;
	}

	@GetMapping(value = "/like", produces = "application/json")
	@ResponseBody
	public int like(HttpServletRequest request, HttpSession session) throws IOException {
		String id = (String) session.getAttribute("id");
		int contentsno = Integer.parseInt(request.getParameter("contentsno"));
		Map map = new HashMap();
		int cnt = 0;
		map.put("contentsno", contentsno);
		map.put("id", id);
		if (service.like(map) > 0) {
			service.updateLike(map);
			cnt = service.likeCnt(map);
		}
		return cnt;
	}

	@GetMapping(value = "/unlike", produces = "application/json")
	@ResponseBody
	public int unlike(HttpServletRequest request, HttpSession session) throws IOException {
		String id = (String) session.getAttribute("id");
		int contentsno = Integer.parseInt(request.getParameter("contentsno"));
		Map map = new HashMap();
		int cnt = 0;
		map.put("contentsno", contentsno);
		map.put("id", id);
		if (service.unlike(map) > 0) {
			service.updateLike(map);
			cnt = service.likeCnt(map);
		}
		return cnt;
	}
	// 모댓글 작성
	@ResponseBody
	@RequestMapping(value = "/picture_write_reply.do")
	public ContentsDTO write_reply(@RequestParam String rnum, @RequestParam String content, HttpSession session) {

	    ReplyDAO replyDao= new ReplyDAO(); 
		ReplyTO to = new ReplyTO();

	    // 게시물 번호 세팅
	    to.setRnum(rnum);

	    // 댓글 내용 세팅
	    to.setContent(content);

	    // 댓글작성자 nick을 writer로 세팅
	    to.setId((String) session.getAttribute("nick"));

	    // +1된 댓글 갯수를 담아오기 위함
	    ContentsDTO pto = replyDao.pictureWriteReply(to);

	    return pto;
	}

	// 답글 작성
	@ResponseBody
	@RequestMapping(value = "/picture_write_rereply.do")
	public ContentsDTO write_rereply(@RequestParam String rnum, @RequestParam String contentsno, @RequestParam String content,
	        HttpSession session) {
		
		ReplyDAO replyDao= new ReplyDAO();
	    ReplyTO to = new ReplyTO();

	    // 게시물 번호 세팅
	    to.setContentsno(contentsno);

	    // grp, grps, grpl 은 ReplyTO에 int로 정의되어 있기 때문에 String인 no를 int로 변환해서 넣어준다.
	    // 모댓글 번호 no를 grp으로 세팅한다.
	    to.setGrp(Integer.parseInt(rnum));

	    // 답글은 깊이가 1이되어야 하므로 grpl을 1로 세팅한다.
	    to.setGrpl(1);

	    // 답글 내용 세팅
	    to.setContent(content);

	    // 답글작성자 nick을 writer로 세팅
	    to.setId((String) session.getAttribute("nick"));

	    // +1된 댓글 갯수를 담아오기 위함
	    ContentsDTO pto = replyDao.pictureWriteReReply(to);

	    return pto;
	}

	// 댓글 리스트
	@ResponseBody
	@RequestMapping(value = "/picture_replyList.do")
	public ArrayList<ReplyTO> reply_list(@RequestParam String rnum, HttpSession session) {

		ReplyDAO replyDao= new ReplyDAO();
		ReplyTO to = new ReplyTO();

	    // 가져올 댓글 리스트의 게시물번호를 세팅
	    to.setContentsno(rnum);

	    ArrayList<ReplyTO> replyList = new ArrayList();

	    replyList = replyDao.replyList(to);

	    return replyList;
	}

	// 모댓글 삭제
	@ResponseBody
	@RequestMapping(value = "/picture_delete_reply.do")
	public ContentsDTO picture_delete_reply(@RequestParam String rnum, @RequestParam String contentsno ) {

		ReplyDAO replyDao= new ReplyDAO();
		ReplyTO to = new ReplyTO();

	    // 모댓글 번호 세팅
	    to.setRnum(rnum);

	    // 게시물 번호 세팅
	    to.setContentsno(contentsno);

	    // 갱신된 댓글 갯수를 담아오기 위함
	    ContentsDTO pto = replyDao.pictureDeleteReply(to);

	    return pto;
	}

	// 답글 삭제
	@ResponseBody
	@RequestMapping(value = "/picture_delete_rereply.do")
	public ContentsDTO delete_rereply(@RequestParam String rnum, @RequestParam String contentsno, @RequestParam int grp) {

		ReplyDAO replyDao= new ReplyDAO();
		ReplyTO to = new ReplyTO();

	    // 답글 번호 세팅 - 답글 삭제하기 위해서 필요함
	    to.setRnum(rnum);

	    // 게시물 번호 세팅 - p_board 의 reply+1하기 위해 필요함
	    to.setContentsno(contentsno);

	    // grp 세팅(모댓글이 뭔지) - 모댓글은 삭제를 해도 답글이 있으면 남아있게 되는데 답글이 모두 삭제되었을 때 모댓글도 삭제하기 위해
	    // 필요함
	    to.setGrp(grp);

	    // 갱신된 댓글 갯수를 담아오기 위함
	    ContentsDTO pto = replyDao.pictureDeleteReReply(to);

	    return pto;
	}
}
