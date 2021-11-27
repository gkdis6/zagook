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
   
   @GetMapping("/modallogin")
   public String loginmodal() {
	   System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@");
	   return "/loginmodal";
   }
   
   @GetMapping("/member/login")
   public String login(HttpServletRequest request) {
      /*荑좏궎�꽕�젙*/
        String c_id = "";     // ID ���옣�뿬遺�瑜� ���옣�븯�뒗 蹂��닔, Y
        String c_email_val = ""; // ID 媛�
         
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
        /*---荑좏궎 �꽕�젙 �걹----------------------------*/
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
      if(cnt>0) { //�쉶�썝
         
         //grade>> String grade = service.getGrade(map.get("id"));
         session.setAttribute("id", map.get("id"));
         session.setAttribute("email",map.get("email"));
         session.setAttribute("grade",dto.getGrade());
         
         System.out.println("seid:::"+session.getAttribute("id"));
         System.out.println("seem:::"+session.getAttribute("email"));

         
             // grade >>   session.setAttribute("grade", grade);
             //Cookie ���옣, id ���옣 �뿬遺� 諛� id
             Cookie cookie = null;
             String c_id = map.get("c_id");
            //if 荑좏궎媛� ���옣--
             if(c_id != null) {
                 cookie = new Cookie("c_id",c_id ); //c_id=> Y
                 cookie.setMaxAge(60 * 60 * 24 * 365);//1�뀈
                 response.addCookie(cookie);
                 
                 cookie = new Cookie("c_email_val",map.get("email"));
                 cookie.setMaxAge(60 * 60 * 24 * 365);//1�뀈
                 response.addCookie(cookie);
             }else { //泥댄겕 �븞�븯硫� "" �꽔�뼱 吏��슦湲�
                 cookie = new Cookie("c_id",""); //荑좏궎 �궘�젣
                 cookie.setMaxAge(0);
                 response.addCookie(cookie);
                 
                 cookie = new Cookie("c_email_val","");//荑좏궎 �궘�젣
                 cookie.setMaxAge(0);
                 response.addCookie(cookie);             
             }
      }
      
      if(cnt>0) {
         System.out.println("email:::"+session.getAttribute("email"));
         System.out.println("id:::"+session.getAttribute("id"));
            return "redirect:/";
         
      }else {
         model.addAttribute("msg","�븘�씠�뵒 �삉�뒗 鍮꾨�踰덊샇瑜� �옒紐� �엯�젰 �뻽嫄곕굹 <br>�쉶�썝�씠 �븘�떃�땲�떎. �쉶�썝媛��엯 �븯�꽭�슂");
         return "/member/errorMsg";
      }
      
   }
   
   @GetMapping("/member/logout")
   public String logout(HttpSession session) {
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
    	 System.out.println("###::媛��엯");
    	 model.addAttribute("msg","媛��엯�씠 �셿猷� �릺�뿀�뒿�땲�떎.<br>媛��엯�븯�떊 �젙蹂대줈 濡쒓렇�씤 �빐二쇱꽭�슂.");
    	 System.out.println("model::媛��엯"+model);
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
         //map�뿉 �뱾�뼱媛� data
         map.put("str", email+" 濡� 媛��엯�븳 �궡�뿭�씠 議댁옱�빀�땲�떎. 濡쒓렇�씤 �빐二쇱꽭�슂.");
      }else {
         map.put("str", email+"�뒗 以묐났�븘�떂, �궗�슜媛��뒫 �빀�땲�떎.");
      }
      return map;
   }
   //id 以묐났�솗�씤
   @GetMapping(value="/member/idcheck",produces="application/json;charset=utf-8")
   @ResponseBody
   public Map<String,String> idcheck(String id){
      int cnt = service.duplicatedId(id);
      
      Map<String,String> map = new HashMap<String,String>();
      if(cnt>0) {
         //map�뿉 �뱾�뼱媛� data
         map.put("str", id+"��/�뒗 以묐났�릺�뼱 �궗�슜�븷 �닔 �뾾�뒿�땲�떎.");
      }else {
         map.put("str", id+"��/�뒗 �궗�슜媛��뒫 �빀�땲�떎.");
      }
      return map;
   }
   //留덉씠�럹�씠吏�
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
   
	
	@PostMapping("/member/updateFile")
   public String updateFile(MultipartFile fnameMF,
                   String oldfile,
                   HttpSession session,
                   HttpServletRequest request) throws IOException{
//           String basePath = new ClassPathResource("/static/member/storage").getFile().getAbsolutePath();
             String basePath = Member.getUploadDir();
           if(oldfile !=null  && !oldfile.equals("member.jpg")) { //�썝蹂명뙆�씪 �궘�젣
                   Utility.deleteFile(basePath, oldfile);
           }
           
           //storage�뿉 蹂�寃� �뙆�씪 ���옣
           Map map = new HashMap();
           map.put("email", session.getAttribute("email"));
           map.put("fname", Utility.saveFileSpring(fnameMF, basePath));
           //�뵒鍮꾩뿉 �뙆�씪紐� 蹂�寃�
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
    			System.out.println("�궘�젣 �꽦怨�");
    			session.invalidate();
    			return "redirect:/";
    		}
    		else {
    			return "./error";
    		}

    	}
}