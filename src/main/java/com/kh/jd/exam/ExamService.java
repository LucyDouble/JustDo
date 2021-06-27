package com.kh.jd.exam;

import java.util.List;
import java.util.Map;


import com.kh.jd.work.Work;

public interface ExamService {
	public List<Exam> listExam(int startPage, int limit,Map<String, Object> map) ;
	public int getListCount(Map<String, Object> map) ;
	public Exam viewWork(int exam_no) ;
}
