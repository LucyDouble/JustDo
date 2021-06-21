package com.kh.jd.lectureClass;

import org.springframework.stereotype.Component;

@Component
public class LectureClass {
	private int lectureclass_no;
	private int lecture_no;
	private int lectureclass_class;
	private String lectureclass_start;
	private String lectureclass_end;
	
	@Override
	public String toString() {
		return "LectureClass [lectureclass_no=" + lectureclass_no + ", lecture_no=" + lecture_no
				+ ", lectureclass_class=" + lectureclass_class + ", lectureclass_start=" + lectureclass_start
				+ ", lectureclass_end=" + lectureclass_end + "]";
	}

	public int getLectureclass_no() {
		return lectureclass_no;
	}

	public void setLectureclass_no(int lectureclass_no) {
		this.lectureclass_no = lectureclass_no;
	}

	public int getLecture_no() {
		return lecture_no;
	}

	public void setLecture_no(int lecture_no) {
		this.lecture_no = lecture_no;
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
	
	
	
}
