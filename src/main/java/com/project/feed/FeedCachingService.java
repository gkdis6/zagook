package com.project.feed;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

@Service("com.project.feed.FeedCachingService")
public class FeedCachingService {
	private List<FeedDTO> sorted_list;
	private int paging_num;
	
	public FeedCachingService() {
		super();
		sorted_list = new ArrayList<>();
		paging_num = 0;
	}
	
	@Cacheable(value="sorted_list")
	public void saveSortedList(List<FeedDTO> src) {
		sorted_list = src;	
    }
	
	public List<FeedDTO> getSubList() {
		List<FeedDTO> subList = new ArrayList<>();
		
		int i = paging_num;
		int eno = paging_num + 10;
		while (i < eno) {
			FeedDTO tmp;
			try {
				tmp = sorted_list.get(i);
			} catch(IndexOutOfBoundsException e) {
				e.printStackTrace();
				return (subList);
			}
			subList.add(tmp);
			i++;
		}
		paging_num = eno;
		return (subList);
	}
	
	@CacheEvict(value="sorted_list")
    public void depleteList() {
		paging_num = 0;
    }
	
	public int getPagingNum() {
		return paging_num;
	}
}
