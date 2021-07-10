package com.kh.jd.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service("cService")
public class CommentServiceImpl implements CommentService{
@Autowired
CommentDAO dao;
	@Override
	public int writeNoticeComment(Comment comment) {
		int result = dao.writeNoticeComment(comment);
		return result;
	}
	@Override
	public List<Comment> getCommentList(int notice_no) {
		return dao.getCommentList(notice_no);
	}
	@Override
	public int countNoticeComment(int notice_no) {
		int result = dao.countNoticeComment(notice_no);
		return result;
	}
	@Override
	public int deleteNoticeComment(int comment_number) {
		int result = dao.deleteNoticeComment(comment_number);
		return result;
	}
	@Override
	public int updateNoticeComment(int comment_number, String comment_con) {
		int result = dao.updateNoticeComment(comment_number, comment_con);
		return result;
	}

}
