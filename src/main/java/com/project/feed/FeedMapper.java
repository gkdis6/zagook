package com.project.feed;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.friend.FriendDTO;
import com.project.member.MemberDTO;

@Mapper
public interface FeedMapper {
	List<FeedDTO> homelist(FeedDTO dto);
	List<FeedDTO> homelistbyrecent(FeedDTO dto);
	List<FeedDTO> homelistbyold(FeedDTO dto);
	List<FeedDTO> list(FeedDTO dto);
	List<FeedDTO> listbyrecent(FeedDTO dto);
	List<FeedDTO> listbyold(FeedDTO dto);
	List<FeedDTO> mylist(FeedDTO dto);
	List<FeedDTO> mylistbyrecent(FeedDTO dto);
	List<FeedDTO> mylistbyold(FeedDTO dto);
	List<FeedDTO> taglist(FeedDTO dto);
	List<FeedDTO> taglistbyrecent(FeedDTO dto);
	List<FeedDTO> taglistbyold(FeedDTO dto);
	List<FeedDTO> friendlist(FeedDTO dto);
	List<FeedDTO> friendlistbyrecent(FeedDTO dto);
	List<FeedDTO> friendlistbyold(FeedDTO dto);
	List<FeedDTO> notfriendlist(FeedDTO dto);
	List<FeedDTO> notfriendlistbyrecent(FeedDTO dto);
	List<FeedDTO> notfriendlistbyold(FeedDTO dto);
	List<String> tag(int contentsno);
	FeedDTO profile(String id);
	int likecheck(Map map);
	int likecnt(Map map);
	int like(Map map);
	int unlike(Map map);
	int updatelikecnt(Map map);
	int friendcheck(Map map);
	MemberDTO read(String seleted_id);
	FriendDTO friendcheckstatus(Map map);
	int tagcnt(FeedDTO dto);
	int submit_friend(Map map);
	int submit_friend2(Map map);
	int delete_feed(Map map);
}
