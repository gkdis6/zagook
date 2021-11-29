package com.project.sociallogin;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.project.member.MemberDTO;
import com.project.member.MemberService;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;

@Controller
public class SocialController {
	
	
	@Autowired
	@Qualifier("com.project.member.MemberServiceImpl")
	private MemberService service;
	
	
	@GetMapping("/kakaologin")
	public String kakaoCallback(String code,
								HttpServletRequest request,
								HttpServletResponse response,
								HttpSession session,								
								Model model,
								String email) {
		 
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
		
		System.out.println("카카오액세스 토큰값:::"+oauthToken.getAccess_token());
		RestTemplate rt2 = new RestTemplate();
		
		//HttpHeader 오브젝트 생성
		HttpHeaders headers2 =new HttpHeaders();
		headers2.add("Authorization","Bearer "+oauthToken.getAccess_token());
		headers2.add("Content-type","application/x-www-form-urlencoded;charset=utf-8");

		HttpEntity<MultiValueMap<String,String>> kakaoProfileRequest2=
				new HttpEntity<>(headers2); 
		
		ResponseEntity<String> response2 = rt2.exchange(
			"https://kapi.kakao.com/v2/user/me",
			HttpMethod.POST,
			kakaoProfileRequest2,
			String.class //String data가 response에 응답
		);
		System.out.println("response.getBody:::"+response2.getBody());
		
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
		MemberDTO sdto = service.read((String) map.get("email"));
		
		System.out.println(":::"+map);
        //회원이면
		if (service.loginCheck(map) == 1) {
			System.out.println("회원입니다.====================");
			session.setAttribute("id",sdto.getId());
			session.setAttribute("email",map.get("email"));
			
			Cookie cookie = null;
//			String k_id = (String) map2.get("id");
			String k_id = sdto.getId();
			String k_email = (String) map.get("email");
			 //if 쿠키값 저장--
            if(k_id != null) { //|| k_email != null 추가
                cookie = new Cookie("c_id",k_id ); //c_id=> Y
                cookie.setMaxAge(60 * 60 * 24 * 365);//1년
                response.addCookie(cookie);
                
                cookie = new Cookie("id",sdto.getId());
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
		}
		if(service.loginCheck(map) == 1) {
			return "redirect:/";
		}
		else {
			System.out.println("소셜을 통한 회원이 아닙니다.===============");
			service.kakaocreate(dto);
			model.addAttribute("msg","가입이 완료 되었습니다.<br>가입하신 정보로 로그인 해주세요.");
			return "/member/signcheck";
		}
	}
	//네이버 로그인
	@GetMapping("/naverlogin")
	public String naverlogin(String code, String state,
							 HttpSession session, HttpServletResponse response,
							 Model model) {
	
		HttpHeaders headers =new HttpHeaders();
		headers.add("Content-type","application/x-www-form-urlencoded;charset=utf-8");
		
		MultiValueMap<String,String> params = new LinkedMultiValueMap<>();
		params.add("grant_type","authorization_code");
		params.add("client_id","ixM36J7baPEJLD3Q1N43");
		params.add("client_secret","cKNIY1gppY");
		params.add("code",code);
		
		HttpEntity<MultiValueMap<String,String>> request=
				new HttpEntity<>(params,headers);
		
		RestTemplate rt = new RestTemplate();
		ResponseEntity<String> response1 = rt.exchange(
				"https://nid.naver.com/oauth2.0/token",
				HttpMethod.POST,
				request,
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
		
		HttpHeaders headers2 =new HttpHeaders();
		headers2.add("Authorization","Bearer "+oauthToken.getAccess_token());
		headers2.add("Content-type","application/x-www-form-urlencoded;charset=utf-8");
		//body와 header값을 갖고 있는 entity가 된다.
		HttpEntity<MultiValueMap<String,String>> request2=
				new HttpEntity<>(headers2); 
		
		
		RestTemplate rt2 = new RestTemplate();
		ResponseEntity<String> response2 = rt2.exchange(
				"https://openapi.naver.com/v1/nid/me",
				HttpMethod.POST,
				request2,
				String.class //String data가 response에 응답
				);
		
		ObjectMapper objectMapper2 = new ObjectMapper();
		NaverProfile naverProfile = null;
		try {
			naverProfile = objectMapper2.readValue(response2.getBody(),NaverProfile.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		MemberDTO dto = new MemberDTO();
		dto.setId(naverProfile.getResponse().getId());
		dto.setPassword(naverProfile.getResponse().getId());
		dto.setEmail(naverProfile.getResponse().getEmail());
		dto.setMname(naverProfile.getResponse().getName());
		System.out.println("dto:::"+dto);
		
		Map map = new HashMap();
		map.put("id", dto.getId());
		map.put("email", dto.getEmail());
		map.put("password",dto.getPassword());
		System.out.println("map:::"+map);
		System.out.println("사용자프로필:::"+response2.getBody());
		
		MemberDTO sdto = service.read((String) map.get("email"));
		
		if (service.loginCheck(map) == 1) {
			System.out.println("회원입니다.====================");
			System.out.println("getId111"+sdto.getId());
			session.setAttribute("id",sdto.getId()); //ID 값 너무 길어서 발췌
			session.setAttribute("email",map.get("email"));
			if(sdto.getId().length()>=10) {
				session.setAttribute("id", sdto.getId().substring(0, 10));
			}
			
			Cookie cookie = null;
//			String k_id = (String) map2.get("id");
			String k_id = sdto.getId();
			String k_email = (String) map.get("email");
			 //if 쿠키값 저장--
            if(k_id != null) { //|| k_email != null 추가
                cookie = new Cookie("c_id",k_id ); //c_id=> Y
                cookie.setMaxAge(60 * 60 * 24 * 365);//1년
                response.addCookie(cookie);
                
                cookie = new Cookie("id",sdto.getId());
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
		}
		if(service.loginCheck(map) == 1) {
			return "redirect:/";
		}
		else {
			System.out.println("소셜을 통한 회원이 아닙니다.===============");
			service.navercreate(dto);
			model.addAttribute("msg","가입이 완료 되었습니다.<br>가입하신 정보로 로그인 해주세요.");
			return "/member/signcheck";
		}
	}
	}
		

