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
		return workDao.getlistWorkResultCount(map);
	}

	@Override
	public List<Work> registrationNo(int lecture_no) {
		return workDao.registrationNo(lecture_no);
	}

	@Override
	public int addWorkResult(int regstration_no) {
		return workDao.addWorkResult(regstration_no);
	}

	@Override
	public int getCountClass1(int work_no) {
		return workDao.getCountClass1(work_no);
	}

	@Override
	public int getCountWorkSubmit1(int work_no) {
		return workDao.getCountWorkSubmit1(work_no);
	}

	@Override
	public int getCountClass2(int work_no) {
		return workDao.getCountClass2(work_no);
	}

	@Override
	public int getCountWorkSubmit2(int work_no) {
		return workDao.getCountWorkSubmit2(work_no);
	}

	@Override
	public List<Work> listSubmitWork(int startPage, int limit, Map<String, Object> map) {
		return workDao.listSubmitWork(startPage, limit, map);
	}

	@Override
	public int getListSubmitCount(Map<String, Object> map) {
		return workDao.getListSubmitCount(map);
	}

	@Override
	public Work viewSubmitWork(Work vo) {
		return workDao.viewSubmitWork(vo);
	}

	@Override
	public int submitWork(Work vo) {
		return workDao.submitWork(vo);
	}


}
