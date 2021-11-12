package com.project.sociallogin;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.project.Utility.Utility;
import com.project.member.Member;
import com.project.member.MemberDTO;
import com.project.member.MemberService;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;

@Controller
public class SocialController {
	
	
	@Autowired
	@Qualifier("com.project.member.MemberServiceImpl")
	private MemberService service;
	
//	@RequestMapping(value="/")
//	public String index() {
//		
//		return "/member/kakaotest";
//	}
	
	
	@GetMapping("/kakaologin")
	public String kakaoCallback(String code,
								HttpServletRequest request,
								HttpServletResponse response,
								HttpSession session,								
								Model model) {
	//post 방식으로 key = value 데이터를 요청(카카오쪽으로)
		 
	RestTemplate rt = new RestTemplate();
	HttpHeaders headers =new HttpHeaders();
	headers.add("Content-type","application/x-www-form-urlencoded;charset=utf-8");
		
	
	MultiValueMap<String,String> params = new LinkedMultiValueMap<>();
	params.add("grant_type","authorization_code");
	params.add("client_id","8b0badea65f50a87408b62085e369711");
	params.add("redirect_uri","http://localhost:8005/kakaologin");
	params.add("code",code);
	
	HttpEntity<MultiValueMap<String,String>> kakaoTokenRequest=
			new HttpEntity<>(params,headers); //body와 header값을 갖고 있는 entity가 된다.
	//response -> response1로 변경
	ResponseEntity<String> response1 = rt.exchange(
		"https://kauth.kakao.com/oauth/token",
		HttpMethod.POST,
		kakaoTokenRequest,
		String.class //String data가 response에 응답
	);
	
		ObjectMapper objectMapper = new ObjectMapper();
		OAuthToken oauthToken = null;
		try {
			oauthToken = objectMapper.readValue(response1.getBody(),OAuthToken.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		System.out.println("카카오액세스 :::"+oauthToken.getAccess_token());
		
		RestTemplate rt2 = new RestTemplate();
		
		//HttpHeader 오브젝트 생성
		HttpHeaders headers2 =new HttpHeaders();
		headers2.add("Authorization","Bearer "+oauthToken.getAccess_token());
		headers2.add("Content-type","application/x-www-form-urlencoded;charset=utf-8");
		//body와 header값을 갖고 있는 entity가 된다.
		HttpEntity<MultiValueMap<String,String>> kakaoProfileRequest2=
				new HttpEntity<>(headers2); 
		
		ResponseEntity<String> response2 = rt2.exchange(
			"https://kapi.kakao.com/v2/user/me",
			HttpMethod.POST,
			kakaoProfileRequest2,
			String.class //String data가 response에 응답
		);
		System.out.println("@@@@@@@@@@@@@@@:::"+response2.getBody());
		
		ObjectMapper objectMapper2 = new ObjectMapper();
		KakaoProfile KakaoProfile = null;
		try {
			KakaoProfile = objectMapper2.readValue(response2.getBody(),KakaoProfile.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		// MemberDTO 객체 생성 > 
		// logincheck 하기 -> 회원, 비회원
		// 회원 -> /main 
		//비회원 -> /insert > /main
		//Username, password, email 필요
		MemberDTO dto = new MemberDTO();
		dto.setId(KakaoProfile.getId().toString());
		dto.setPassword(KakaoProfile.getId().toString());
		dto.setMname(KakaoProfile.getProperties().getNickname());
		dto.setEmail(KakaoProfile.getKakao_account().getEmail());
		Map map = new HashMap();
		map.put("id", dto.getId());
		map.put("email", dto.getEmail());
		map.put("password",dto.getPassword());
		
		HashMap map2 = new HashMap();
		map2.putAll(map);
		map2.put("id", ("kakao-"+map.get("id")));
		System.out.println("##########::::"+map.get("id"));
		System.out.println("@@@@@@@@@@::::"+map2.get("id"));
//		System.out.println("카카오 아이디(번호):"+KakaoProfile.getId());
//		System.out.println("카카오 이메일:"+KakaoProfile.getKakao_account().getEmail());
//		System.out.println("카카오 닉네임:"+KakaoProfile.getProperties().getNickname());
//		System.out.println("카카오 유저네임:"+KakaoProfile.getProperties().getNickname()+"_"+KakaoProfile.getId());
//		System.out.println("카카오 패스워드:"+zagookKey);
        //회원이면
		if (service.loginCheck(map) == 1) {
			System.out.println("회원입니다.====================");
			session.setAttribute("id",map2.get("id"));
			System.out.println("2222@@@@@@@@@@::::"+map2.get("id"));
			System.out.println("?????????:::::"+session.getId());
			Cookie cookie = null;
			System.out.println("===================="+session);
			String k_id = (String) map2.get("id");
			 //if 쿠키값 저장--
            if(k_id != null) {
                cookie = new Cookie("c_id",k_id ); //c_id=> Y
                cookie.setMaxAge(60 * 60 * 24 * 365);//1년
                response.addCookie(cookie);
                
                cookie = new Cookie("id",(String) map2.get("id"));
                cookie.setMaxAge(60 * 60 * 24 * 365);//1년
                response.addCookie(cookie);
            }else { //체크 안하면 "" 넣어 지우기
                cookie = new Cookie("id",""); //쿠키 삭제
                cookie.setMaxAge(0);
                response.addCookie(cookie);
                
                cookie = new Cookie("id","");//쿠키 삭제
                cookie.setMaxAge(0);
                response.addCookie(cookie);             
            }
		}//ifcnt>0 end
		if(service.loginCheck(map) == 1) {
			return "redirect:/"; 
		}
		
		else {
			System.out.println("소셜을 통한 회원이 아닙니다.===============");
//			model.addAttribute("msg","소셜을 통해 가입한 회원이 아닙니다.");
//			return "/member/loginerror"; 
			service.kakaocreate(dto);
			return "redirect:/"; 
		}
	}
		
}
