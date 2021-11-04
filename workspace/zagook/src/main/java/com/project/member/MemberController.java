package com.project.member;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.Utility.Utility;

@Controller
public class MemberController {

	@Autowired
	@Qualifier("com.project.member.MemberServiceImpl")
	private MemberService service;
	
	@GetMapping("/")
	public String home() {

		return "/home";
	}

	
	@GetMapping("/member/login")
	public String login(HttpServletRequest request) {
		
		 /*----荑좏궎�꽕�젙 �궡�슜�떆�옉----------------------------*/
        String c_id = "";     // ID ���옣 �뿬遺�瑜� ���옣�븯�뒗 蹂��닔, Y
        String c_id_val = ""; // ID 媛�
         
        Cookie[] cookies = request.getCookies(); 
        Cookie cookie=null; 
         
        if (cookies != null){ 
         for (int i = 0; i < cookies.length; i++) { 
           cookie = cookies[i]; 
         
           if (cookie.getName().equals("c_id")){ 
             c_id = cookie.getValue();     // Y 
           }else if(cookie.getName().equals("c_id_val")){ 
             c_id_val = cookie.getValue(); // user1... 
           } 
         } 
        } 
        /*----荑좏궎�꽕�젙 �궡�슜 �걹----------------------------*/
        request.setAttribute("c_id", c_id);
        request.setAttribute("c_id_val", c_id_val);
        
		return "/member/login";
	}
	
	@PostMapping("/member/login")
	public String login(@RequestParam Map<String, String> map,
			HttpSession session,
			HttpServletResponse response,
			Model model) {
		
		int cnt = service.loginCheck(map);
		//cnt>0 logincheck媛� �꽦怨듭씠硫�, 
		if(cnt>0) { //�쉶�썝�씠�떎.
			 
//			grade>> String grade = service.getGrade(map.get("id"));
             session.setAttribute("id", map.get("id"));
//          grade >>   session.setAttribute("grade", grade);
             //Cookie ���옣,id���옣 �뿬遺� 諛� id
             Cookie cookie = null;
             String c_id = map.get("c_id");
            //if荑좏궎媛� ���옣 --
             if(c_id != null) {
                 cookie = new Cookie("c_id",c_id ); //c_id=> Y
                 cookie.setMaxAge(60 * 60 * 24 * 365);//1�뀈
                 response.addCookie(cookie);//�슂泥�吏�(client:釉뚮씪�슦�� 而�) 荑좏궎 ���옣
                 
                 cookie = new Cookie("c_id_val",map.get("id"));
                 cookie.setMaxAge(60 * 60 * 24 * 365);//1�뀈
                 response.addCookie(cookie);//�슂泥�吏�(client:釉뚮씪�슦�� 而�) 荑좏궎 ���옣
             }else { //泥댄겕 �븞�븯硫� "" �꽔�뼱�꽌 吏��슦湲�
                 cookie = new Cookie("c_id",""); //荑좏궎 �궘�젣
                 cookie.setMaxAge(0);
                 response.addCookie(cookie);
                 
                 cookie = new Cookie("c_id_val","");//荑좏궎 �궘�젣
                 cookie.setMaxAge(0);
                 response.addCookie(cookie);             
             }
		}//ifcnt>0 end
		
		if(cnt>0) {
//			model.addAttribute("mssg","sdsd");
//			return "/member/loginMsg";
				return "redirect:/";
			
		}else {
			model.addAttribute("msg","�븘�씠�뵒 �삉�뒗 鍮꾨�踰덊샇瑜� �옒紐� �엯�젰 �뻽嫄곕굹 <br>�쉶�썝�씠 �븘�떃�땲�떎. �쉶�썝媛��엯 �븯�꽭�슂");
			return "/member/errorMsg";
		}
		
	}
	
	@GetMapping("/member/logout")
	public String logout(HttpSession session) {
		//�꽭�뀡 吏��썙�빞�븿
		session.invalidate(); //�꽭�뀡 吏��슦怨� 濡쒓렇�븘�썐 泥섎━
		return "redirect:/";
	}
	
	@GetMapping("/member/agree")
	public String agree() {
		return "/member/agree";
	}
	
	@PostMapping("/member/createForm")
	public String create() {
		return "/member/create";
	}
	
	@PostMapping("/member/create")
	public String crate(MemberDTO dto) throws IOException{
//		String upDir = new ClassPathResource("/static/member/storage").getFile().getAbsolutePath();
		String upDir = Member.getUploadDir();
		String fname = Utility.saveFileSpring(dto.getFnameMF(), upDir);
		int size = (int)dto.getFnameMF().getSize();
		if(size>0) {
			dto.setFname(fname);
		}else{
			dto.setFname("member.jpg");
		}
		
		if(service.create(dto)>0) {
			return "redirect:/";
		}else{
			return "error";
		}
		
	}
	
	@GetMapping(value="/member/emailcheck",produces="application/json;charset=utf-8")
	@ResponseBody
	public Map<String,String> emailCheck(String email){
		
		int cnt = service.duplicatedEmail(email); 
		Map<String,String> map = new HashMap<String,String>();
		if(cnt>0) {
			//map에 들어갈 data
			map.put("str", email+"는 중복되어서 사용할 수 없습니다.");
		}else {
			map.put("str", email+"는 중복아님, 사용가능 합니다.");
		}
		return map;
	}
	//id 중복확인
	@GetMapping(value="/member/idcheck",produces="application/json;charset=utf-8")
	@ResponseBody
	public Map<String,String> idcheck(String id){
		int cnt = service.duplicatedId(id);
		
		Map<String,String> map = new HashMap<String,String>();
		if(cnt>0) {
			//map에 들어갈 data
			map.put("str", id+"는 중복되어서 사용할 수 없습니다.");
		}else {
			map.put("str", id+"는 중복아님, 사용가능 합니다.");
		}
		return map;
	}
}