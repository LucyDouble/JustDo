package com.kh.jd.lectureClass;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.jd.counseling.Counseling;
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
	
	public List<LectureClass> listJoinClass(int startPage, int limit,Map<String, Object> map){
		int startRow = (startPage - 1) * limit;
		RowBounds row = new RowBounds(startRow, limit);
		return sqlSession.selectList("LectureClass.listJoinClass", map, row);
	}
	
	public int getlistCount(Map<String, Object> map) {
		return sqlSession.selectOne("LectureClass.getlistCount", map);
	}
	
	public List<LectureClass> listCalendarClass(Map<String, Object> map){
		return sqlSession.selectList("LectureClass.listCalendarClass", map);
	}
	public int addPersonnel(int lectureclass_no) {
		return sqlSession.update("LectureClass.addPersonnel", lectureclass_no);
	}
}
