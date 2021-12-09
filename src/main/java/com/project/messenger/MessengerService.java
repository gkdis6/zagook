package com.project.messenger;

import java.util.ArrayList;

public interface MessengerService {

	ArrayList<MessengerDTO> messageList(MessengerDTO dto);

	ArrayList<MessengerDTO> roomContentList(MessengerDTO dto);

	int messageSendInlist(MessengerDTO dto);

}
