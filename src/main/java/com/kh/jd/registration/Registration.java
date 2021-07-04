package com.kh.jd.registration;


import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Registration {
	private int registration_no;
	private int lectureclass_no;
	private int student_number;
	private int registration_state;
	private int lectureclass_class;
	private Date lectureclass_start;
	private Date lectureclass_end;
	private String lecture_title;
	private String lecture_reference;
	private String lecture_target;
	private String lecture_start;
	private String lecture_end;
	private int rnum;
	private String name;
	private int lecture_limit;
	private int lectureclass_personnel;
	private String starttime;
	private String endtime;
	
	@Override
	public String toString() {
		return "Registration [registration_no=" + registration_no + ", lectureclass_no=" + lectureclass_no
				+ ", student_number=" + student_number + ", registration_state=" + registration_state
				+ ", lectureclass_class=" + lectureclass_class + ", lectureclass_start=" + lectureclass_start
				+ ", lectureclass_end=" + lectureclass_end + ", lecture_title=" + lecture_title + ", lecture_reference="
				+ lecture_reference + ", lecture_target=" + lecture_target + ", lecture_start=" + lecture_start
				+ ", lecture_end=" + lecture_end + ", rnum=" + rnum + ", name=" + name + ", lecture_limit="
				+ lecture_limit + ", lectureclass_personnel=" + lectureclass_personnel + ", starttime=" + starttime + ", endtime="
				+ endtime + "]";
	}

	public int getRegistration_no() {
		return registration_no;
	}

	public void setRegistration_no(int registration_no) {
		this.registration_no = registration_no;
	}

	public int getLectureclass_no() {
		return lectureclass_no;
	}

	public void setLectureclass_no(int lectureclass_no) {
		this.lectureclass_no = lectureclass_no;
	}

	public int getStudent_number() {
		return student_number;
	}

	public void setStudent_number(int student_number) {
		this.student_number = student_number;
	}

	public int getRegistration_state() {
		return registration_state;
	}

	public void setRegistration_state(int registration_state) {
		this.registration_state = registration_state;
	}

	public int getLectureclass_class() {
		return lectureclass_class;
	}

	public void setLectureclass_class(int lectureclass_class) {
		this.lectureclass_class = lectureclass_class;
	}

	public Date getLectureclass_start() {
		return lectureclass_start;
	}

	public void setLectureclass_start(Date lectureclass_start) {
		this.lectureclass_start = lectureclass_start;
	}

	public Date getLectureclass_end() {
		return lectureclass_end;
	}

	public void setLectureclass_end(Date lectureclass_end) {
		this.lectureclass_end = lectureclass_end;
	}

	public String getLecture_title() {
		return lecture_title;
	}

	public void setLecture_title(String lecture_title) {
		this.lecture_title = lecture_title;
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

	public String getLecture_start() {
		return lecture_start;
	}

	public void setLecture_start(String lecture_start) {
		this.lecture_start = lecture_start;
	}

	public String getLecture_end() {
		return lecture_end;
	}

	public void setLecture_end(String lecture_end) {
		this.lecture_end = lecture_end;
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

	public int getLecture_limit() {
		return lecture_limit;
	}

	public void setLecture_limit(int lecture_limit) {
		this.lecture_limit = lecture_limit;
	}

	public int getLectureclass_personnel() {
		return lectureclass_personnel;
	}

	public void setLectureclass_personnel(int lectureclass_personnel) {
		this.lectureclass_personnel = lectureclass_personnel;
	}

	public String getStarttime() {
		return starttime;
	}

	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}

	public String getEndtime() {
		return endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	
	
}
