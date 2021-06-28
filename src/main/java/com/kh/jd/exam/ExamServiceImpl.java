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

	@Override
	public int checkExamNo(Exam vo) {
		return examDao.checkExamNo(vo);
	}
	
	@Override
	public void addExam(Exam vo) {
		examDao.addExam(vo);
	}

	@Override
	public void editExam(Exam vo) {
		examDao.editExam(vo);
	}

	@Override
	public void removeExam(int exam_no) {
		examDao.removeExam(exam_no);
	}

	@Override
	public List<Exam> registrationNo(int lectureclass_no) {
		return examDao.registrationNo(lectureclass_no);
	}

	@Override
	public int addExamResult(int regstration_no) {
		return examDao.addExamResult(regstration_no);
	}

	
}
