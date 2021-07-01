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

	@Override
	public int emailCheck(String teacher_email) {
		return dao.emailCheck(teacher_email);
	}

	@Override
	public int phoneCheck(String teacher_phone) {
		return dao.phoneCheck(teacher_phone);
	}

	@Override
	public void editTeacherPw(String teacher_pw, String teacher_id) {
		dao.editTeacherPw(teacher_pw, teacher_id);
	}

	@Override
	public void editTeacherName(String teacher_name, String teacher_id) {
		dao.editTeacherName(teacher_name, teacher_id);
	}

	@Override
	public void editTeacherAddress(String teacher_address, String teacher_id) {
		dao.editTeacherAddress(teacher_address, teacher_id);
	}

	@Override
	public void editTeacherPhone(String teacher_phone, String teacher_id) {
		dao.editTeacherPhone(teacher_phone, teacher_id);
	}

	@Override
	public void deleteTeacher(String teacher_id) {
		dao.deleteTeacher(teacher_id);
	}

	@Override
	public int acceptCheck(String teacher_id) {
		int result = dao.acceptCheck(teacher_id);
		dao.acceptCheck(teacher_id);
		return result;
	}
	



	



}
