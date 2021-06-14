package com.kh.jd.account;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
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
		// TODO Auto-generated method stub
		
	}

}
