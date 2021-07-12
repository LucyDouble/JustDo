package com.kh.jd.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CommentController {

	@Autowired
	CommentService cService;

	// 댓글 리스트
	@RequestMapping(value = "/listNotice/commentList/{notice_no}", method = RequestMethod.GET)
	@ResponseBody
	public List<Comment> getCommentList(@PathVariable("notice_no") int notice_no) {
		System.out.println("List");
		List<Comment> commentList = cService.getCommentList(notice_no);
		System.out.println(notice_no);
		return commentList;
	}

	// 댓글 등록
	@RequestMapping(value = "/listNotice/writeComment", method = RequestMethod.POST)
	@ResponseBody
	public int writeStudentComment( @RequestParam("writer_number")  int writer_number, Comment comment) {
		if (writer_number == 20001) {
			comment.setManager_number(writer_number);
		} else if (writer_number < 20001) {
			comment.setStudent_number(writer_number);
		} else {
			comment.setTeacher_number(writer_number);
		}

		System.out.println("댓글 등록");
		System.out.println(comment);
		System.out.println(writer_number);
		System.out.println(comment.getVideo_no());
		System.out.println(comment.getComment_number());
		System.out.println(comment.getTeacher_name());
		System.out.println(comment.getStudent_number());

		return cService.writeNoticeComment(comment);
	}

	// 댓글 카운트
	@RequestMapping(value = "/listNotice/countComment/{notice_no}")
	@ResponseBody
	public int getCountComment(@PathVariable("notice_no") int notice_no) {
		return cService.countNoticeComment(notice_no);
	}

	// 댓글 수정
	@RequestMapping(value = "/listNotice/updateComment/{comment_number}", method = RequestMethod.POST)
	@ResponseBody
	public int updateStudentComment(@PathVariable("comment_number") int comment_number, String comment_con) {
		return cService.updateNoticeComment(comment_number, comment_con);
	}

	// 댓글 삭제
	@RequestMapping(value = "/listNotice/deleteComment/{comment_number}", method = RequestMethod.POST)
	@ResponseBody
	public int deleteStudentComment(int comment_number) {
		return cService.deleteNoticeComment(comment_number);
	}

}
