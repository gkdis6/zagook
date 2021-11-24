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
import org.springframework.web.multipart.MultipartFile;

import com.project.Utility.Utility;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;

@Controller
public class MemberController {

   @Autowired
   @Qualifier("com.project.member.MemberServiceImpl")
   private MemberService service;

   @GetMapping("/member/login")
   public String login(HttpServletRequest request) {
      /*쿠키설정*/
        String c_id = "";     // ID 저장여부를 저장하는 변수, Y
        String c_email_val = ""; // ID 값
         
        Cookie[] cookies = request.getCookies(); 
        Cookie cookie=null; 
         
        if (cookies != null){ 
         for (int i = 0; i < cookies.length; i++) { 
           cookie = cookies[i]; 
         
           if (cookie.getName().equals("c_id")){ 
             c_id = cookie.getValue();     // Y 
           }else if(cookie.getName().equals("c_email_val")){ 
             c_email_val = cookie.getValue(); // user1... 
           } 
         } 
        } 
        /*---쿠키 설정 끝----------------------------*/
        request.setAttribute("c_id", c_id);
        request.setAttribute("c_email_val", c_email_val);
        System.out.println("######::::"+c_email_val);
      return "/member/login";
   }
   
   @PostMapping("/member/login")
   public String login(@RequestParam Map<String, String> map,
         HttpSession session,
         HttpServletResponse response,
         Model model, String id,String email) {
      int cnt = service.loginCheck(map);
      System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@");
      System.out.println("@@@@@@::::"+email);
      System.out.println("map::::"+map);
      MemberDTO dto = service.read(email);
      map.put("id", dto.getId());
      System.out.println("@@@@@@::::"+dto);
      if(cnt>0) { //회원
         
         //grade>> String grade = service.getGrade(map.get("id"));
         session.setAttribute("id", map.get("id"));
         session.setAttribute("email",map.get("email"));
         session.setAttribute("grade",dto.getGrade());
         System.out.println("seid:::"+session.getAttribute("id"));
         System.out.println("seem:::"+session.getAttribute("email"));
         //#########################################################
         
             // grade >>   session.setAttribute("grade", grade);
             //Cookie 저장, id 저장 여부 및 id
             Cookie cookie = null;
             String c_id = map.get("c_id");
            //if 쿠키값 저장--
             if(c_id != null) {
                 cookie = new Cookie("c_id",c_id ); //c_id=> Y
                 cookie.setMaxAge(60 * 60 * 24 * 365);//1년
                 response.addCookie(cookie);
                 
                 cookie = new Cookie("c_email_val",map.get("email"));
                 cookie.setMaxAge(60 * 60 * 24 * 365);//1년
                 response.addCookie(cookie);
             }else { //체크 안하면 "" 넣어 지우기
                 cookie = new Cookie("c_id",""); //쿠키 삭제
                 cookie.setMaxAge(0);
                 response.addCookie(cookie);
                 
                 cookie = new Cookie("c_email_val","");//쿠키 삭제
                 cookie.setMaxAge(0);
                 response.addCookie(cookie);             
             }
      }
      
      if(cnt>0) {
         System.out.println("email:::"+session.getAttribute("email"));
         System.out.println("id:::"+session.getAttribute("id"));
            return "redirect:/";
         
      }else {
         model.addAttribute("msg","아이디 또는 비밀번호를 잘못 입력 했거나 <br>회원이 아닙니다. 회원가입 하세요");
         return "/member/errorMsg";
      }
      
   }
   
   @GetMapping("/member/logout")
   public String logout(HttpSession session) {
      session.invalidate(); //세션 지우고 로그아웃 처리
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
   
   @PostMapping(value="/member/create",produces="application/json;charset=utf-8")
   public String crate(MemberDTO dto,Model model) throws IOException{
	   //String upDir = new ClassPathResource("/static/member/storage").getFile().getAbsolutePath();
      String upDir = Member.getUploadDir();
      String fname = Utility.saveFileSpring(dto.getFnameMF(), upDir);
      int size = (int)dto.getFnameMF().getSize();
      if(size>0) {
         dto.setFname(fname);
      }else{
         dto.setFname("member.jpg");
      }
      
      if(service.create(dto)>0) {
    	 System.out.println("###::가입");
    	 model.addAttribute("msg","가입이 완료 되었습니다.<br>가입하신 정보로 로그인 해주세요.");
    	 System.out.println("model::가입"+model);
         return "/member/signcheck";
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
         map.put("str", email+" 로 가입한 내역이 존재합니다. 로그인 해주세요.");
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
   //마이페이지
   @GetMapping("/member/mypage")
   public String read(String id, String email,@RequestParam Map<String, String> map,
	   				HttpSession session, Model model) {
      if(id == null) {
         id = (String) session.getAttribute("id");
      }
      if(email == null) {
         email = (String) session.getAttribute("email");
      }
      MemberDTO dto = service.read(email);
      model.addAttribute("dto",dto);
      return "/member/mypage";
   }
   
   @GetMapping("/member/update")
   public String update(String id,String email,HttpSession session, Model model) {
      if(email == null) {
         email = (String)session.getAttribute("email");
      }
      MemberDTO dto = service.read(email);
      // 소셜 사용자 구분 ======================================
//      Map map = new HashMap();
//      map.put("social", dto.getSocial());
//      map.get("social");
//      System.out.println("social:::::"+map.get("social"));
      // ==================================================
      model.addAttribute("dto",dto);
      return "/member/update";
   }
   
   @PostMapping("/member/update")
    public String update(MemberDTO dto,String id, Model model,HttpSession session) {
	  System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+dto);
	   int cnt = service.update(dto);
       System.out.println("@@@@@@@@@@:::"+dto);
       System.out.println("@@@cnt"+cnt);
       if(cnt==1) {
               model.addAttribute("id", dto.getId());
               session.removeAttribute("id");
               session.setAttribute("id",dto.getId());
               return "redirect:./mypage";
       }else {
               return "error";
       }

    }
   
//   @GetMapping("member/updateFile")
//	public String updateFile() {
//	   System.out.println("@@@@@@get updatefile");
//		return "/member/updateFile";
//	}
	
	@PostMapping("/member/updateFile")
   public String updateFile(MultipartFile fnameMF,
                   String oldfile,
                   HttpSession session,
                   HttpServletRequest request) throws IOException{
//           String basePath = new ClassPathResource("/static/member/storage").getFile().getAbsolutePath();
             String basePath = Member.getUploadDir();
           if(oldfile !=null  && !oldfile.equals("member.jpg")) { //원본파일 삭제
                   Utility.deleteFile(basePath, oldfile);
           }
           
           //storage에 변경 파일 저장
           Map map = new HashMap();
           map.put("email", session.getAttribute("email"));
           map.put("fname", Utility.saveFileSpring(fnameMF, basePath));
           //디비에 파일명 변경
           System.out.println("####::"+map);
           int cnt = service.updateFile(map);
           System.out.println("####11::"+cnt);
           if(cnt==1) {
                   return "redirect:./mypage";
           }else {
                   return "./error";
           }
	} 
       	@GetMapping("/member/delete")
    	public String delete() {

    		return "/member/delete";
    	}

//    	@PostMapping("/admin/delete")
    	@PostMapping("/member/delete")
    	public String delete(HttpServletRequest request,HttpSession session,
    			String email, String password) {
    		System.out.println("post----------");
    		Map map = new HashMap();
    		map.put("email", email);
    		map.put("password", password);
    		int cnt = service.passwordCheck(map);
    		System.out.println(email+":::"+password);
    		System.out.println("cnt::::"+cnt);
    		int dcnt = 0;
    		if (cnt == 1) {
    			dcnt = service.delete(email);
    		}
    		
    		if (cnt != 1) {
    			return "./passwdError";
    		}
    		else if (dcnt == 1) {
    			System.out.println("삭제 성공");
    			session.invalidate();
    			return "redirect:/";
    		}
    		else {
    			return "./error";
    		}

    	}
}