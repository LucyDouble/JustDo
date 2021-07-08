package com.kh.jd.video;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("Vdao")
public class VideoDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int addVideo(Video video) {
		return sqlSession.insert("Video.addVideo", video);
	}
	public List<Video> listVideo(int lectureclass_no){
		return sqlSession.selectList("Video.listVideo", lectureclass_no);
	}
}
