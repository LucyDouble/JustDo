package com.kh.jd.lectureClass;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("LCService")
public class LectureClassServiceImpl implements LectureClassService {
	@Autowired
	private LectureClassDao LCdao;
	

	@Override
	public LectureClass viewLectureClass(String num) {
		return LCdao.viewLectureClass(num);
	}

	@Override
	public int addLectureClass(List<LectureClass> list) {
		
		return LCdao.addLectureClass(list);
	}

	@Override
	public List<LectureClass> listLectureClass() {
		return LCdao.listLectureClass();
	}

	@Override
	public List<LectureClass> listJoinClass(int startPage, int limit, Map<String, Object> map) {
		return LCdao.listJoinClass(startPage, limit, map);
	}

	@Override
	public int getlistCount(Map<String, Object> map) {
		return LCdao.getlistCount(map);
	}

	@Override
	public List<LectureClass> listCalendarClass(Map<String, Object> map) {
		return LCdao.listCalendarClass(map);
	}
	
}
