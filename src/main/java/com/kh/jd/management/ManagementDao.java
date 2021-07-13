package com.kh.jd.management;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.jd.account.Student;
import com.kh.jd.lecture.Lecture;

@Repository("managementDao")
public class ManagementDao {
	
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<Management> listManagement(int startPage, int limit,Management vo){
		int startRow = (startPage - 1) * limit;
		RowBounds row = new RowBounds(startRow, limit);
		return sqlSession.selectList("management.listManagement", vo,row);
	} 
	public int getlistManagementCount(Management vo) {
		return sqlSession.selectOne("management.getlistManagementCount", vo);
	}
	public List<Integer> allGrade(int lecture_no) {
		return sqlSession.selectList("management.allGrade", lecture_no);
	}
	public List<Integer> workAllProgress(int lecture_no) {
		return sqlSession.selectList("management.workAllProgress", lecture_no);
	}
	public List<Integer> allAttend(int lecture_no) {
		return sqlSession.selectList("management.allAttend", lecture_no);
	}
	public Student infoStudent(int student_number) {
		return sqlSession.selectOne("management.infoStudent", student_number);
	}
	public Lecture infoLecture(Management vo) {
		return sqlSession.selectOne("management.infoLecture",vo);
	}
}
