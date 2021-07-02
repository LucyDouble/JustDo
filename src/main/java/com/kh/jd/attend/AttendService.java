package com.kh.jd.attend;

import java.util.List;

public interface AttendService {
	public List<Attend> checkLecture(int student_number);
	public void scheduleAttend();
	public List<Attend> listAttend(Attend vo);
}
