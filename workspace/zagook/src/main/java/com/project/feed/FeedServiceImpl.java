package com.project.feed;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.project.feed.FeedServiceImpl")
public class FeedServiceImpl implements FeedService {

	@Autowired
	  private FeedMapper mapper;

	@Override
	public List<FeedDTO> list(FeedDTO dto) {
		// TODO Auto-generated method stub
		return mapper.list(dto);
	}
	
	@Override
	public List<FeedDTO> listbytime(FeedDTO dto) {
		// TODO Auto-generated method stub
		return mapper.listbytime(dto);
	}
	
	@Override
	public List<FeedDTO> mylist(FeedDTO dto) {
		// TODO Auto-generated method stub
		return mapper.mylist(dto);
	}
	
	@Override
	public List<FeedDTO> mylistbytime(FeedDTO dto) {
		// TODO Auto-generated method stub
		return mapper.mylistbytime(dto);
	}

	@Override
	public int likecheck(Map map) {
		// TODO Auto-generated method stub
		return mapper.likecheck(map);
	}

	@Override
	public List<String> tag(int contentsno) {
		// TODO Auto-generated method stub
		return mapper.tag(contentsno);
	}

	@Override
	public FeedDTO profile(String id) {
		// TODO Auto-generated method stub
		return mapper.profile(id);
	}

	@Override
	public int unlike(Map map) {
		// TODO Auto-generated method stub
		return mapper.unlike(map);
	}

	@Override
	public int updatelikecnt(Map map) {
		// TODO Auto-generated method stub
		return mapper.updatelikecnt(map);
	}

	@Override
	public int like(Map map) {
		// TODO Auto-generated method stub
		return mapper.like(map);
	}

	@Override
	public int likecnt(Map map) {
		// TODO Auto-generated method stub
		return mapper.likecnt(map);
	}
}
