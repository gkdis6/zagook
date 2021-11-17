package com.project.friend;

import java.util.List;

public interface MyFriendDAO {
	//팔로우 하기
		void friend(FriendDTO friend);
		
		//언팔로우 하기
		void unfriend(FriendDTO friend);
		
		//팔로우 유무
		int isfriend(FriendDTO friend);
		
		//팔로우 리스트 조회
		List<FriendDTO> selectActiveUserList(int id);
		
		//팔로워 리스트 조회
		List<FriendDTO> selectPassiveUserList(int id2);
		
		//탈퇴시 팔로우삭제
		void deleteUserAllFriend(int id2);
	}