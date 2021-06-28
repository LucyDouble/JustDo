package com.kh.jd.registration;

import java.util.List;

public interface RegistrationService {
	public int addRegistration(Registration registration);
	public Registration checkStudent(String number);
	public List<Registration> calendarAdd(String number);
}
