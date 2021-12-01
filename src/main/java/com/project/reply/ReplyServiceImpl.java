package com.project.reply;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.project.reply.ReplyServiceImpl")
public class ReplyServiceImpl implements ReplyService {
	@Autowired
	private ReplyMapper mapper;

	@Override
	public List<ReplyDTO> call_replyList(Map map) {
		// TODO Auto-generated method stub
		return mapper.call_replyList(map);
	}

	@Override
	public int write_reply(Map map) {
		// TODO Auto-generated method stub
		return mapper.write_reply(map);
	}

	@Override
	public ReplyDTO get_reply(int rnum) {
		// TODO Auto-generated method stub
		return mapper.get_reply(rnum);
	}

	@Override
	public int delete_reply(Map map) {
		// TODO Auto-generated method stub
		return mapper.delete_reply(map);
	}

	@Override
	public int reply_count(Map map) {
		// TODO Auto-generated method stub
		return mapper.reply_count(map);
	}

	@Override
	public int replycnt_update(Map map) {
		// TODO Auto-generated method stub
		return mapper.replycnt_update(map);
	}
}
