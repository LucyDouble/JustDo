package com.kh.jd.account;

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
		int result = sqlSession.selectOne("studentMapper.idCheck", student_id);
		return result;
	}
	// 회원 가입
	public void signUp(Student dto) {
		sqlSession.insert("studentMapper.signUp", dto);
		
	}
}
