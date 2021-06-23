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
	private String work_submit;
	private String lecture_class;
	private String lecture_title;
	private int startday;
	private int endday;
	private int teacher_number;
	private int student_number;
	private String name;
	private int rnum;
	private int registration_no;
	
	
	

	
	public int getStudent_number() {
		return student_number;
	}

	public void setStudent_number(int student_number) {
		this.student_number = student_number;
	}

	@Override
	public String toString() {
		return "Work [work_no=" + work_no + ", lecture_no=" + lecture_no + ", work_subject=" + work_subject
				+ ", work_start=" + work_start + ", work_end=" + work_end + ", work_content=" + work_content
				+ ", work_submit=" + work_submit + ", lecture_class=" + lecture_class + ", lecture_title="
				+ lecture_title + ", startday=" + startday + ", endday=" + endday + ", teacher_number=" + teacher_number
				+ ", student_number=" + student_number + ", name=" + name + ", rnum=" + rnum + ", registration_no="
				+ registration_no + "]";
	}

	public int getRegistration_no() {
		return registration_no;
	}

	public void setRegistration_no(int registration_no) {
		this.registration_no = registration_no;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getTeacher_number() {
		return teacher_number;
	}

	public void setTeacher_number(int teacher_number) {
		this.teacher_number = teacher_number;
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
	public void setLecture_class(String lecture_class ) {
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
	public String getWork_submit() {
		return work_submit;
	}
	public void setWork_submit(String work_submit) {
		this.work_submit = work_submit;
	}

	
	

}
