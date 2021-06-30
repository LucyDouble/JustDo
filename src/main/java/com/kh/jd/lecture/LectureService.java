package com.kh.jd.lecture;

import java.util.List;
import java.util.Map;

public interface LectureService {
	public int addLecture(Lecture lecture);
	public List<Lecture> listLecture(int teacher_number);
	public int removeLecture(String lecture_no);
	public Lecture viewLecture(String lecture_no);
	public int editLecture(Lecture lecture);
	public List<Lecture> listLectureClass();
	public Lecture viewLectureClass(Lecture lecture);
	public int checkLectureClass(int lecture_no);
	public void scheduleState();
	public int getListCount(Map<String, Object> map);
}
