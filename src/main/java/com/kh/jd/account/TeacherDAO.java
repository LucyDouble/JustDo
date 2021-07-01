package com.kh.jd.account;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TeacherDAO {

	@Autowired
	SqlSession sqlSession;

	// 아이디 체크
	public int idCheck(String teacher_id) {
		System.out.println("idCheck");
		int result = sqlSession.selectOne("Teacher.idCheck", teacher_id);
		return result;
	}

	// 회원 가입
	public void signUp(Teacher dto) {
		sqlSession.insert("Teacher.signUp", dto);
	}

	// 로그인 체크
	public boolean loginCheck(Teacher dto) {
		System.out.println("loginCheck");
		String name = sqlSession.selectOne("Teacher.loginCheck", dto);
		System.out.println(name);
		return (Integer.parseInt(name) == 0) ? false : true;
	}
	
	//승인 체크
	public int acceptCheck(String teacher_id) {
		System.out.println("acceptCheck");
		int accept = sqlSession.selectOne("Teacher.acceptCheck", teacher_id);
		System.out.println(accept);
		return accept;
	}

	// 로그 아웃
	public void logout(HttpSession session) {
		session.invalidate();
	}

	// 교직원 정보
	public Teacher infoTeacher(Teacher dto) {

		Teacher result = sqlSession.selectOne("Teacher.infoTeacher", dto);
		return result;
	}

	// 이메일 체크
	public int emailCheck(String teacher_email) {
		System.out.println("emailCheck");
		int result = sqlSession.selectOne("Teacher.emailCheck", teacher_email);
		return result;
	}

	// 휴대폰 체크
	public int phoneCheck(String teacher_phone) {
		System.out.println("phoneCheck");
		int result = sqlSession.selectOne("Teacher.phoneCheck", teacher_phone);
		return result;
	}

	// 교직원 비밀번호 수정
	public void editTeacherPw(String teacher_pw, String teacher_id) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("password", teacher_pw);
		map.put("id", teacher_id);
		sqlSession.update("Teacher.editTeacherPw", map);
	}

	// 교직원 이름 수정
	public void editTeacherName(String teacher_name, String teacher_id) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("name", teacher_name);
		map.put("id", teacher_id);
		sqlSession.update("Teacher.editTeacherName", map);
	}

	// 교직원 주소 수정
	public void editTeacherAddress(String teacher_address, String teacher_id) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("address", teacher_address);
		map.put("id", teacher_id);
		sqlSession.update("Teacher.editTeacherAddress", map);
	}

	// 교직원 휴대폰번호 수정
	public void editTeacherPhone(String teacher_phone, String teacher_id) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("phone", teacher_phone);
		map.put("id", teacher_id);
		sqlSession.update("Teacher.editTeacherPhone", map);
	}

	// 교직원 탈퇴
	public void deleteTeacher(String teacher_id) {
		sqlSession.delete("Teacher.deleteTeacher", teacher_id);
	}

}
