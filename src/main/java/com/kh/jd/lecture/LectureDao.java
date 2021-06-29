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
	
	public List<Lecture> listLecture(int teacher_number){
		return sqlSession.selectList("Lecture.listLecture", teacher_number);
	}
	
	public int removeLecture(String lecture_no) {
		int result = 0;
		result = sqlSession.delete("Lecture.removeLecture", lecture_no);
		return result;
	}
	
	public Lecture viewLecture(String lecture_no) {
		return sqlSession.selectOne("Lecture.viewLecture",lecture_no);
	}
	
	public int editLecture(Lecture lecture) {
		return sqlSession.update("Lecture.editLecture", lecture);
	}
	
	public List<Lecture> listLectureClass(){
		return sqlSession.selectList("Lecture.listLectureClass");
	}
	
	public Lecture viewLectureClass(Lecture lecture) {
		return sqlSession.selectOne("Lecture.viewLectureClass", lecture);
	}
}
