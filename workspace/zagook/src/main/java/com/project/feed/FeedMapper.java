package com.project.feed;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FeedMapper {
	List<FeedDTO> list(FeedDTO dto);
}
