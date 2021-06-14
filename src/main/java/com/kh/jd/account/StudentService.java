package com.kh.jd.account;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public interface StudentService {

	//아이디 중복 체크
	public int idCheck(String student_id);
	
	//회원 가입
	public void signUp(Student dto);
	
}
