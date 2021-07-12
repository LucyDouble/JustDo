package com.kh.jd.progress;

import org.springframework.stereotype.Component;

@Component
public class Progress {
	private int progress_no;
	private int video_no;
	private int student_number;
	private int progress;
	private int video_alltime;
	private int lecture_no;
	
	@Override
	public String toString() {
		return "Progress [progress_no=" + progress_no + ", video_no=" + video_no + ", student_number=" + student_number
				+ ", progress=" + progress + ", video_alltime=" + video_alltime + ", lecture_no=" + lecture_no + "]";
	}
	public int getProgress_no() {
		return progress_no;
	}
	public void setProgress_no(int progress_no) {
		this.progress_no = progress_no;
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
	public int getProgress() {
		return progress;
	}
	public void setProgress(int progress) {
		this.progress = progress;
	}

	public int getVideo_alltime() {
		return video_alltime;
	}

	public void setVideo_alltime(int video_alltime) {
		this.video_alltime = video_alltime;
	}
	public int getLecture_no() {
		return lecture_no;
	}
	public void setLecture_no(int lecture_no) {
		this.lecture_no = lecture_no;
	}
	
	
}
