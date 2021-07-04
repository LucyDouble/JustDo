package com.kh.jd.notice;

import java.util.List;
import java.util.Map;

public interface NoticeService {

	//목록조회
	public List<Notice> listNotice(int startPage, int limit,Map<String, Object> map);
	//페이징
	public int getListCount(Map<String, Object> map);
	//글조회
	public Notice viewNotice(int notice_no);
	//글등록
	public int addNotice(Map<String, Object> map);
	//글삭제
	public int removeNotice(int notice_no);
	//글수정
	public int editNotice(Map<String, Object> map);
	//삭제셀렉문
	public Notice checkNotice(Notice notice);
}