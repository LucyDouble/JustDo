package com.kh.jd.video;

import java.sql.Date;

import org.springframework.stereotype.Component;
@Component
public class Video {
	private int video_no;
	private int lecture_no;
	private String video_title;
	private String video_content;
	private String video_date;
	private String video_file;
	private String video_path;
	private String video_image;
	private String video_alltime;
	
	@Override
	public String toString() {
		return "Video [video_no=" + video_no + ", lecture_no=" + lecture_no + ", video_title=" + video_title
				+ ", video_content=" + video_content + ", video_date=" + video_date + ", video_file=" + video_file
				+ ", video_path=" + video_path + ", video_image=" + video_image + ", video_alltime=" + video_alltime
				+ "]";
	}

	public int getVideo_no() {
		return video_no;
	}

	public void setVideo_no(int video_no) {
		this.video_no = video_no;
	}

	public int getLecture_no() {
		return lecture_no;
	}

	public void setLecture_no(int lecture_no) {
		this.lecture_no = lecture_no;
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

	public String getVideo_alltime() {
		return video_alltime;
	}

	public void setVideo_alltime(String video_alltime) {
		this.video_alltime = video_alltime;
	}
	
	
}
