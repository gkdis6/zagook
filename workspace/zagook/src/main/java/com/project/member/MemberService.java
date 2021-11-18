package com.project.member;


import java.util.Map;

public interface MemberService {

	int loginCheck(Map<String, String> map);

	MemberDTO read(String id);
	
	int duplicatedId(String id);

	int duplicatedEmail(String email);

	int create(MemberDTO dto);

	int update(MemberDTO dto);
	
	//카카오 소셜
	MemberDTO kakaoread(String email);
	int kakaocreate(MemberDTO dto);
	int kakaoupdate(MemberDTO dto);
	int kakaoCheck(Map<String, String> map);

}
