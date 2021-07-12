package com.kh.jd.progress;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("Pdao")
public class ProgressDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int updateProgress(Progress progress) {
		return sqlSession.update("Progress.updateProgress",progress);
	}
	
	public Progress vidwProgress(Progress progress) {
		return sqlSession.selectOne("Progress.vidwProgress", progress);
	}
	
	public int addProgress(Progress progress) {
		return sqlSession.insert("Progress.addProgress",progress);
	}
	
	public List<Integer> avgProgress(int lecture_no){
		return sqlSession.selectList("Progress.avgProgress", lecture_no);
	}

	public List<Integer> avgProgress1(int lecture_no){
		return sqlSession.selectList("Progress.avgProgress1", lecture_no);
	}

	public List<Integer> myProgress(Progress progress){
		return sqlSession.selectList("Progress.myProgress", progress);
	}
	
	public List<Integer> myProgress1(Progress progress){
		return sqlSession.selectList("Progress.myProgress1", progress);
	}

	public List<Integer> classProgress(int lecture_no){
		return sqlSession.selectList("Progress.classProgress", lecture_no);
	}

	public List<Integer> classProgress1(int lecture_no){
		return sqlSession.selectList("Progress.classProgress1", lecture_no);
	}

	public List<Integer> class2Progress(int lecture_no){
		return sqlSession.selectList("Progress.class2Progress", lecture_no);
	}

	public List<Integer> class2Progress1(int lecture_no){
		return sqlSession.selectList("Progress.class2Progress1", lecture_no);
	}

}
