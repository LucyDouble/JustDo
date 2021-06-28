package com.kh.jd.exam;

import java.util.List;
import java.util.Map;


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
}
