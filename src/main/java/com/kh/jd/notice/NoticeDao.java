package com.kh.jd.notice;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("noticeDao")
public class NoticeDao {

	@Autowired
	private SqlSession sqlSession;
	//목록 조회
//	public List<Notice> listNotice(){
//		return sqlSession.selectList("Notice.listNotice");
	public List<Notice> listNotice(int startPage, int limit,Map<String, Object> map){
			int startRow = (startPage - 1) * limit;
			RowBounds row = new RowBounds(startRow, limit);
			return sqlSession.selectList("Notice.listNotice", map, row);
	}
	//페이징
	public int getListCount(Map<String, Object> map) {
		return sqlSession.selectOne("Notice.getlistCount",map);
	}
	//글조회
	public Notice viewNotice(int notice_no) {
		return sqlSession.selectOne("Notice.viewNotice", notice_no);
	}
	//글등록
	public int addNotice(Map<String, Object> map) {
		return sqlSession.insert("Notice.addNotice", map);
	}
	//글삭제
	public int removeNotice(int notice_no) {
		return sqlSession.delete("Notice.removeNotice", notice_no);
	}
	//글수정
	public int editNotice(Map<String, Object> edit) {
		return sqlSession.update("Notice.editNotice", edit);
	}
	//조회수
	public void hit(int notice_no) {
		sqlSession.update("Notice.hit", notice_no);
	}
	//삭제 셀렉문(단일업로드때썼음) 
	public Notice checkNotice(Notice notice) {
		return sqlSession.selectOne("Notice.checkNotice", notice);
	}
	//파일업로드
	public int addFile(Map<String, Object> map) {
		return sqlSession.insert("Notice.addFile", map);
	}
	//파일리스트
	public List<Notice> listFile(int notice_no){
		return sqlSession.selectList("Notice.listFile", notice_no);
	}
	//첨부파일삭제
	public void delFile(String notice_filename) {
		sqlSession.delete("Notice.delFile", notice_filename);
	}
}
