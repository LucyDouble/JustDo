package com.kh.jd.account;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TeacherDAO {

	@Autowired
	SqlSession sqlsession;

//아이디 체크
	public int idcheck(String teacherId) {
		System.out.println("idcheck");
		int result = sqlsession.selectOne("accountMapper.idCheck", teacherId);
		return result;
	}
//회원 가입
	public void signup(Teacher dto) {
		System.out.println("signup");
		sqlsession.insert("teacherMapper.signup", dto);
	}
}
