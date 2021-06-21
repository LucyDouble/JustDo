package com.kh.jd.lectureClass;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.jd.lecture.Lecture;

@Repository("LCdao")
public class LectureClassDao {
	@Autowired
	private SqlSession sqlSession;
	public int addLectureClass(List<LectureClass> list) {
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("list", list);
			return sqlSession.insert("LectureClass.addLectureClass", map);
	}
	public LectureClass viewLectureClass(String num) {
		return sqlSession.selectOne("LectureClass.viewLectureClass", num);
	}
	
	public List<LectureClass> listLectureClass(){
		return sqlSession.selectList("LectureClass.listLectureClass");
	}
}
