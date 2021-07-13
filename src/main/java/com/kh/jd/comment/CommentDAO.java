package com.kh.jd.comment;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommentDAO {
	@Autowired
	SqlSession sqlSession;
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
//	공지사항 댓글 리스트
	public List<Comment> getCommentList(int notice_no){
		return sqlSession.selectList("Comment.noticeCommentList", notice_no);
	}
//	공지사항 댓글 작성
	public int writeNoticeComment(Comment comment) {
		int result = sqlSession.insert("Comment.noticeCommentInsert", comment);
		return result;
	}
//	공지사항 댓글 카운트
	public int countNoticeComment(int notice_no) {
		int result = sqlSession.selectOne("Comment.countNoticeComment", notice_no);
			return result;
	}
//	공지사항 댓글 삭제
	public int deleteNoticeComment(int comment_number) {
		int result = sqlSession.delete("Comment.noticeCommentDelete", comment_number);
		return result;
	}
// 공지 사항 댓글 수정
	public int updateNoticeComment(String comment_con,int comment_number) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("comment_con", comment_con);
		map.put("comment_number", Integer.toString(comment_number)); 
		 

		int result = sqlSession.update("Comment.noticeCommentUpdate", map);
		return result;
	}
}