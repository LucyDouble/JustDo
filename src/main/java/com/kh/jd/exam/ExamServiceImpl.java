package com.kh.jd.exam;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jd.work.Work;

@Service("examService")
public class ExamServiceImpl implements ExamService{

	@Autowired
	private ExamDao examDao;
	
	@Override
	public List<Exam> listExam(int startPage, int limit, Map<String, Object> map) {
		return examDao.listExam(startPage, limit, map);
	}

	@Override
	public int getListCount(Map<String, Object> map) {
		return examDao.getListCount(map);
	}

	@Override
	public Exam viewWork(int exam_no) {
		return examDao.viewWork(exam_no);
	}
	
}
