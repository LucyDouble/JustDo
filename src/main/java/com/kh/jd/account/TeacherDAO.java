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

	//아이디 체크
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
		return (Integer.parseInt(name)==0)?false:true;
	}
	
	//로그 아웃
	public void logout(HttpSession session) {
		session.invalidate();
	}
	
	//교직원 정보
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
	//휴대폰 체크
		public int phoneCheck(String teacher_phone) {
			System.out.println("phoneCheck");
			int result = sqlSession.selectOne("Teacher.phoneCheck", teacher_phone);
			return result;
		}
		
		//비밀번호 수정
		public int editStudentPassword(String student_password, String student_id) {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("student_id", student_id);
			System.out.println(student_password);
			System.out.println(student_id);
			int result = sqlSession.selectOne("Student.editStudentPassword", student_password);
			return result;
		}
}
