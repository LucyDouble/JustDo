package com.kh.jd.video;

import java.sql.Date;

import org.springframework.stereotype.Component;
@Component
public class Video {
	private int video_no;
	private int lectureclass_no;
	private String video_title;
	private String video_content;
	private String video_date;
	private String video_file;
	private String video_path;
	private String video_image;
	
	@Override
	public String toString() {
		return "Video [video_no=" + video_no + ", lectureclass_no=" + lectureclass_no + ", video_title=" + video_title
				+ ", video_content=" + video_content + ", video_date=" + video_date + ", video_file=" + video_file
				+ ", video_path=" + video_path + ", video_image=" + video_image + "]";
	}

	public int getVideo_no() {
		return video_no;
	}

	public void setVideo_no(int video_no) {
		this.video_no = video_no;
	}

	public int getLectureclass_no() {
		return lectureclass_no;
	}

	public void setLectureclass_no(int lectureclass_no) {
		this.lectureclass_no = lectureclass_no;
	}

	public String getVideo_title() {
		return video_title;
	}

	public void setVideo_title(String video_title) {
		this.video_title = video_title;
	}

	public String getVideo_content() {
		return video_content;
	}

	public void setVideo_content(String video_content) {
		this.video_content = video_content;
	}

	public String getVideo_date() {
		return video_date;
	}

	public void setVideo_date(String video_date) {
		this.video_date = video_date;
	}

	public String getVideo_file() {
		return video_file;
	}

	public void setVideo_file(String video_file) {
		this.video_file = video_file;
	}

	public String getVideo_path() {
		return video_path;
	}

	public void setVideo_path(String video_path) {
		this.video_path = video_path;
	}

	public String getVideo_image() {
		return video_image;
	}

	public void setVideo_image(String video_image) {
		this.video_image = video_image;
	}
	
	
}
