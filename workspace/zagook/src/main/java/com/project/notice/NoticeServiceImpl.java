package com.project.notice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.project.notice.NoticeServiceImpl")
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	private NoticeMapper mapper;

	@Override
	public int create(NoticeDTO dto) {
		// TODO Auto-generated method stub
		return mapper.create(dto);
	}

	@Override
	public NoticeDTO read(int noticeno) {
		// TODO Auto-generated method stub
		return mapper.read(noticeno);
	}

	@Override
	public int upViewcnt(int noticeno) {
		// TODO Auto-generated method stub
		return mapper.upViewcnt(noticeno);
	}

	@Override
	public int total(Map map) {
		// TODO Auto-generated method stub
		return mapper.total(map);
	}

	@Override
	public List<NoticeDTO> list(Map map) {
		// TODO Auto-generated method stub
		return mapper.list(map);
	}

	@Override
	public int passcheck(Map map) {
		// TODO Auto-generated method stub
		return mapper.passcheck(map);
	}

	@Override
	public int update(NoticeDTO dto) {
		// TODO Auto-generated method stub
		return mapper.update(dto);
	}

	@Override
	public int delete(int noticeno) {
		// TODO Auto-generated method stub
		return mapper.delete(noticeno);
	}
}
