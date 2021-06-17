package com.kh.jd.account;


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
		public int emailCheck(String teacher_email) {
			System.out.println("emailCheck");
			int result = sqlSession.selectOne("Teacher.emailCheck", teacher_email);
			return result;
		}
}
