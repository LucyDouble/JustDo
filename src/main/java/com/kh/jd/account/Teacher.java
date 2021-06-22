package com.kh.jd.account;

public class Teacher {
	private int teacher_number;
	private String id;
	private String password;
	private String name;
	private String address;
	private String phone;
	private String emaill;
	private int accept;
	
	
	@Override
	public String toString() {
		return "Teacher [teacher_number=" + teacher_number + ", id=" + id + ", password=" + password + ", name=" + name
				+ ", address=" + address + ", phone=" + phone + ", emaill=" + emaill + ", accept=" + accept + "]";
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmaill() {
		return emaill;
	}
	public void setEmaill(String emaill) {
		this.emaill = emaill;
	}
	public int getAccept() {
		return accept;
	}
	public void setAccept(int accept) {
		this.accept = accept;
	}




	
}
