package com.kh.jd.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDao noticeDao;
	@Override
	//목록조회
	public List<Notice> listNotice() {
		return noticeDao.listNotice();
	}
	//글조회
	public Notice viewNotice(int notice_no) {
		return noticeDao.viewNotice(notice_no);
	}
	//글등록
//	public Notice addNotice(int notice_no) {
//		return noticeDao.addNotice(notice_no);
//	}
	
}
