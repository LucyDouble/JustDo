package com.kh.jd.exam;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Exam {
	private int exam_no;
	private int lecture_no;
	private int teacher_number;
	private int student_number;
	private String exam_subject;
	private Date exam_date;
	private String exam_start;
	private String exam_end;
	private String exam_content;
	private String exam_answer;
	private int rnum;
	private String lecture_title;
	private int lectureclass_no;
	private int lectureclass_class;
	private Date lectureclass_start;
	private Date lectureclass_end;
	private int examdate;
	private int registration_no;
	private int examStart;
	private int examEnd;
	private String name;
	private String exam_submit;
	private int exam_grade;
	private int examDate;
	
	
	
	
	
	
	
	@Override
	public String toString() {
		return "Exam [exam_no=" + exam_no + ", lecture_no=" + lecture_no + ", teacher_number=" + teacher_number
				+ ", student_number=" + student_number + ", exam_subject=" + exam_subject + ", exam_date=" + exam_date
				+ ", exam_start=" + exam_start + ", exam_end=" + exam_end + ", exam_content=" + exam_content
				+ ", exam_answer=" + exam_answer + ", rnum=" + rnum + ", lecture_title=" + lecture_title
				+ ", lectureclass_no=" + lectureclass_no + ", lectureclass_class=" + lectureclass_class
				+ ", lectureclass_start=" + lectureclass_start + ", lectureclass_end=" + lectureclass_end
				+ ", examdate=" + examdate + ", registration_no=" + registration_no + ", examStart=" + examStart
				+ ", examEnd=" + examEnd + ", name=" + name + ", exam_submit=" + exam_submit + ", exam_grade="
				+ exam_grade + ", examDate=" + examDate + "]";
	}
	public int getExamDate() {
		return examDate;
	}
	public void setExamDate(int examDate) {
		this.examDate = examDate;
	}
	public String getExam_submit() {
		return exam_submit;
	}
	public void setExam_submit(String exam_submit) {
		this.exam_submit = exam_submit;
	}
	public int getExam_grade() {
		return exam_grade;
	}
	public void setExam_grade(int exam_grade) {
		this.exam_grade = exam_grade;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getExamStart() {
		return examStart;
	}
	public void setExamStart(int examStart) {
		this.examStart = examStart;
	}
	public int getExamEnd() {
		return examEnd;
	}
	public void setExamEnd(int examEnd) {
		this.examEnd = examEnd;
	}
	public int getRegistration_no() {
		return registration_no;
	}
	public void setRegistration_no(int registration_no) {
		this.registration_no = registration_no;
	}
	public int getExamdate() {
		return examdate;
	}
	public void setExamdate(int examdate) {
		this.examdate = examdate;
	}
	public int getExam_no() {
		return exam_no;
	}
	public void setExam_no(int exam_no) {
		this.exam_no = exam_no;
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
	public int getStudent_number() {
		return student_number;
	}
	public void setStudent_number(int student_number) {
		this.student_number = student_number;
	}
	public String getExam_subject() {
		return exam_subject;
	}
	public void setExam_subject(String exam_subject) {
		this.exam_subject = exam_subject;
	}
	public Date getExam_date() {
		return exam_date;
	}
	public void setExam_date(Date exam_date) {
		this.exam_date = exam_date;
	}
	public String getExam_start() {
		return exam_start;
	}
	public void setExam_start(String exam_start) {
		this.exam_start = exam_start;
	}
	public String getExam_end() {
		return exam_end;
	}
	public void setExam_end(String exam_end) {
		this.exam_end = exam_end;
	}
	public String getExam_content() {
		return exam_content;
	}
	public void setExam_content(String exam_content) {
		this.exam_content = exam_content;
	}
	public String getExam_answer() {
		return exam_answer;
	}
	public void setExam_answer(String exam_answer) {
		this.exam_answer = exam_answer;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getLecture_title() {
		return lecture_title;
	}
	public void setLecture_title(String lecture_title) {
		this.lecture_title = lecture_title;
	}
	public int getLectureclass_no() {
		return lectureclass_no;
	}
	public void setLectureclass_no(int lectureclass_no) {
		this.lectureclass_no = lectureclass_no;
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
	
	
}
