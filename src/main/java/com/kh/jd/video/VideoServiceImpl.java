package com.kh.jd.video;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("VService")
public class VideoServiceImpl implements VideoService {
	@Autowired
	private VideoDao Vdao;

	@Override
	public int addVideo(Video video) {
		return Vdao.addVideo(video);
	}

	@Override
	public List<Video> listVideo(Map<String, Object> map){
		return Vdao.listVideo(map);
	}

	@Override
	public int videoCount(Map<String, Object> map) {
		return Vdao.videoCount(map);
	}

	@Override
	public Video viewVideo(int video_no) {
		return Vdao.viewVideo(video_no);
	}

	@Override
	public int editVideo(Video video) {
		return Vdao.editVideo(video);
	}

	@Override
	public int removeVideo(int video_no) {
		return Vdao.removeVideo(video_no);
	}
}
