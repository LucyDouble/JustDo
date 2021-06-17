package com.kh.jd.account;



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
}
