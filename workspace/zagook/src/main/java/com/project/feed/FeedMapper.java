package com.project.feed;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FeedMapper {
	List<FeedDTO> list(String id);
	int like(Map map);
	List<String> tag(int contentsno);
	FeedDTO profile(String id);
}
