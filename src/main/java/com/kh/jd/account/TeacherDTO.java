package com.kh.jd.account;

public class TeacherDTO {
private int teacher_number;
private String teacher_id;
private String teacher_password;
private String teacher_name;
private String teacher_address;
private String teacher_phone;
private String teacher_email;


@Override
public String toString() {
	return "TeacherDTO [teacher_number=" + teacher_number + ", teacher_id=" + teacher_id + ", teacher_password="
			+ teacher_password + ", teacher_name=" + teacher_name + ", teacher_address=" + teacher_address
			+ ", teacher_phone=" + teacher_phone + ", teacher_email=" + teacher_email + "]";
}
public int getTeacher_number() {
	return teacher_number;
}
public void setTeacher_number(int teacher_number) {
	this.teacher_number = teacher_number;
}
public String getTeacher_id() {
	return teacher_id;
}
public void setTeacher_id(String teacher_id) {
	this.teacher_id = teacher_id;
}
public String getTeacher_password() {
	return teacher_password;
}
public void setTeacher_password(String teacher_password) {
	this.teacher_password = teacher_password;
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


}
