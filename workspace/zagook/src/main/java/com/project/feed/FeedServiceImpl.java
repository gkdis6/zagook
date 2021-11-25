package com.project.feed;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.member.MemberDTO;

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
	public List<FeedDTO> listbyrecent(FeedDTO dto) {
		// TODO Auto-generated method stub
		return mapper.listbyrecent(dto);
	}
	@Override
	public List<FeedDTO> listbyold(FeedDTO dto) {
		// TODO Auto-generated method stub
		return mapper.listbyold(dto);
	}
	@Override
	public List<FeedDTO> mylist(FeedDTO dto) {
		// TODO Auto-generated method stub
		return mapper.mylist(dto);
	}
	@Override
	public List<FeedDTO> mylistbyrecent(FeedDTO dto) {
		// TODO Auto-generated method stub
		return mapper.mylistbyrecent(dto);
	}
	@Override
	public List<FeedDTO> mylistbyold(FeedDTO dto) {
		// TODO Auto-generated method stub
		return mapper.mylistbyold(dto);
	}
	@Override
	public List<FeedDTO> taglist(FeedDTO dto) {
		// TODO Auto-generated method stub
		return mapper.taglist(dto);
	}
	@Override
	public List<FeedDTO> taglistbyrecent(FeedDTO dto) {
		// TODO Auto-generated method stub
		return mapper.taglistbyrecent(dto);
	}
	@Override
	public List<FeedDTO> taglistbyold(FeedDTO dto) {
		// TODO Auto-generated method stub
		return mapper.taglistbyold(dto);
	}
	@Override
	public List<FeedDTO> friendlist(FeedDTO dto) {
		// TODO Auto-generated method stub
		return mapper.friendlist(dto);
	}
	@Override
	public List<FeedDTO> friendlistbyrecent(FeedDTO dto) {
		// TODO Auto-generated method stub
		return mapper.friendlistbyrecent(dto);
	}
	@Override
	public List<FeedDTO> friendlistbyold(FeedDTO dto) {
		// TODO Auto-generated method stub
		return mapper.friendlistbyold(dto);
	}
	@Override
	public List<FeedDTO> notfriendlist(FeedDTO dto) {
		// TODO Auto-generated method stub
		return mapper.notfriendlist(dto);
	}
	@Override
	public List<FeedDTO> notfriendlistbyrecent(FeedDTO dto) {
		// TODO Auto-generated method stub
		return mapper.notfriendlistbyrecent(dto);
	}
	@Override
	public List<FeedDTO> notfriendlistbyold(FeedDTO dto) {
		// TODO Auto-generated method stub
		return mapper.notfriendlistbyold(dto);
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
	@Override
	public int friendcheck(Map map) {
		// TODO Auto-generated method stub
		return mapper.friendcheck(map);
	}
	@Override
	public MemberDTO read(String seleted_id) {
		// TODO Auto-generated method stub
		return mapper.read(seleted_id);
	}
}
