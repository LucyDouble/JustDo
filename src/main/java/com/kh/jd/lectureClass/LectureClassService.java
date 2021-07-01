package com.kh.jd.lectureClass;

import java.util.List;
import java.util.Map;

public interface LectureClassService {
	public int addLectureClass(List<LectureClass> list);
	public LectureClass viewLectureClass(String num);
	public List<LectureClass> listLectureClass();
	public List<LectureClass> listJoinClass(int startPage, int limit,Map<String, Object> map);
	public int getlistCount(Map<String, Object> map);
	public List<LectureClass> listCalendarClass(Map<String, Object> map);
}
