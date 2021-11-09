package com.project.feed;

import java.util.List;
import java.util.Map;

public interface FeedService {
	List<FeedDTO> list(String id);
	int like(Map map);
	List<String> tag(int contentsno);
}
