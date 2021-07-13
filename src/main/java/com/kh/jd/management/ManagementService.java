package com.kh.jd.management;

import java.util.List;

import com.kh.jd.account.Student;
import com.kh.jd.lecture.Lecture;

public interface ManagementService {
	public List<Management> listManagement(int startPage, int limit,Management vo);
	public int getlistManagementCount(Management vo) ;
	public List<Integer> allGrade(int lecture_no);
	public List<Integer> workAllProgress(int lecture_no) ;
	public List<Integer> allAttend(int lecture_no) ;
	public Student infoStudent(int student_number) ;
	public Lecture infoLecture(Management vo) ;
}
