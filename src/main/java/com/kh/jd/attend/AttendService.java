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
	public int progressTotal(Attend vo) ;
	public int progressAttend(Attend vo) ;
	public int progressLate(Attend vo) ;
	public int progressSoLate(Attend vo) ;
	public int progressClassTotal(Attend vo) ;
	public int progressClassAttend(Attend vo) ;
	public int progressClassLate(Attend vo) ;
	public int progressClassSoLate(Attend vo) ;
}
