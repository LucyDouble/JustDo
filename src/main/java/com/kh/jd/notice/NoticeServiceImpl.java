package com.kh.jd.notice;

import java.util.List;
import java.util.Map;

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
	@Override
	//글조회
	public Notice viewNotice(int notice_no) {
		return noticeDao.viewNotice(notice_no);
	}
	@Override
	//글등록
	public int addNotice(Map<String,Object> add) {
		return noticeDao.addNotice(add);
	}
	@Override
	//글삭제
	public int removeNotice(int notice_no) {
		int result = 0;
		result = noticeDao.removeNotice(notice_no);
		return result;
	}
	@Override
	//글수정
	public int editNotice(Map<String,Object> map) {
		return noticeDao.editNotice(map);
	}
}
