package com.kh.jd.exam;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Exam {
	private int examNo;
	private int lectureCo;
	private int teacherNo;
	private int studentNo;
	private String examSub;
	private Date examStart;
	private Date examEnd;
	private int examProgress;
	private String examCon;
	private String examAns;
	private int grade;
	
	
	
	@Override
	public String toString() {
		return "Exam [examNo=" + examNo + ", lectureCo=" + lectureCo + ", teacherNo=" + teacherNo + ", studentNo="
				+ studentNo + ", examSub=" + examSub + ", examStart=" + examStart + ", examEnd=" + examEnd
				+ ", examProgress=" + examProgress + ", examCon=" + examCon + ", examAns=" + examAns + ", grade="
				+ grade + "]";
	}
	public int getExamNo() {
		return examNo;
	}
	public void setExamNo(int examNo) {
		this.examNo = examNo;
	}
	public int getLectureCo() {
		return lectureCo;
	}
	public void setLectureCo(int lectureCo) {
		this.lectureCo = lectureCo;
	}
	public int getTeacherNo() {
		return teacherNo;
	}
	public void setTeacherNo(int teacherNo) {
		this.teacherNo = teacherNo;
	}
	public int getStudentNo() {
		return studentNo;
	}
	public void setStudentNo(int studentNo) {
		this.studentNo = studentNo;
	}
	public String getExamSub() {
		return examSub;
	}
	public void setExamSub(String examSub) {
		this.examSub = examSub;
	}
	public Date getExamStart() {
		return examStart;
	}
	public void setExamStart(Date examStart) {
		this.examStart = examStart;
	}
	public Date getExamEnd() {
		return examEnd;
	}
	public void setExamEnd(Date examEnd) {
		this.examEnd = examEnd;
	}
	public int getExamProgress() {
		return examProgress;
	}
	public void setExamProgress(int examProgress) {
		this.examProgress = examProgress;
	}
	public String getExamCon() {
		return examCon;
	}
	public void setExamCon(String examCon) {
		this.examCon = examCon;
	}
	public String getExamAns() {
		return examAns;
	}
	public void setExamAns(String examAns) {
		this.examAns = examAns;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
}
