package com.kh.jd.lectureClass;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.jd.lecture.Lecture;
import com.kh.jd.lecture.LectureService;

@Controller
public class LectureClassController {
	@Autowired
	private LectureClassService LCService;
	
	// 분반 등록 폼
	@RequestMapping(value="lectureClassAddForm", method=RequestMethod.GET)
	public String addLectureClass() {
		/*
		 * Lecture lc = new Lecture(); int num =
		 * Integer.parseInt(request.getParameter("lecture_no")); lc.setLecture_no(num);
		 * request.setAttribute("number", lc);
		 */
		return "lectureClass/lectureClassAdd";
	}
	
	// 분반 등록
	@RequestMapping(value="lectureClassAdd", method=RequestMethod.POST)
	public String addLectureCl(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("lecture_no"));
		int num1 = Integer.parseInt(request.getParameter("lecture_no_1"));
		int cl = Integer.parseInt(request.getParameter("lectureclass_class"));
		String start = request.getParameter("lectureclass_start");
		String end = request.getParameter("lectureclass_end");
		int cl1 = Integer.parseInt(request.getParameter("lectureclass_class_1"));
		String start1 = request.getParameter("lectureclass_start_2");
		String end1 = request.getParameter("lectureclass_end_3");
		
		LectureClass lc1 = new LectureClass();
		lc1.setLecture_no(num);
		lc1.setLectureclass_class(cl);
		lc1.setLectureclass_start(start);
		lc1.setLectureclass_end(end);
		
		LectureClass lc2 = new LectureClass();
		lc2.setLecture_no(num1);
		lc2.setLectureclass_class(cl1);
		lc2.setLectureclass_start(start1);
		lc2.setLectureclass_end(end1);
		
		List<LectureClass> list = new ArrayList<LectureClass>();
		list.add(lc1);
		list.add(lc2);
		
		LCService.addLectureClass(list);
		
		return "lecture/lectureList";
	}
}
