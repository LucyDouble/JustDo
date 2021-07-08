package com.kh.jd.attend;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Attend {
	private int attend_no;
	private int lecture_no;
	private int student_number;
	private String attend_start;
	private int attendStart;
	private String attend_end;
	private int attendEnd;
	private int attend_progress;
	private int lectureclass_no;
	private String lecture_title;
	private int registration_no;
	private int lectureclass_class;
	private String lectureclass_start;
	private int lectureclassStart;
	private String lectureclass_end;
	private int lectureclassEnd;
	private Date attend_date;
	private String lecture_start;
	private String lecture_end;
	private int lecture_state;
	
	
	
	
	
	@Override
	public String toString() {
		return "Attend [attend_no=" + attend_no + ", lecture_no=" + lecture_no + ", student_number=" + student_number
				+ ", attend_start=" + attend_start + ", attendStart=" + attendStart + ", attend_end=" + attend_end
				+ ", attendEnd=" + attendEnd + ", attend_progress=" + attend_progress + ", lectureclass_no="
				+ lectureclass_no + ", lecture_title=" + lecture_title + ", registration_no=" + registration_no
				+ ", lectureclass_class=" + lectureclass_class + ", lectureclass_start=" + lectureclass_start
				+ ", lectureclassStart=" + lectureclassStart + ", lectureclass_end=" + lectureclass_end
				+ ", lectureclassEnd=" + lectureclassEnd + ", attend_date=" + attend_date + ", lecture_start="
				+ lecture_start + ", lecture_end=" + lecture_end + ", lecture_state=" + lecture_state + "]";
	}

	public int getLecture_state() {
		return lecture_state;
	}

	public void setLecture_state(int lecture_state) {
		this.lecture_state = lecture_state;
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

	public Date getAttend_date() {
		return attend_date;
	}
	public void setAttend_date(Date attend_date) {
		this.attend_date = attend_date;
	}
	public int getAttend_no() {
		return attend_no;
	}
	public void setAttend_no(int attend_no) {
		this.attend_no = attend_no;
	}
	public int getLecture_no() {
		return lecture_no;
	}
	public void setLecture_no(int lecture_no) {
		this.lecture_no = lecture_no;
	}
	public int getStudent_number() {
		return student_number;
	}
	public void setStudent_number(int student_number) {
		this.student_number = student_number;
	}
	public String getAttend_start() {
		return attend_start;
	}
	public void setAttend_start(String attend_start) {
		this.attend_start = attend_start;
	}
	public int getAttendStart() {
		return attendStart;
	}
	public void setAttendStart(int attendStart) {
		this.attendStart = attendStart;
	}
	public String getAttend_end() {
		return attend_end;
	}
	public void setAttend_end(String attend_end) {
		this.attend_end = attend_end;
	}
	public int getAttendEnd() {
		return attendEnd;
	}
	public void setAttendEnd(int attendEnd) {
		this.attendEnd = attendEnd;
	}
	public int getAttend_progress() {
		return attend_progress;
	}
	public void setAttend_progress(int attend_progress) {
		this.attend_progress = attend_progress;
	}
	public int getLectureclass_no() {
		return lectureclass_no;
	}
	public void setLectureclass_no(int lectureclass_no) {
		this.lectureclass_no = lectureclass_no;
	}
	public String getLecture_title() {
		return lecture_title;
	}
	public void setLecture_title(String lecture_title) {
		this.lecture_title = lecture_title;
	}
	public int getRegistration_no() {
		return registration_no;
	}
	public void setRegistration_no(int registration_no) {
		this.registration_no = registration_no;
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
	public int getLectureclassStart() {
		return lectureclassStart;
	}
	public void setLectureclassStart(int lectureclassStart) {
		this.lectureclassStart = lectureclassStart;
	}
	public String getLectureclass_end() {
		return lectureclass_end;
	}
	public void setLectureclass_end(String lectureclass_end) {
		this.lectureclass_end = lectureclass_end;
	}
	public int getLectureclassEnd() {
		return lectureclassEnd;
	}
	public void setLectureclassEnd(int lectureclassEnd) {
		this.lectureclassEnd = lectureclassEnd;
	}
	
	
	
	
}
