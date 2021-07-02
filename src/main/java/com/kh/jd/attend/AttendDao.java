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
}
