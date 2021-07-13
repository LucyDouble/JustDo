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
	public int updateNoticeComment(String comment_con, int comment_number);
//	비디오 댓글 리스트
	public List<Comment> getVideoCommentList(int video_no);
//	비디오 댓글 작성
	public int writeVideoComment(Comment comment);
//	비디오 댓글 카운트
	public int countVideoComment(int video_no);
//	비디오 댓글 삭제
	public int deleteVideoComment(int comment_number);
//	비디오 댓글 수정
	public int updateVideoComment(String comment_con,int comment_number);
}
