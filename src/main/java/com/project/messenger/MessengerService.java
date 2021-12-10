package com.project.messenger;

import java.util.ArrayList;

public interface MessengerService {

	ArrayList<MessengerDTO> messageList(MessengerDTO dto);

	ArrayList<MessengerDTO> roomContentList(MessengerDTO dto);

	int messageSendInlist(MessengerDTO dto);

	int countUnread(MessengerDTO mto);

	String getOtherProfile(MessengerDTO mto);

	int messageReadChk(MessengerDTO dto);

	int existChat(MessengerDTO dto);

	int maxRoom(MessengerDTO dto);

	String selectRoom(MessengerDTO dto);

}
