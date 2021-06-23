package com.kh.jd.lecture;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Lecture {
	private int lecture_no;
	private int teacher_number;
	private String lecture_title;
	private int lecture_limit;
	private String lecture_major;
	private String lecture_day;
	private String lecture_reference;
	private String lecture_target;
	private Date lecture_start;
	private Date lecture_end;
	private int lecture_state;
	private int lectureclass_class;
	private String lectureclass_start;
	private String lectureclass_end;
	private int lectureclass_no;
	
	@Override
	public String toString() {
		return "Lecture [lecture_no=" + lecture_no + ", teacher_number=" + teacher_number + ", lecture_title="
				+ lecture_title + ", lecture_limit=" + lecture_limit + ", lecture_major=" + lecture_major
				+ ", lecture_day=" + lecture_day + ", lecture_reference=" + lecture_reference + ", lecture_target="
				+ lecture_target + ", lecture_start=" + lecture_start + ", lecture_end=" + lecture_end
				+ ", lecture_state=" + lecture_state + ", lectureclass_class=" + lectureclass_class
				+ ", lectureclass_start=" + lectureclass_start + ", lectureclass_end=" + lectureclass_end
				+ ", lectureclass_no=" + lectureclass_no + "]";
	}

	public int getLecture_no() {
		return lecture_no;
	}

	public void setLecture_no(int lecture_no) {
		this.lecture_no = lecture_no;
	}

	public int getTeacher_number() {
		return teacher_number;
	}

	public void setTeacher_number(int teacher_number) {
		this.teacher_number = teacher_number;
	}

	public String getLecture_title() {
		return lecture_title;
	}

	public void setLecture_title(String lecture_title) {
		this.lecture_title = lecture_title;
	}

	public int getLecture_limit() {
		return lecture_limit;
	}

	public void setLecture_limit(int lecture_limit) {
		this.lecture_limit = lecture_limit;
	}

	public String getLecture_major() {
		return lecture_major;
	}

	public void setLecture_major(String lecture_major) {
		this.lecture_major = lecture_major;
	}

	public String getLecture_day() {
		return lecture_day;
	}

	public void setLecture_day(String lecture_day) {
		this.lecture_day = lecture_day;
	}

	public String getLecture_reference() {
		return lecture_reference;
	}

	public void setLecture_reference(String lecture_reference) {
		this.lecture_reference = lecture_reference;
	}

	public String getLecture_target() {
		return lecture_target;
	}

	public void setLecture_target(String lecture_target) {
		this.lecture_target = lecture_target;
	}

	public Date getLecture_start() {
		return lecture_start;
	}

	public void setLecture_start(Date lecture_start) {
		this.lecture_start = lecture_start;
	}

	public Date getLecture_end() {
		return lecture_end;
	}

	public void setLecture_end(Date lecture_end) {
		this.lecture_end = lecture_end;
	}

	public int getLecture_state() {
		return lecture_state;
	}

	public void setLecture_state(int lecture_state) {
		this.lecture_state = lecture_state;
	}

	public int getLectureclass_class() {
		return lectureclass_class;
	}

	public void setLectureclass_class(int lectureclass_class) {
		this.lectureclass_class = lectureclass_class;
	}

	public String getLectureclass_start() {
		return lectureclass_start;
	}

	public void setLectureclass_start(String lectureclass_start) {
		this.lectureclass_start = lectureclass_start;
	}

	public String getLectureclass_end() {
		return lectureclass_end;
	}

	public void setLectureclass_end(String lectureclass_end) {
		this.lectureclass_end = lectureclass_end;
	}

	public int getLectureclass_no() {
		return lectureclass_no;
	}

	public void setLectureclass_no(int lectureclass_no) {
		this.lectureclass_no = lectureclass_no;
	}
	
	
}
