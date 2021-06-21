package com.kh.jd.lectureClass;

import java.util.List;

public interface LectureClassService {
	public int addLectureClass(List<LectureClass> list);
	public LectureClass viewLectureClass(String num);
	public List<LectureClass> listLectureClass();
}
