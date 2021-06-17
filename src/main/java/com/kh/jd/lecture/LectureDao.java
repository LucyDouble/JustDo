package com.kh.jd.lecture;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("LDao")
public class LectureDao {
	@Autowired
	private SqlSession sqlSession;
	public int addLecture(Lecture lecture) {
		int result = 0;
		try {
			result = sqlSession.insert("Lecture.addLecture", lecture);
			System.out.println("인서트 들어옴");
		} catch (Exception e) {
			System.out.println("오류4");
			e.printStackTrace();
		}
		return result;
	}
	public List<Lecture> listLecture(){
		return sqlSession.selectList("Lecture.listLecture");
	}
}
