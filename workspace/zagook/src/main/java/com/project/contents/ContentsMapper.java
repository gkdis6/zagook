package com.project.contents;
 
import java.util.List;
import java.util.Map;
 
public interface ContentsMapper {
 
        int create(ContentsDTO dto);
 
        int update(ContentsDTO dto);
 
        int total(Map map);
 
        List<ContentsDTO> list(Map map);
 
        int updateFile(Map map);

		ContentsDTO read(int contentsno);
		
		ContentsDTO detail(int contentsno);

		int passcheck(String passwd);

		int delete(int contentsno);

		int create2(ContentsDTO dto);

		int create3(ContentsDTO dto);

		int delete2(int contentsno);

		int delete3(int contentsno);

		int update2(ContentsDTO dto);

		int like(Map map);

		List<String> getTag(int contentsno);

		List<Map> searchInput(String searchInput);

}
