package com.project.contents;

import java.util.List;
import java.util.Map;

public interface ContentsService {//요청할 수 있는 인터페이스 선언돼있음(dao 형식)

	int create(ContentsDTO dto);

	int update(ContentsDTO dto);

	int total(Map map);

	List<ContentsDTO> list(Map map);

	int updateFile(Map map);

	ContentsDTO read(int contentsno);
	
	ContentsDTO detail(int contentsno);

	int delete(int contentsno);

	int passcheck(String passwd);

	int create2(ContentsDTO dto);

	int create3(ContentsDTO dto);

	int delete2(int contentsno);

	int update2(ContentsDTO dto);

	int update3(ContentsDTO dto);

}

