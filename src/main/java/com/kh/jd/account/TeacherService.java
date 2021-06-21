package com.kh.jd.account;



import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

@Service
public interface TeacherService {

	//아이디 중복 체크
	public int idCheck(String teacher_id);
	
	//회원 가입
	public void signUp(Teacher dto);
	
	//로그인 체크
	public boolean loginCheck(Teacher dto, HttpSession session);
	
	//로그아웃
	public void logout(HttpSession session);
	
	//학생 정보
	public Teacher infoTeacher(Teacher dto);
	
	//이메일 체크
	public int emailCheck(String teacher_email);
	
	//휴대폰 체크
	public int phoneCheck(String teacher_phone);
	}

