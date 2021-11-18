package com.project.feed;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FeedMapper {
	List<FeedDTO> list(FeedDTO dto);
	List<FeedDTO> mylist(FeedDTO dto);
	List<String> tag(int contentsno);
	FeedDTO profile(String id);
	int likecheck(Map map);
	int likecnt(Map map);
	int like(Map map);
	int unlike(Map map);
	int updatelikecnt(Map map);
}
