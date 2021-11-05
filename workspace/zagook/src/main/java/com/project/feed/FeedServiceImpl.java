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
	public List<FeedDTO> list(String id) {
		// TODO Auto-generated method stub
		return mapper.list(id);
	}

	@Override
	public int like(Map map) {
		// TODO Auto-generated method stub
		return mapper.like(map);
	}

	@Override
	public List<String> tag(int contentsno) {
		// TODO Auto-generated method stub
		return mapper.tag(contentsno);
	}
	
}
