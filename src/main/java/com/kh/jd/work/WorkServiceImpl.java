package com.kh.jd.work;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jd.lecture.Lecture;

@Service("workService")
public class WorkServiceImpl implements WorkService{

	@Autowired
	private WorkDao workDao;
	
	@Override
	public List<Work> listWork(int startPage, int limit) {
		return workDao.listWork( startPage, limit);
	}

	@Override
	public int getListCount() {
		return workDao.getListCount();
	}

	@Override
	public int addWork(Work vo) {
		return workDao.addWork(vo);
	}

	@Override
	public List<Lecture> lecturechk(int teacher_number) {
		return workDao.lecturechk(teacher_number);
	}

}
