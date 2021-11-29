package com.project.notice;

import java.util.List;
import java.util.Map;

public interface NoticeService {

	int create(NoticeDTO dto);

	NoticeDTO read(int noticeno);

	int upViewcnt(int noticeno);

	int total(Map map);

	List<NoticeDTO> list(Map map);

	int passcheck(Map map);

	int update(NoticeDTO dto);

	int delete(int noticeno);

}
