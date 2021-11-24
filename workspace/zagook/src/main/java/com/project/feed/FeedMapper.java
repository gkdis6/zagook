package com.project.feed;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FeedMapper {
	List<FeedDTO> list(FeedDTO dto);
	List<FeedDTO> listbytime(FeedDTO dto);
	List<FeedDTO> mylist(FeedDTO dto);
	List<FeedDTO> mylistbytime(FeedDTO dto);
	List<FeedDTO> friendlist(FeedDTO dto);
	List<FeedDTO> friendlistbytime(FeedDTO dto);
	List<FeedDTO> notfriendlist(FeedDTO dto);
	List<FeedDTO> notfriendlistbytime(FeedDTO dto);
	List<String> tag(int contentsno);
	FeedDTO profile(String id);
	int likecheck(Map map);
	int likecnt(Map map);
	int like(Map map);
	int unlike(Map map);
	int updatelikecnt(Map map);
	int friendcheck(Map map);
}
