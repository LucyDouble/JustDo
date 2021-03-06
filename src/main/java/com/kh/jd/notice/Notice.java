package com.kh.jd.notice;

import java.util.Date;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class Notice {
	private int notice_no;
	private String notice_sub;
	private String notice_con;
	private String notice_date;
	private String notice_filepath;
	private String notice_filename;
	private String delete_file;
	private int manager_number;
	private String manager_name;
	private int teacher_number;
	private String teacher_name;
	private int rnum;
	private int hit;
	private MultipartFile uploadFile;
	
	@Override
	public String toString() {
		return "Notice [notice_no=" + notice_no + ", notice_sub=" + notice_sub + ", notice_con=" + notice_con
				+ ", notice_date=" + notice_date + ", notice_filepath=" + notice_filepath + ", notice_filename="
				+ notice_filename + ", delete_file=" + delete_file + ", manager_number=" + manager_number
				+ ", manager_name=" + manager_name + ", teacher_number=" + teacher_number + ", teacher_name="
				+ teacher_name + ", rnum=" + rnum + ", hit=" + hit + ", uploadFile=" + uploadFile + "]";
	}


	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public String getNotice_sub() {
		return notice_sub;
	}

	public void setNotice_sub(String notice_sub) {
		this.notice_sub = notice_sub;
	}

	public String getNotice_con() {
		return notice_con;
	}

	public void setNotice_con(String notice_con) {
		this.notice_con = notice_con;
	}

	public String getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(String notice_date) {
		this.notice_date = notice_date;
	}

	public String getNotice_filepath() {
		return notice_filepath;
	}

	public void setNotice_filepath(String notice_filepath) {
		this.notice_filepath = notice_filepath;
	}

	public int getManager_number() {
		return manager_number;
	}

	public void setManager_number(int manager_number) {
		this.manager_number = manager_number;
	}

	public String getManager_name() {
		return manager_name;
	}

	public void setManager_name(String manager_name) {
		this.manager_name = manager_name;
	}

	public int getTeacher_number() {
		return teacher_number;
	}

	public void setTeacher_number(int teacher_number) {
		this.teacher_number = teacher_number;
	}

	public String getTeacher_name() {
		return teacher_name;
	}

	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	public String getNotice_filename() {
		return notice_filename;
	}

	public void setNotice_filename(String notice_filename) {
		this.notice_filename = notice_filename;
	}

	public String getDelete_file() {
		return delete_file;
	}

	public void setDelete_file(String delete_file) {
		this.delete_file = delete_file;
	}
	
}

	
	