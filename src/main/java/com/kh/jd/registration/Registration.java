package com.kh.jd.registration;

import org.springframework.stereotype.Component;

@Component
public class Registration {
	private int registration_no;
	private int lectureclass_no;
	private int student_number;
	
	@Override
	public String toString() {
		return "Registration [registration_no=" + registration_no + ", lectureclass_no=" + lectureclass_no
				+ ", student_number=" + student_number + "]";
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
	
	
}
