package com.kh.jd.lecture;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("LService")
public class LectureServiceImpl implements LectureService{
	@Autowired
	private LectureDao Ldao;
	
	@Override
	public int addLecture(Lecture lecture) {
		int result = 0;
		try {
			System.out.println("오류1");
			result = Ldao.addLecture(lecture);
		} catch (Exception e) {
			System.out.println("오류2");
			e.printStackTrace();
		}
		
		return result;
	}
	@Override
	public List<Lecture> listLecture(int teacher_number) {
		return Ldao.listLecture(teacher_number);
	}
	
	@Override
	public int removeLecture(String lecture_no) {
		int result = 0;
		result = Ldao.removeLecture(lecture_no);
		return result;
	}
	
	@Override
	public Lecture viewLecture(String lecture_no) {
		return Ldao.viewLecture(lecture_no);
	}
	
	@Override
	public int editLecture(Lecture lecture) {
		return Ldao.editLecture(lecture);
	}
	
	@Override
	public List<Lecture> listLectureClass() {
		return Ldao.listLectureClass();
	}
	@Override
	public Lecture viewLectureClass(Lecture lecture) {
		return Ldao.viewLectureClass(lecture);
	}

}
