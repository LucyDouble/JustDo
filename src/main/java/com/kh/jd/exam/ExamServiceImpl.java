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

	@Override
	public int getlistExamResultCount(Map<String, Object> map) {
		return examDao.getlistExamResultCount(map);
	}

	@Override
	public List<Exam> listExamResult(int startPage, int limit, Map<String, Object> map) {
		return examDao.listExamResult(startPage, limit, map);
	}

	@Override
	public void editExamGrade(Exam vo) {
		examDao.editExamGrade(vo);
	}

	@Override
	public int getCountClass1(int exam_no) {
		return examDao.getCountClass1(exam_no);
	}

	@Override
	public int getCountClass2(int exam_no) {
		// TODO Auto-generated method stub
		return examDao.getCountClass2(exam_no);
	}

	@Override
	public List<Integer>getGradeExam1(int exam_no) {
		return examDao.getGradeExam1(exam_no);
	}

	@Override
	public List<Integer> getGradeExam2(int exam_no) {
		return examDao.getGradeExam2(exam_no);
	}

	@Override
	public List<Exam> listSubmitExam(int startPage, int limit, Map<String, Object> map) {
		return examDao.listSubmitExam(startPage, limit, map);
	}

	@Override
	public int getlistSubmitCount(Map<String, Object> map) {
		return examDao.getlistSubmitCount(map);
	}

	@Override
	public Exam viewSubmitExam(Exam vo) {
		return examDao.viewSubmitExam(vo);
	}

	@Override
	public Exam timeSubmitExam(Exam vo) {
		return examDao.timeSubmitExam(vo);
	}

	@Override
	public void submitExam(Exam vo) {
		examDao.submitExam(vo);
	}

	@Override
	public void removeSubmitExam(Exam vo) {
		examDao.removeSubmitExam(vo);
	}

	@Override
	public Exam viewExamResult(Exam vo) {
		return examDao.viewExamResult(vo);
	}

	
}
