package com.project.friend;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.project.friend.FriendServiceImpl")
public class FriendServiceImpl implements FriendService {
	
	@Autowired
	private FriendMapper mapper;
	
	@Override
	public List<FriendDTO> friendList(Map map) {
		// TODO Auto-generated method stub
		return mapper.friendList(map);
	}

	@Override
	public int delete_friend(Map map) {
		// TODO Auto-generated method stub
		return mapper.delete_friend(map);
	}

}
