package com.project.member;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.project.member.MemberServiceImpl")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;

	@Override
	public int duplicatedId(String id) {
		// TODO Auto-generated method stub
		return mapper.duplicatedId(id);
	}

	@Override
	public int duplicatedEmail(String email) {
		// TODO Auto-generated method stub
		return mapper.duplicatedEmail(email);
	}

	@Override
	public int create(MemberDTO dto) {
		return mapper.create(dto);
	}

	@Override
	public int loginCheck(Map<String, String> map) {
		return mapper.loginCheck(map);
	}


	@Override
	public MemberDTO read(String id) {
		// TODO Auto-generated method stub
		return mapper.read(id);
	}



}
