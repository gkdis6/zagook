package com.project.member;


import java.util.Map;

public interface MemberService {

	int loginCheck(Map<String, String> map);

	MemberDTO read(String id);
	
	int duplicatedId(String id);

	int duplicatedEmail(String email);

	int create(MemberDTO dto);

	int kakaocreate(MemberDTO dto);

}
