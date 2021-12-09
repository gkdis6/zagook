package com.project.messenger;

import java.util.ArrayList;

public interface MessengerMapper {

	int messageSendInlist(MessengerDTO dto);

	ArrayList<MessengerDTO> messageList(MessengerDTO dto);

	ArrayList<MessengerDTO> roomContentList(MessengerDTO dto);

}
