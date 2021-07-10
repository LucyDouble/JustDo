package com.kh.jd.progress;

import org.springframework.stereotype.Component;

@Component
public class Progress {
	private int video_no;
	private int student_number;
	private int lectureclass_no;
	private int progress;
	
	@Override
	public String toString() {
		return "Progress [video_no=" + video_no + ", student_number=" + student_number + ", lectureclass_no="
				+ lectureclass_no + ", progress=" + progress + "]";
	}

	public int getVideo_no() {
		return video_no;
	}

	public void setVideo_no(int video_no) {
		this.video_no = video_no;
	}

	public int getStudent_number() {
		return student_number;
	}

	public void setStudent_number(int student_number) {
		this.student_number = student_number;
	}

	public int getLectureclass_no() {
		return lectureclass_no;
	}

	public void setLectureclass_no(int lectureclass_no) {
		this.lectureclass_no = lectureclass_no;
	}

	public int getProgress() {
		return progress;
	}

	public void setProgress(int progress) {
		this.progress = progress;
	}

	
}
