package com.kh.jd.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CommentController {
	
	
	 @Autowired 
	 CommentService cService;
	 // 댓글 리스트
	 @RequestMapping(value = "/listNotice/commentList", method = RequestMethod.GET)
	 public List<Comment> getCommentList(@PathVariable("notice_no") int notice_no){
		 System.out.println("List");
		 List<Comment> commentList = cService.getCommentList(notice_no);
		 return commentList;
	 }
	 //댓글 등록
	 @RequestMapping(value ="/listNotice/writeComment", method = RequestMethod.POST)
	 @ResponseBody
	 public int writeStudentComment(Comment comment) {
		 System.out.println("댓글 등록");
		 return cService.writeNoticeComment(comment);
	 }
	 //댓글 카운트
	 @RequestMapping(value="/listNotice/countComment/{notice_no}")
	 @ResponseBody
	 public int getCountComment(@PathVariable("notice_no") int notice_no) {
		 return cService.countNoticeComment(notice_no);
	 }
	 //댓글 수정
	 @RequestMapping(value="/listNotice/updateComment/{comment_number}", method = RequestMethod.POST)
	 @ResponseBody
	 public int updateStudentComment(@PathVariable("comment_number") int comment_number, String comment_con) {
		 return cService.updateNoticeComment(comment_number, comment_con);
	 }
	 //댓글 삭제
	 @RequestMapping(value="/listNotice/deleteStudentComment/{comment_number}", method = RequestMethod.POST)
	 @ResponseBody
	 public int deleteStudentComment(int comment_number) {
		 return cService.deleteNoticeComment(comment_number);
	 }

}
