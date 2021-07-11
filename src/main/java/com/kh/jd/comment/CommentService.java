package com.kh.jd.comment;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface CommentService {
//	공지사항 댓글 리스트
	public List<Comment> getCommentList(int notice_no);
//	공지사항 댓글 작성
	public int writeNoticeComment(Comment comment);
//	공지사항 댓글 카운트
	public int countNoticeComment(int notice_no);
//	공지사항 댓글 삭제
	public int deleteNoticeComment(int comment_number);
// 공지 사항 댓글 수정
	public int updateNoticeComment(int comment_number, String comment_con);
}