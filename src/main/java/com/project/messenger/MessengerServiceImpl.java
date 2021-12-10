package com.project.messenger;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.project.messenger.MessengerServiceImpl")
public class MessengerServiceImpl implements MessengerService {

	@Autowired
	private MessengerMapper mapper;
	
	@Override
	public ArrayList<MessengerDTO> messageList(MessengerDTO dto) {
		// TODO Auto-generated method stub
		return mapper.messageList(dto);
	}

	@Override
	public ArrayList<MessengerDTO> roomContentList(MessengerDTO dto) {
		// TODO Auto-generated method stub
		return mapper.roomContentList(dto);
	}

	@Override
	public int messageSendInlist(MessengerDTO dto) {
		// TODO Auto-generated method stub
		return mapper.messageSendInlist(dto);
	}

	@Override
	public int countUnread(MessengerDTO mto) {
		// TODO Auto-generated method stub
		return mapper.countUnread(mto);
	}

	@Override
	public String getOtherProfile(MessengerDTO mto) {
		// TODO Auto-generated method stub
		return mapper.getOtherProfile(mto);
	}

	@Override
	public int messageReadChk(MessengerDTO dto) {
		// TODO Auto-generated method stub
		return mapper.messageReadChk(dto);
	}

	@Override
	public int existChat(MessengerDTO dto) {
		// TODO Auto-generated method stub
		return mapper.existChat(dto);
	}

	@Override
	public int maxRoom(MessengerDTO dto) {
		// TODO Auto-generated method stub
		return mapper.maxRoom(dto);
	}

	@Override
	public String selectRoom(MessengerDTO dto) {
		// TODO Auto-generated method stub
		return mapper.selectRoom(dto);
	}

}
