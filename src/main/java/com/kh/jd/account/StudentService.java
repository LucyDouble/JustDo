package com.kh.jd.account;



import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

@Service
public interface StudentService {

	//아이디 중복 체크
	public int idCheck(String student_id);
	
	//회원 가입
	public void signUp(Student dto);
	
	//로그인 체크
	public boolean loginCheck(Student dto, HttpSession session);
	
	//로그아웃
	public void logout(HttpSession session);
	
	//학생 정보
	public Student infoStudent(Student dto);
	
	//이메일 중복 체크
	public int emailCheck(String student_email);
	
	//휴대폰 중복 체크
	public int phoneCheck(String student_phone);

	//수강생 비밀번호 수정
	public void editStudentPw(String student_pw, String student_id);

	//수강생 이름 수정
	public void editStudentName(String student_name, String student_id);
	
	//수강생 주소 수정
	public void editStudentAddress(String student_address, String student_id);
	
	//수강생 휴대폰 번호 수정
	public void editStudentPhone(String student_phone, String student_id);
}
