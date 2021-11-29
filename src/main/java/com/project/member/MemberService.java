package com.project.member;


import java.util.Map;

public interface MemberService {

	int loginCheck(Map<String, String> map);

	MemberDTO read(String email);
	
	int duplicatedId(String id);

	int duplicatedEmail(String email);

	int create(MemberDTO dto);

	int passwordCheck(Map map);
	
	int update(MemberDTO dto);
	
	int updateFile(Map map);

	int delete(String email);
	
	//카카오 소셜
	int kakaocreate(MemberDTO dto);
	int kakaoupdate(MemberDTO dto);
	int kakaoCheck(Map<String, String> map);
	
	//네이버 소셜
	int navercreate(MemberDTO dto);


}
