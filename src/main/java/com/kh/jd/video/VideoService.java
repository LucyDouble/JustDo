package com.kh.jd.video;

import java.util.List;

public interface VideoService {
	public int addVideo(Video video);
	public List<Video> listVideo(int lectureclass_no);
}
