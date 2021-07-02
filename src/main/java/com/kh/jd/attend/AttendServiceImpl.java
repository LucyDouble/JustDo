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
	@Scheduled(cron = "0 0 0 * * 1,2,3,4,5") // 0~6 일~토
	public void scheduleAttend() {
		System.out.println("용휘 짱!@!@!@");
//		attendDao.scheduleAttend();
	}
	@Override
	public List<Attend> listAttend(Attend vo) {
		return attendDao.listAttend(vo);
	}

}
