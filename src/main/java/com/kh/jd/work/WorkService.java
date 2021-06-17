package com.kh.jd.work;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.kh.jd.lecture.Lecture;

public interface WorkService {

	public List<Work> listWork(int startPage, int limit,Map<String, Object> map);
	public int getListCount(Map<String, Object> map);
	public int addWork(Work vo) ;
	public List<Lecture> lecturechk(int teacher_number);
	public List<Work> classCheck(int lecture_no) ;
	public Work viewWork(int work_no);
	public void removeWork(int work_no) ;
	public void editWork(Work vo) ;
	public List<Work> listWorkResult(int startPage, int limit,Map<String, Object> map) ;
	public int getlistWorkResultCount(Map<String, Object> map) ;
}
