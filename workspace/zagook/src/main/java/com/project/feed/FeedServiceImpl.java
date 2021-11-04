package com.project.feed;

import java.util.List;

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

}
