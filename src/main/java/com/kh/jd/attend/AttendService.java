package com.kh.jd.attend;

import java.util.List;

public interface AttendService {
	public List<Attend> checkLecture(int student_number);
	public void scheduleAttend();
	public List<Attend> listAttend(Attend vo);
	public void editAttend(Attend vo) ;
	public void editAttendExit(Attend vo) ;
	public int getlistAttendCount(Attend vo) ;
	public int startCheck(Attend vo) ;
	public int endCheck(Attend vo) ;
	public void attendprogress();
}
