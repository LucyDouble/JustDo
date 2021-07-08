package com.kh.jd.video;

import java.util.List;
import java.util.Map;

public interface VideoService {
	public int addVideo(Video video);
	public List<Video> listVideo(Map<String, Object> map);
	public int videoCount(Map<String, Object> map);
	public Video viewVideo(int video_no);
	public int editVideo(Video video);
}
