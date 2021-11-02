package com.project.member;

import java.util.List;
import java.util.Map;

public interface MemberMapper {




	int loginCheck(Map<String, String> map);


	MemberDTO read(String id);

	

}
