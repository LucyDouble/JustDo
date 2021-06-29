package com.kh.jd.account;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("sService")
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
		if (result == true) {
			session.setAttribute("student_id", dto.getId());
		}
		return result;
	}

	@Override
	public void logout(HttpSession session) {
		dao.logout(session);
	}

	@Override
	public Student infoStudent(Student dto) {

		return dao.infoStudent(dto);
	}

	@Override
	public int emailCheck(String student_email) {
		return dao.emailCheck(student_email);
	}

	@Override
	public int phoneCheck(String student_phone) {
		return dao.phoneCheck(student_phone);
	}

	@Override
	public void editStudentPw(String student_pw, String student_id) {
		dao.editStudentPw(student_pw, student_id);
	}

	@Override
	public void editStudentName(String student_name, String student_id) {
		dao.editStudentName(student_name, student_id);
	}

	@Override
	public void editStudentAddress(String student_address, String student_id) {
		dao.editStudentAddress(student_address, student_id);
	}

	@Override
	public void editStudentPhone(String student_phone, String student_id) {
		dao.editStudentPhone(student_phone, student_id);
	}

	@Override
	public void deleteStudent(String student_id) {
		dao.deleteStudent(student_id);
	}

	@Override
	public String student_searchId(String student_name, String student_email) {
		return dao.student_searchId(student_name, student_email);
	}

}
