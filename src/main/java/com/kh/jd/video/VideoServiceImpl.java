package com.kh.jd.video;

import java.util.List;

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
	public List<Video> listVideo(int lectureclass_no) {
		return Vdao.listVideo(lectureclass_no);
	}
}
