package com.kh.jd.account;

public class Teacher {
	private int teacher_number;
	private String id;
	private String password;
	private String teacher_name;
	private String teacher_address;
	private String teacher_phone;
	private String teacher_email;
	private int accept;



	@Override
	public String toString() {
		return "Teacher [teacher_number=" + teacher_number + ", id=" + id + ", password=" + password + ", teacher_name="
				+ teacher_name + ", teacher_address=" + teacher_address + ", teacher_phone=" + teacher_phone
				+ ", teacher_email=" + teacher_email + ", accept=" + accept + "]";
	}

	public int getTeacher_number() {
		return teacher_number;
	}

	public void setTeacher_number(int teacher_number) {
		this.teacher_number = teacher_number;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTeacher_name() {
		return teacher_name;
	}

	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}

	public String getTeacher_address() {
		return teacher_address;
	}

	public void setTeacher_address(String teacher_address) {
		this.teacher_address = teacher_address;
	}

	public String getTeacher_phone() {
		return teacher_phone;
	}

	public void setTeacher_phone(String teacher_phone) {
		this.teacher_phone = teacher_phone;
	}

	public String getTeacher_email() {
		return teacher_email;
	}

	public void setTeacher_email(String teacher_email) {
		this.teacher_email = teacher_email;
	}

	public int getAccept() {
		return accept;
	}

	public void setAccept(int accept) {
		this.accept = accept;
	}

	
}
