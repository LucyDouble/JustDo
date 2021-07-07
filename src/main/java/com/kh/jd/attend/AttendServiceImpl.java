package com.kh.jd.attend;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

@Service("attendService")
public class AttendServiceImpl implements AttendService {

	@Autowired
	private AttendDao attendDao;
	@Override
	public List<Attend> checkLecture(int student_number) {
		return attendDao.checkLecture(student_number);
	}
	@Override
	@Scheduled(cron = "0 9 0 * * 1,2,3,4,5") // 0~6 일~토
	public void scheduleAttend() {
		System.out.println("출석 날짜 삽입==권용휘 컴퓨터서만 실행");
//		 attendDao.scheduleAttend(); 
	}
	@Override
	public List<Attend> listAttend(Attend vo) {
		return attendDao.listAttend(vo);
	}
	@Override
	public void editAttend(Attend vo) {
		attendDao.editAttend(vo);
	}
	@Override
	public void editAttendExit(Attend vo) {
		attendDao.editAttendExit(vo);
	}
	@Override
	public int getlistAttendCount(Attend vo) {
		return attendDao.getlistAttendCount(vo);
	}
	@Override
	public int startCheck(Attend vo) {
		return attendDao.startCheck(vo);
	}
	@Override
	public int endCheck(Attend vo) {
		return attendDao.endCheck(vo);
	}
	@Override
	@Scheduled(cron = "0 30 22 * * 1,2,3,4,5") // 0~6 일~토
	public void attendprogress() {
		System.out.println("출석상태 삽입==권용휘 컴퓨터서만 실행");
		/* attendDao.attendprogress(); */
	}
	@Override
	public int progressTotal(Attend vo) {
		return attendDao.progressTotal(vo);
	}
	@Override
	public int progressAttend(Attend vo) {
		return attendDao.progressAttend(vo);
	}
	@Override
	public int progressLate(Attend vo) {
		return attendDao.progressLate(vo);
	}
	@Override
	public int progressSoLate(Attend vo) {
		return attendDao.progressSoLate(vo);
	}
	@Override
	public int progressClassTotal(Attend vo) {
		return attendDao.progressClassTotal(vo);
	}
	@Override
	public int progressClassAttend(Attend vo) {
		return attendDao.progressClassAttend(vo);
	}
	@Override
	public int progressClassLate(Attend vo) {
		return attendDao.progressClassLate(vo);
	}
	@Override
	public int progressClassSoLate(Attend vo) {
		return attendDao.progressClassSoLate(vo);
	}

}
