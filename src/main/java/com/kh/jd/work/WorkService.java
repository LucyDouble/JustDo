package com.kh.jd.work;

import java.util.List;

import com.kh.jd.lecture.Lecture;

public interface WorkService {
	public List<Work> listWork(int startPage, int limit);
	public int getListCount();
	public int addWork(Work vo) ;
	public List<Lecture> lecturechk(int teacher_number);
}
