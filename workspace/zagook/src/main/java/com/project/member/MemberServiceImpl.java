package com.project.member;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.project.member.MemberServiceImpl")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;



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
