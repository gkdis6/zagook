package com.project.member;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.project.Utility.Utility;
import com.sun.mail.util.logging.MailHandler;

@Controller
public class MemberController {

   @Autowired
   @Qualifier("com.project.member.MemberServiceImpl")
   private MemberService service;
   
   @Autowired
   private JavaMailSender mailSender;
   
  
   
   @GetMapping("/modallogin")
   public String loginmodal() {
      System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@");
      return "/loginmodal";
   }
   
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
      MemberDTO dto = service.read(email);
      map.put("id", dto.getId());
      if(cnt>0) { //회원
         //grade>> String grade = service.getGrade(map.get("id"));
         session.setAttribute("id", map.get("id"));
         session.setAttribute("email",map.get("email"));
         session.setAttribute("grade",dto.getGrade());
         
         System.out.println("seid:::"+session.getAttribute("id"));
         System.out.println("seem:::"+session.getAttribute("email"));

         
             // grade >>   session.setAttribute("grade", grade);
             //Cookie 저장
             Cookie cookie = null;
             String c_id = map.get("c_id");
             if(c_id != null) {
                 cookie = new Cookie("c_id",c_id ); //c_id=> Y
                 cookie.setMaxAge(60 * 60 * 24 * 365); //1년
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
      String upDir = Member.getUploadDir();
      String fname = Utility.saveFileSpring(dto.getFnameMF(), upDir);
      int size = (int)dto.getFnameMF().getSize();
      if(size>0) {
         dto.setFname(fname);
      }else{
         dto.setFname("member.jpg");
      }
      
      if(service.create(dto)>0) {
        model.addAttribute("msg","가입이 완료 되었습니다.<br>가입하신 정보로 로그인 해주세요.");
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
         map.put("str", email+" 로 가입한 내역이 존재합니다.");
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
         //map에 들어갈 데이터
         map.put("str", id+"은/는 중복되어 사용할 수 없습니다.");
      }else {
         map.put("str", id+"은/는 사용가능 합니다.");
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
   
   @PostMapping("/member/uppass")
   public String uppass(String email,String password, Model model) {
	   Map map = new HashMap();
       map.put("email", email);
       map.put("password", password);
       int cnt = service.passwordCheck(map);
       
       if(cnt>0) {
    	   MemberDTO dto = service.read(email);
    	   model.addAttribute("dto",dto);
    	   return "/member/update";
       } 
       System.out.println("비밀번호 오류");
	   return "./passwdError";
   }
   
   @GetMapping("/member/update")
   public String update(String id,String email,HttpSession session, Model model) {
      if(email == null) {
         email = (String)session.getAttribute("email");
      }
      MemberDTO dto = service.read(email);
      model.addAttribute("dto",dto);
      return "/member/update";
   }
   
   @PostMapping("/member/update")
    public String update(MemberDTO dto,String id, Model model,HttpSession session) {
	   System.out.println("@@@dto:::"+dto);
      int cnt = service.update(dto);
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

   
   
   @PostMapping("/member/updateFile")
   public String updateFile(MultipartFile fnameMF,
                   String oldfile,
                   HttpSession session,
                   HttpServletRequest request) throws IOException{
             String basePath = Member.getUploadDir();
           if(oldfile !=null  && !oldfile.equals("member.jpg")) { //원본파일 삭제
                   Utility.deleteFile(basePath, oldfile);
           }
           
         //storage
           Map map = new HashMap();
           map.put("email", session.getAttribute("email"));
           map.put("fname", Utility.saveFileSpring(fnameMF, basePath));
           System.out.println("@@@@@img:::"+map);
           //디비
           int cnt = service.updateFile(map);
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

       @PostMapping("/member/delete")
       public String delete(HttpServletRequest request,HttpSession session,
             String email, String password) {
          Map map = new HashMap();
          map.put("email", email);
          map.put("password", password);
          int cnt = service.passwordCheck(map);
          int dcnt = 0;
          if (cnt == 1) {
             dcnt = service.delete(email);
          }
          
          if (cnt != 1) {
             return "/msg/passwdError";
          }
          else if (dcnt == 1) {
              session.invalidate();
             return "/msg/completeMsg";
             
          }
          else {
             return "./error";
          }

       }
       @GetMapping("/member/passcheck")
       public String uppasscheck(HttpServletRequest request,
		   						 Model model,String email, String social) {
    	  MemberDTO dto = service.read(email);
    	  Map map = new HashMap();
    	  map.put("email", dto.getEmail());
    	  map.put("social", dto.getSocial());
    	  int cnt = service.socialCheck(map); //cnt >0 이면 일반회원 
    	  if(cnt > 0) {
    		  System.out.println("일반 사용자:::");
    		  return "/member/uppassch";
    	  }
    	  else {
    		  System.out.println("소셜 사용자입니다:::");
    	      MemberDTO dto1 = service.read(email);
    	      model.addAttribute("dto",dto1);
    		  return "/member/update";
    	  }
       }
       
       

       @RequestMapping("/CheckMail")
       @ResponseBody// AJAX와 URL을 매핑시켜줌 
       public String SendMail(String email, HttpServletRequest request) throws MessagingException{
   		Random random = new Random();
   		String key = "";
   		Gson gson = new Gson();
   		MimeMessage mimemsg = mailSender.createMimeMessage();
//   	SimpleMailMessage message = new SimpleMailMessage();
//   	message.setTo(email);
   		mimemsg.addRecipient(RecipientType.TO, new InternetAddress(email));
   		//스크립트에서 보낸 메일을 받을 사용자 이메일 주소 
   		//입력 키를 위한 코드
   		for(int i =0; i<3;i++) {
   			int index=random.nextInt(25)+65; //A~Z까지 랜덤 알파벳 생성
   			key+=(char)index;
   		}
   		int numIndex=random.nextInt(8999)+1000; //4자리 랜덤 정수를 생성
   		key+=numIndex;
//   		message.setSubject("Zagook 회원가입 인증번호 메일 전송");
   		mimemsg.setSubject("Zagook 회원가입 인증메일 전송");
   		
   		String fileName = "zagook_logo";
   		String path = request.getSession().getServletContext().getRealPath("/")+"resources/static/saveCheck"+fileName;  
   		System.out.println("이미지경로:::"+path);
	   	 String msg="";
//	     msg += "<img width=\"120\" height=\"36\" style=\"margin-top: 0; margin-right: 0; margin-bottom: 32px; margin-left: 0px; padding-right: 30px; padding-left: 30px;\" src=\"../statlc/images/zagook_logo.jpg\" alt=\"\" loading=\"lazy\">";
	   	 msg += "<h1 style=\"font-size: 30px; padding-right: 30px; padding-left: 30px;\">안녕하세요 Zagook을 찾아주셔서 감사합니다.</h1>";
	     msg += "<p style=\"font-size: 17px; padding-right: 30px; padding-left: 30px;\"><br>아래 확인 코드를 Zagook 가입 창이 있는 브라우저 창에 입력하세요.</p>";
	     msg += "<div style=\"padding-right: 30px; padding-left: 30px; margin: 32px 0 40px;\"><table style=\"border-collapse: collapse; border: 0; background-color: #F4F4F4; height: 70px; table-layout: fixed; word-wrap: break-word; border-radius: 6px;\"><tbody><tr><td style=\"text-align: center; vertical-align: middle; font-size: 30px;\">";
	     msg += key;
	     msg += "</td></tr></tbody></table></div>";
   		mimemsg.setText(msg,"utf-8","html");
	    mailSender.send(mimemsg);
   		System.out.println(gson.toJson(key));
        return gson.toJson(key);
       	}
}