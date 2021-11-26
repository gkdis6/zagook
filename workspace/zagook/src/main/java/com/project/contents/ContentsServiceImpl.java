package com.project.contents;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.project.contents.ContentsServiceImpl")
public class ContentsServiceImpl implements ContentsService {
	@Autowired
	private ContentsMapper mapper;

	@Override
	public int create(ContentsDTO dto) {
		// TODO Auto-generated method stub
		return mapper.create(dto);
	}

	@Override
	public int update(ContentsDTO dto) {
		// TODO Auto-generated method stub
		return mapper.update(dto);
	}

	@Override
	public int total(Map map) {
		// TODO Auto-generated method stub
		return mapper.total(map);
	}

	@Override
	public List<ContentsDTO> list(Map map) {
		// TODO Auto-generated method stub
		return mapper.list(map);
	}

	@Override
	public int updateFile(Map map) {
		// TODO Auto-generated method stub
		return mapper.updateFile(map);
	}

	@Override
	public ContentsDTO read(int contentsno) {
		// TODO Auto-generated method stubS
		return mapper.read(contentsno);
	}

	@Override
	public ContentsDTO detail(int contentsno) {
		// TODO Auto-generated method stub
		return mapper.detail(contentsno);
	}

	@Override
	public int delete(int contentsno) {
		// TODO Auto-generated method stub
		return mapper.delete(contentsno);
	}

	@Override
	public int passcheck(String passwd) {
		// TODO Auto-generated method stub
		return mapper.passcheck(passwd);
	}

	@Override
	public int create2(ContentsDTO dto) {
		// TODO Auto-generated method stub
		return mapper.create2(dto);
	}

	@Override
	public int create3(ContentsDTO dto) {
		// TODO Auto-generated method stub
		return mapper.create3(dto);
	}

	@Override
	public int delete2(int contentsno) {
		// TODO Auto-generated method stub
		return mapper.delete2(contentsno);
	}

	@Override
	public int update2(ContentsDTO dto) {
		// TODO Auto-generated method stub
		return mapper.update2(dto);
	}

	@Override
	public int likeCnt(Map map) {
		// TODO Auto-generated method stub
		return mapper.likeCnt(map);
	}

	@Override
	public List<String> getTag(int contentsno) {
		// TODO Auto-generated method stub
		return mapper.getTag(contentsno);
	}

	@Override
	public List<Map> searchInput(String searchInput) {
		// TODO Auto-generated method stub
		return mapper.searchInput(searchInput);
	}

	@Override
	public List<Map> searchInput_friend(String searchInput) {
		// TODO Auto-generated method stub
		return mapper.searchInput_friend(searchInput);
	}

	@Override
	public int updateLike(Map map) {
		// TODO Auto-generated method stub
		return mapper.updateLike(map);
	}

	@Override
	public int likeCheck(Map map) {
		// TODO Auto-generated method stub
		return mapper.likeCheck(map);
	}

	@Override
	public int like(Map map) {
		// TODO Auto-generated method stub
		return mapper.like(map);
	}

	@Override
	public int unlike(Map map) {
		// TODO Auto-generated method stub
		return mapper.unlike(map);
	}

}
