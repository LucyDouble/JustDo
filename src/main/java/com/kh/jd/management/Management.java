package com.kh.jd.management;

import org.springframework.stereotype.Component;

@Component
public class Management {
	private int registration_no;
	private int rnum;
	private int student_number;
	private int att;
	private int lectureclass_class;
	private String name;
	private int avg_grade;
	private int lecture_no;
	private int work_progress;
	private String lecture_title;
	private int teacher_number;
	private int all_grade;
	private int work_all_progress;
	private int all_attend;
	private int video_progress;
	
	
	
	
	
	
	
	@Override
	public String toString() {
		return "Management [registration_no=" + registration_no + ", rnum=" + rnum + ", student_number="
				+ student_number + ", att=" + att + ", lectureclass_class=" + lectureclass_class + ", name=" + name
				+ ", avg_grade=" + avg_grade + ", lecture_no=" + lecture_no + ", work_progress=" + work_progress
				+ ", lecture_title=" + lecture_title + ", teacher_number=" + teacher_number + ", all_grade=" + all_grade
				+ ", work_all_progress=" + work_all_progress + ", all_attend=" + all_attend + ", video_progress="
				+ video_progress + "]";
	}
	public int getVideo_progress() {
		return video_progress;
	}
	public void setVideo_progress(int video_progress) {
		this.video_progress = video_progress;
	}
	public int getAll_grade() {
		return all_grade;
	}
	public void setAll_grade(int all_grade) {
		this.all_grade = all_grade;
	}
	public int getWork_all_progress() {
		return work_all_progress;
	}
	public void setWork_all_progress(int work_all_progress) {
		this.work_all_progress = work_all_progress;
	}
	public int getAll_attend() {
		return all_attend;
	}
	public void setAll_attend(int all_attend) {
		this.all_attend = all_attend;
	}
	public int getTeacher_number() {
		return teacher_number;
	}
	public void setTeacher_number(int teacher_number) {
		this.teacher_number = teacher_number;
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
	public int getStudent_number() {
		return student_number;
	}
	public void setStudent_number(int student_number) {
		this.student_number = student_number;
	}
	public int getAtt() {
		return att;
	}
	public void setAtt(int att) {
		this.att = att;
	}
	public int getLectureclass_class() {
		return lectureclass_class;
	}
	public void setLectureclass_class(int lectureclass_class) {
		this.lectureclass_class = lectureclass_class;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAvg_grade() {
		return avg_grade;
	}
	public void setAvg_grade(int avg_grade) {
		this.avg_grade = avg_grade;
	}
	public int getLecture_no() {
		return lecture_no;
	}
	public void setLecture_no(int lecture_no) {
		this.lecture_no = lecture_no;
	}
	public int getWork_progress() {
		return work_progress;
	}
	public void setWork_progress(int work_progress) {
		this.work_progress = work_progress;
	}
	public String getLecture_title() {
		return lecture_title;
	}
	public void setLecture_title(String lecture_title) {
		this.lecture_title = lecture_title;
	}
	
	
	
}
