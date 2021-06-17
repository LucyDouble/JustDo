package com.kh.jd.lecture;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jd.lectureClass.LectureClass;
import com.kh.jd.lectureClass.LectureClassService;

@Controller
public class LectureController {
	@Autowired
	private LectureService LService;
	
	@RequestMapping(value = "lecture", method = RequestMethod.GET)
	public ModelAndView listLecture(ModelAndView mv) {
		System.out.println(LService.listLecture());
		mv.addObject("list", LService.listLecture());
		mv.setViewName("lecture/lectureList");
		return mv;
	}
	
	// 등록 폼
	@RequestMapping(value = "lectureAddForm", method = RequestMethod.GET)
	public String addLecture(ModelAndView mv) {
		return "lecture/lectureAdd";
	}
	
	// 등록 기능
//	@RequestMapping(value = "lectureAdd", method = RequestMethod.POST)
//	public ModelAndView addLecture(
//				Lecture lecture,
//				ModelAndView mv
//			) {
//		System.out.println("ggg");
//		if(lecture==null) {
//			System.out.println("에러");
//		}else {
//			LService.addLecture(lecture);
//			mv.setViewName("redirect:/lecture");
//		}
//		
//		return mv;
//	}
	
	
	
	@RequestMapping(value = "lectureAdd", method = RequestMethod.POST)
	public String addLecture(@ModelAttribute Lecture lecture) {
		LService.addLecture(lecture);
		return "redirect:/lecture";
	}
	
	@RequestMapping(value = "lectureEditForm", method = RequestMethod.GET)
	public String editLecture(HttpServletRequest request) {
		String num = request.getParameter("lectureNo");
		
		System.out.println(num);
		return "redirect:/lecture";
	}
}
