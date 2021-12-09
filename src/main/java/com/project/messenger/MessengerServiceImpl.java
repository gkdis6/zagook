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

}
