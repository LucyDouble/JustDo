package com.kh.jd.account;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StudentDAO {

	@Autowired
	SqlSession sqlSession;

	//아이디 체크
	public int idCheck(String student_id) {
		System.out.println("idCheck");
		int result = sqlSession.selectOne("Student.idCheck", student_id);
		return result;
	}
	// 회원 가입
	public void signUp(Student dto) {
		sqlSession.insert("Student.signUp", dto);
	}
		
	// 로그인 체크
	public boolean loginCheck(Student dto) {
		System.out.println("loginCheck");
		String name = sqlSession.selectOne("Student.loginCheck", dto);
		return (Integer.parseInt(name)==0)?false:true;
	}
	
	//로그 아웃
	public void logout(HttpSession session) {
		session.invalidate();
	}

}
