package com.kh.jd.attend;

import java.util.List;

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
	public List<Attend> listAttend(Attend vo){
		return sqlSession.selectList("attend.listAttend", vo);
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
}
