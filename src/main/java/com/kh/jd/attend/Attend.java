package com.kh.jd.attend;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Attend {
	private int attendNo;
	private int lectureNo;
	private int studentNo;
	private Date attendStart;
	private Date attendEnd;
	private int attendProgress;
	
	
	
	
	@Override
	public String toString() {
		return "Attend [attendNo=" + attendNo + ", lectureNo=" + lectureNo + ", studentNo=" + studentNo
				+ ", attendStart=" + attendStart + ", attendEnd=" + attendEnd + ", attendProgress=" + attendProgress
				+ "]";
	}
	public int getAttendNo() {
		return attendNo;
	}
	public void setAttendNo(int attendNo) {
		this.attendNo = attendNo;
	}
	public int getLectureNo() {
		return lectureNo;
	}
	public void setLectureNo(int lectureNo) {
		this.lectureNo = lectureNo;
	}
	public int getStudentNo() {
		return studentNo;
	}
	public void setStudentNo(int studentNo) {
		this.studentNo = studentNo;
	}
	public Date getAttendStart() {
		return attendStart;
	}
	public void setAttendStart(Date attendStart) {
		this.attendStart = attendStart;
	}
	public Date getAttendEnd() {
		return attendEnd;
	}
	public void setAttendEnd(Date attendEnd) {
		this.attendEnd = attendEnd;
	}
	public int getAttendProgress() {
		return attendProgress;
	}
	public void setAttendProgress(int attendProgress) {
		this.attendProgress = attendProgress;
	}
}
