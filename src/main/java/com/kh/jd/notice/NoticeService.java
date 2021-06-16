package com.kh.jd.notice;

import java.util.List;

public interface NoticeService {

	//목록조회
	public List<Notice> listNotice();
	//글조회
	public Notice viewNotice(int notice_no);
	//글등록
	
}