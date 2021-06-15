package com.kh.jd.account;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StudentServiceImpl implements StudentService {
	
	@Autowired
	StudentDAO dao;
	
	@Override
	public int idCheck(String student_id) {
		int result = dao.idCheck(student_id);
		return result;
	}

	@Override
	public void signUp(Student dto) {
		dao.signUp(dto);
	}

	@Override
	public boolean loginCheck(Student dto, HttpSession session) {
		boolean result = dao.loginCheck(dto);
		if(result == true) {
			session.setAttribute("student_id", dto.getStudent_id());
		}
		return result;
	}

	@Override
	public void logout(HttpSession session) {
			dao.logout(session);
	}




	



}
