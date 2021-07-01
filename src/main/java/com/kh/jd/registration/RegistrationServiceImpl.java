package com.kh.jd.registration;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("RService")
public class RegistrationServiceImpl implements RegistrationService {
	@Autowired
	private RegistrationDao Rdao;

	@Override
	public int addRegistration(Registration registration) {
		return Rdao.addRegistration(registration);
	}

	@Override
	public Registration checkStudent(String number) {
		return Rdao.checkStudent(number);
	}

	@Override
	public List<Registration> calendarAdd(int student_number) {
		return Rdao.calendarAdd(student_number);
	}

	@Override
	public List<Registration> listRegistration(int student_number) {
		return Rdao.listRegistration(student_number);
	}
	
	
}
