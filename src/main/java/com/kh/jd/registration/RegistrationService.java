package com.kh.jd.registration;

import java.util.List;

public interface RegistrationService {
	public int addRegistration(Registration registration);
	public Registration checkStudent(Registration registration);
	public List<Registration> calendarAdd(int student_number);
	public List<Registration> listRegistration(int student_number);
	public int removeRegistration(Registration registration);
}
