package com.kh.jd.work;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Work {
	private int work_no;
	private int lecture_no;
	private String work_subject;
	private Date work_start;
	private Date work_end;
	private String work_content;
	private String work_answer;
	private String lecture_class;
	private String lecture_title;
	private int startday;
	private int endday;
	
	
	

	
	@Override
	public String toString() {
		return "Work [work_no=" + work_no + ", lecture_no=" + lecture_no + ", work_subject=" + work_subject
				+ ", work_start=" + work_start + ", work_end=" + work_end + ", work_content=" + work_content
				+ ", work_answer=" + work_answer + ", lecture_class=" + lecture_class + ", lecture_title="
				+ lecture_title + ", startday=" + startday + ", endday=" + endday + "]";
	}

	public int getStartday() {
		return startday;
	}

	public void setStartday(int startday) {
		this.startday = startday;
	}

	public int getEndday() {
		return endday;
	}

	public void setEndday(int endday) {
		this.endday = endday;
	}

	public String getLecture_class() {
		return lecture_class;
	}
	public void setLecture_class(String lecture_class) {
		this.lecture_class = lecture_class;
	}
	public String getLecture_title() {
		return lecture_title;
	}
	public void setLecture_title(String lecture_title) {
		this.lecture_title = lecture_title;
	}
	public int getWork_no() {
		return work_no;
	}
	public void setWork_no(int work_no) {
		this.work_no = work_no;
	}
	public int getLecture_no() {
		return lecture_no;
	}
	public void setLecture_no(int lecture_no) {
		this.lecture_no = lecture_no;
	}
	public String getWork_subject() {
		return work_subject;
	}
	public void setWork_subject(String work_subject) {
		this.work_subject = work_subject;
	}
	public Date getWork_start() {
		return work_start;
	}
	public void setWork_start(Date work_start) {
		this.work_start = work_start;
	}
	public Date getWork_end() {
		return work_end;
	}
	public void setWork_end(Date work_end) {
		this.work_end = work_end;
	}
	public String getWork_content() {
		return work_content;
	}
	public void setWork_content(String work_content) {
		this.work_content = work_content;
	}
	public String getWork_answer() {
		return work_answer;
	}
	public void setWork_answer(String work_answer) {
		this.work_answer = work_answer;
	}

	
	

}
