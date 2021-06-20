package com.kh.jd.notice;

import java.util.List;
import java.util.Map;

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
	public int addNotice(Map add) {
		return sqlSession.insert("Notice.addNotice", add);
	}
	
	//글삭제
	public int removeNotice(int notice_no) {
		return sqlSession.delete("Notice.removeNotice", notice_no);
		
	}
	//글수정
	public int editNotice(Map edit) {
		System.out.println("다오 map :"  + edit);
		return sqlSession.update("Notice.editNotice", edit);
	}
	
}
