package com.kh.jd.account;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("tService")
public class TeacherServiceImpl implements TeacherService {
	
	@Autowired
	TeacherDAO dao;

	@Override
	public int idCheck(String teacher_id) {
		int result = dao.idCheck(teacher_id);
		return result;
	}

	@Override
	public void signUp(Teacher dto) {
		dao.signUp(dto);
	}

	@Override
	public boolean loginCheck(Teacher dto, HttpSession session) {
		boolean result = dao.loginCheck(dto);
		if(result == true) {
			session.setAttribute("teacher_id", dto.getId());
		}
		return result;
	}

	@Override
	public void logout(HttpSession session) {
		dao.logout(session);
	}

	@Override
	public Teacher infoTeacher(Teacher dto) {
		return dao.infoTeacher(dto);
	}
	



	



}
