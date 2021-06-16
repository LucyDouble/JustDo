package com.kh.jd.account;

public class Student {
	private int student_number;
	private String id;
	private String password;
	private String student_name;
	private String student_address;
	private String student_phone;
	private String student_email;

	@Override
	public String toString() {
		return "Student [student_number=" + student_number + ", id=" + id + ", password=" + password + ", student_name="
				+ student_name + ", student_address=" + student_address + ", student_phone=" + student_phone
				+ ", student_email=" + student_email + "]";
	}

	public int getStudent_number() {
		return student_number;
	}

	public void setStudent_number(int student_number) {
		this.student_number = student_number;
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

	public String getStudent_name() {
		return student_name;
	}

	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}

	public String getStudent_address() {
		return student_address;
	}

	public void setStudent_address(String student_address) {
		this.student_address = student_address;
	}

	public String getStudent_phone() {
		return student_phone;
	}

	public void setStudent_phone(String student_phone) {
		this.student_phone = student_phone;
	}

	public String getStudent_email() {
		return student_email;
	}

	public void setStudent_email(String student_email) {
		this.student_email = student_email;
	}

}
