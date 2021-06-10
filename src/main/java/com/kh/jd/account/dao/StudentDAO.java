package com.kh.jd.account.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.jd.account.dto.StudentDTO;

@Repository
public class StudentDAO {

	@Autowired
	SqlSession sqlsession;

//아이디 체크
	public int idcheck(String studentId) {
		System.out.println("idcheck");
		int result = sqlsession.selectOne("accountMapper.idCheck", studentId);
		return result;
	}
//회원 가입
	public void signup(StudentDTO dto) {
		System.out.println("signup");
		sqlsession.insert("studentMapper.signup", dto);
	}
}
