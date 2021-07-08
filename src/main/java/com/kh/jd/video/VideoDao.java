package com.kh.jd.video;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
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
	public List<Video> listVideo(Map<String, Object> map){
		return sqlSession.selectList("Video.listVideo", map);
	}
	public int videoCount(Map<String, Object> map) {
		return sqlSession.selectOne("Video.videoCount", map);
	}
	public Video viewVideo(int video_no) {
		return sqlSession.selectOne("Video.viewVideo", video_no);
	}
	public int editVideo(Video video) {
		return sqlSession.update("Video.editVideo", video);
	}
	public int removeVideo(int video_no) {
		return sqlSession.delete("Video.removeVideo", video_no);
	}
}
