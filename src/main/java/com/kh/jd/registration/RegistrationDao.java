package com.kh.jd.registration;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("Rdao")
public class RegistrationDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int addRegistration(Registration registration) {
		return sqlSession.insert("Registration.addRegistration", registration);
	}

	public Registration checkStudent(String number) {
		return sqlSession.selectOne("Registration.checkStudent", number);
	}
	
	public List<Registration> calendarAdd(String number) {
		return sqlSession.selectList("Registration.addCalendar", number);
	}
}
