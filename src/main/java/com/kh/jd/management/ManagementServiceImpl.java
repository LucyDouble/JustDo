package com.kh.jd.management;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jd.account.Student;
import com.kh.jd.lecture.Lecture;

@Service("managementService")
public class ManagementServiceImpl implements ManagementService{

	@Autowired
	private ManagementDao managementDao;
	
	@Override
	public List<Management> listManagement(int startPage, int limit,Management vo) {
		return managementDao.listManagement(startPage, limit,vo);
	}

	@Override
	public int getlistManagementCount(Management vo) {
		return managementDao.getlistManagementCount(vo);
	}

	@Override
	public List<Integer> allGrade(int lecture_no) {
		return managementDao.allGrade(lecture_no);
	}

	@Override
	public List<Integer> workAllProgress(int lecture_no) {
		return managementDao.workAllProgress(lecture_no);
	}

	@Override
	public List<Integer> allAttend(int lecture_no) {
		return managementDao.allAttend(lecture_no);
	}

	@Override
	public Student infoStudent(int student_number) {
		return managementDao.infoStudent(student_number);
	}

	@Override
	public Lecture infoLecture(Management vo) {
		return managementDao.infoLecture(vo);
	}

}
