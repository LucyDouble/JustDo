package com.kh.jd.exam;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.kh.jd.work.Work;

public interface ExamService {
	public List<Exam> listExam(int startPage, int limit,Map<String, Object> map) ;
	public int getListCount(Map<String, Object> map) ;
	public Exam viewWork(int exam_no) ;
	public int checkExamNo(Exam vo) ;
	public void addExam(Exam vo) ;
	public List<Exam> registrationNo(int lectureclass_no) ;
	public int addExamResult(int regstration_no) ;
	public void editExam(Exam vo) ;
	public void removeExam(int exam_no) ;
	public int getlistExamResultCount(Map<String, Object> map) ;
	public List<Exam> listExamResult(int startPage, int limit,Map<String, Object> map) ;
	public void editExamGrade(Exam vo) ;
	public int getCountClass1(int exam_no) ;
	public int getCountClass2(int exam_no) ;
	public List<Integer> getGradeExam1(int exam_no) ;
	public List<Integer> getGradeExam2(int exam_no) ; 
	public List<Exam> listSubmitExam(int startPage, int limit,Map<String, Object> map) ;
	public int getlistSubmitCount(Map<String, Object> map) ;
	public Exam viewSubmitExam(Exam vo) ;
	public Exam timeSubmitExam(Exam vo) ;
	public void submitExam(Exam vo) ;
	public void removeSubmitExam(Exam vo) ;
}
