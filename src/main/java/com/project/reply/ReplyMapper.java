package com.project.reply;

import java.util.List;
import java.util.Map;

public interface ReplyMapper {

	List<ReplyDTO> call_replyList(Map map);

	int write_reply(Map map);

	ReplyDTO get_reply(int rnum);

	int delete_reply(Map map);

	int reply_count(Map map);

	int replycnt_update(Map map);

}
