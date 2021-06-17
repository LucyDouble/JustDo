package com.kh.jd.work;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jd.lecture.Lecture;

@Service("workService")
public class WorkServiceImpl implements WorkService{

	@Autowired
	private WorkDao workDao;
	


	@Override
	public List<Work> listWork(int startPage, int limit, Map<String, Object> map) {
		return workDao.listWork(startPage, limit, map);
	}

	@Override
	public int getListCount(Map<String, Object> map) {
		return workDao.getListCount(map);
	}

	@Override
	public int addWork(Work vo) {
		return workDao.addWork(vo);
	}

	@Override
	public List<Lecture> lecturechk(int teacher_number) {
		return workDao.lecturechk(teacher_number);
	}

	@Override
	public List<Work> classCheck(int lecture_no) {
		return workDao.classCheck(lecture_no);
	}

	@Override
	public Work viewWork(int work_no) {
		return workDao.viewWork(work_no);
	}

	@Override
	public void removeWork(int work_no) {
		workDao.removeWork(work_no);
	}

	@Override
	public void editWork(Work vo) {
		workDao.editWork(vo);
		
	}

	@Override
	public List<Work> listWorkResult(int startPage, int limit, Map<String, Object> map) {
		return workDao.listWorkResult(startPage, limit, map);
	}

	@Override
	public int getlistWorkResultCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return workDao.getlistWorkResultCount(map);
	}


}
