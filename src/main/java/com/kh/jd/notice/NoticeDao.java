package com.kh.jd.notice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("noticeDao")
public class NoticeDao {

	@Autowired
	private SqlSession sqlSession;
	
	//목록 조회
	public List<Notice> listNotice(){
		return sqlSession.selectList("Notice.listNotice");
	}
	
	//글조회
	public Notice viewNotice(int notice_no) {
		return sqlSession.selectOne("Notice.viewNotice", notice_no);
	}
	
	//글등록
	
	
	//글수정
	
	
	//글삭제
	
	
}
