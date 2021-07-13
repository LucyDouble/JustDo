package com.kh.jd.attend;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("attendDao")
public class AttendDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<Attend> checkLecture(int student_number){
		return sqlSession.selectList("attend.checkLecture", student_number);
	}
	public void scheduleAttend() {
		sqlSession.selectOne("attend.scheduleAttend");
	}
	public List<Attend> listAttend(int startPage, int limit,Attend vo){
		int startRow = (startPage - 1) * limit;
		RowBounds row = new RowBounds(startRow, limit);
		return sqlSession.selectList("attend.listAttend", vo,row);
	}
	public void editAttend(Attend vo) {
		sqlSession.update("attend.editAttend",vo);
	}
	public void editAttendExit(Attend vo) {
		sqlSession.update("attend.editAttendExit",vo);
	}
	public int getlistAttendCount(Attend vo) {
		return sqlSession.selectOne("attend.getlistAttendCount",vo);
	}
	public int startCheck(Attend vo) {
		return sqlSession.selectOne("attend.startCheck",vo);
	}
	public int endCheck(Attend vo) {
		return sqlSession.selectOne("attend.endCheck",vo);
	}
	public void attendprogress() {
		sqlSession.selectOne("attend.attendprogress");
	}
	public int progressTotal(Attend vo) {
		return sqlSession.selectOne("attend.progressTotal",vo);
	}
	public int progressAttend(Attend vo) {
		return sqlSession.selectOne("attend.progressAttend",vo);
	}
	public int progressLate(Attend vo) {
		return sqlSession.selectOne("attend.progressLate",vo);
	}
	public int progressSoLate(Attend vo) {
		return sqlSession.selectOne("attend.progressSoLate",vo);
	}
	public int progressClassTotal(Attend vo) {
		return sqlSession.selectOne("attend.progressClassTotal",vo);
	}
	public int progressClassAttend(Attend vo) {
		return sqlSession.selectOne("attend.progressClassAttend",vo);
	}
	public int progressClassLate(Attend vo) {
		return sqlSession.selectOne("attend.progressClassLate",vo);
	}
	public int progressClassSoLate(Attend vo) {
		return sqlSession.selectOne("attend.progressClassSoLate",vo);
	}
}
