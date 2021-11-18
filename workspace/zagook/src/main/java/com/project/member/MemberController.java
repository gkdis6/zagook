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
import com.zaxxer.hikari.util.SuspendResumeLock;

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
        String c_id_val = ""; // ID 값
         
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
        /*---쿠키 설정 끝----------------------------*/
        request.setAttribute("c_id", c_id);
        request.setAttribute("c_id_val", c_id_val);
      return "/member/login";
   }
   
   @PostMapping("/member/login")
   public String login(@RequestParam Map<String, String> map,
         HttpSession session,
         HttpServletResponse response,
         Model model, String id) {
      int cnt = service.loginCheck(map);
      MemberDTO dto = service.read(id);
      System.out.println("dto:::::"+dto);
      //cnt>0 logincheck가 성공
      if(cnt>0) { //회원
         
         //grade>> String grade = service.getGrade(map.get("id"));
         System.out.println("111:::"+dto.getEmail());
         System.out.println("222:::"+model);
         session.setAttribute("id", map.get("id"));
         session.setAttribute("email",dto.getEmail());
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
                 
                 cookie = new Cookie("c_id_val",map.get("id"));
                 cookie.setMaxAge(60 * 60 * 24 * 365);//1년
                 response.addCookie(cookie);
             }else { //체크 안하면 "" 넣어 지우기
                 cookie = new Cookie("c_id",""); //쿠키 삭제
                 cookie.setMaxAge(0);
                 response.addCookie(cookie);
                 
                 cookie = new Cookie("c_id_val","");//쿠키 삭제
                 cookie.setMaxAge(0);
                 response.addCookie(cookie);             
             }
      }//ifcnt>0 end
      
      if(cnt>0) {
//         model.addAttribute("mssg","sdsd");
//         return "/member/loginMsg";
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
   public String crate(MemberDTO dto) throws IOException{
//      String upDir = new ClassPathResource("/static/member/storage").getFile().getAbsolutePath();
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
	   System.out.println("map:::"+map);
	   System.out.println("model:::"+model);
      if(id == null) {
         id = (String) session.getAttribute("id");
         System.out.println("@@@@@@@@@@@@#@!##@#@!#!@##!@#@#@#@!::::"+id);
      }
      if(email == null) {
         email = (String) session.getAttribute("email");
         System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%::::"+email);
      }

      MemberDTO dto = service.read(id);
      System.out.println("dto:::"+dto);
      MemberDTO sdto = service.kakaoread(email);
      System.out.println("sdto:::"+sdto);
      model.addAttribute("social", sdto.getSocial());
//      System.out.println("sssssooooo:::"+dto.getSocial());
      System.out.println("sssssooooo:::"+sdto.getSocial());
      System.out.println("GetSocial::::"+model.getAttribute("social"));
      //소셜 회원이면 -----------------------------------------------
      if(model.getAttribute("social").equals("kakao")) {
//      if(model.getAttribute("social").equals("kakao")) {
         System.out.println("카카오 회원입니다.");
//         System.out.println("dto1111::::"+dto);
         model.addAttribute("sdto", sdto);
         return "/member/mypage";
      }
      System.out.println("dto1111::::"+dto);
      System.out.println("일반 회원입니다.");
      model.addAttribute("dto",dto);
      return "/member/mypage";
   }
   
   @GetMapping("/member/update")
   public String update(String id,HttpSession session, Model model) {
      if(id == null) {
         id = (String)session.getAttribute("id");
      }
      MemberDTO dto = service.read(id);
      Map map = new HashMap();
      // 소셜 사용자 구분 ======================================
      map.put("social", dto.getSocial());
      map.get("social");
      System.out.println("social:::::"+map.get("social"));
      // ==================================================
      model.addAttribute("dto",dto);
      return "/member/update";
   }
   
   @PostMapping("/member/update")
    public String update(MemberDTO dto,String id, Model model,HttpSession session) {
      model.addAttribute("social", dto.getSocial());
      System.out.println("3333social:::::"+model.getAttribute("social"));
   
      if(model.getAttribute("social").equals("kakao")) {
         System.out.println("@@@@@카카오 회원입니다.");
         int cnt = service.kakaoupdate(dto);
         System.out.println("kakaocnt:::"+cnt);
         
         if(cnt ==1) {
            model.addAttribute("id",dto.getId());
//            session.removeAttribute("id");
//            session.setAttribute("id",dto.getId());
            return "redirect:./mypage";
         }
         else {
            return "error";
         }
      } else {
         
         System.out.println("일반회원 입니다.");
         int cnt = service.update(dto);
         System.out.println("dto:::"+dto);
            System.out.println("cnt:::"+cnt);

            if(cnt==1) {
                    model.addAttribute("id", dto.getId());
                    System.out.println("model:::"+model);
                    System.out.println("dto:::"+dto);
                    session.removeAttribute("id");
                    session.setAttribute("id",dto.getId());
                    // return "redirect:./read";
                    return "redirect:./mypage";
                    //return "redirect:/";
            }else {
                    return "error";
            }
      }
    }
}