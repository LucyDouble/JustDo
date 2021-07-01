package com.kh.jd.account;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

@Service
public interface ManagerService {

	//운영자 아이디 체크
	public int idCheck(String manager_id);
	
	//운영자 로그인 체크
	public boolean loginCheck(Manager dto, HttpSession session);
	
	//운영자 정보
	public Manager infoManager(Manager dto);
	
	//로그아웃
	public void logout(HttpSession session);
	
	//비승인 교직원 조회
	public List<Teacher> teacherList();
}
