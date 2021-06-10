package com.kh.jd.account.dto;

public class TeacherDTO {
private int teacher_number;
private String id;
private String password;
private String name;
private String address;
private String phone;
private String email;
@Override
public String toString() {
	return "TeacherDTO [teacher_number=" + teacher_number + ", id=" + id + ", password=" + password + ", name=" + name
			+ ", address=" + address + ", phone=" + phone + ", email=" + email + "]";
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
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
}
