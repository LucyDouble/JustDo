package com.kh.jd.comment;

import java.sql.Date;

public class Comment {
	/*
	 * COMMENT_NUMBER NOT NULL NUMBER MANAGER_NUMBER NUMBER STUDENT_NUMBER NUMBER
	 * TEACHER_NUMBER NUMBER NOTICE_NO NUMBER VIDEO_NO NUMBER WRITE_DATE NOT NULL
	 * DATE
	 */
	private int comment_number;
	private int manager_number;
	private int student_number;
	private int teacher_number;
	private int notice_no;
	private Date write_date;
	private String comment_con;
	private String student_name;
	private String teacher_name;
	private String manager_name;
	
	
	@Override
	public String toString() {
		return "Comment [comment_number=" + comment_number + ", manager_number=" + manager_number + ", student_number="
				+ student_number + ", teacher_number=" + teacher_number + ", notice_no=" + notice_no + ", write_date="
				+ write_date + ", comment_con=" + comment_con + ", student_name=" + student_name + ", teacher_name="
				+ teacher_name + ", manager_name=" + manager_name + "]";
	}

	public String getStudent_name() {
		return student_name;
	}


	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}

	public String getTeacher_name() {
		return teacher_name;
	}

	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}

	public String getManager_name() {
		return manager_name;
	}

	public void setManager_name(String manager_name) {
		this.manager_name = manager_name;
	}



	public String getComment_con() {
		return comment_con;
	}

	public void setComment_con(String comment_con) {
		this.comment_con = comment_con;
	}

	public int getComment_number() {
		return comment_number;
	}

	public void setComment_number(int comment_number) {
		this.comment_number = comment_number;
	}

	public int getManager_number() {
		return manager_number;
	}

	public void setManager_number(int manager_number) {
		this.manager_number = manager_number;
	}

	public int getStudent_number() {
		return student_number;
	}

	public void setStudent_number(int student_number) {
		this.student_number = student_number;
	}

	public int getTeacher_number() {
		return teacher_number;
	}

	public void setTeacher_number(int teacher_number) {
		this.teacher_number = teacher_number;
	}

	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public Date getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}

}