package com.kh.jd.lecture;

import java.util.List;

public interface LectureService {
	public int addLecture(Lecture lecture);
	public List<Lecture> listLecture(int teacher_number);
	public int removeLecture(String lecture_no);
	public Lecture viewLecture(String lecture_no);
	public int editLecture(Lecture lecture);
	public List<Lecture> listLectureClass();
	public Lecture viewLectureClass(Lecture lecture);
}
