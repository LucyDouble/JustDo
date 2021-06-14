package com.kh.jd.account;

public class StudentDTO {
private int student_number;
private String student_id;
private String student_password;
private String student_name;
private String student_address;
private String student_phone;
private String student_email;


@Override
public String toString() {
	return "StudentDTO [student_number=" + student_number + ", student_id=" + student_id + ", student_password="
			+ student_password + ", student_name=" + student_name + ", student_address=" + student_address
			+ ", student_phone=" + student_phone + ", student_email=" + student_email + "]";
}
public int getStudent_number() {
	return student_number;
}
public void setStudent_number(int student_number) {
	this.student_number = student_number;
}
public String getStudent_id() {
	return student_id;
}
public void setStudent_id(String student_id) {
	this.student_id = student_id;
}
public String getStudent_password() {
	return student_password;
}
public void setStudent_password(String student_password) {
	this.student_password = student_password;
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
