package com.kh.jd.lecture;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jd.account.Teacher;
import com.kh.jd.lectureClass.LectureClass;
import com.kh.jd.lectureClass.LectureClassService;

@Controller
public class LectureController {
	@Autowired
	private LectureService LService;
	@Autowired
	private LectureClassService LCService;
	
	@RequestMapping(value = "lecture", method = RequestMethod.GET)
	public ModelAndView listLecture(ModelAndView mv, HttpServletRequest request, HttpSession session) {
			System.out.println("@@@@@@@@여기@@@@@@@@");
			Teacher te= (Teacher)request.getSession().getAttribute("DTO");
			int teacher_number=te.getTeacher_number();
			mv.addObject("list", LService.listLecture(teacher_number));
			mv.setViewName("lecture/lectureList");
		return mv;
	}
	
	// 등록 폼
	@RequestMapping(value = "lectureAddForm", method = RequestMethod.GET)
	public String addLecture(ModelAndView mv) {
		return "lecture/lectureAdd";
	}
	
	// 등록
	@RequestMapping(value = "lectureAdd", method = RequestMethod.POST)
	public String addLecture(@ModelAttribute Lecture lecture) {
		LService.addLecture(lecture);
		return "redirect:/lecture";
	}
	
	// 수정 폼
	@RequestMapping(value = "lectureEditForm", method = RequestMethod.GET)
	public String editLecture(HttpServletRequest request, Model m) {
		String num = request.getParameter("lectureNo");
		m.addAttribute("view", LService.viewLecture(num));
		return "/lecture/lectureEdit";
	}
	
	// 수정
	@RequestMapping(value = "lectureEdit", method = RequestMethod.POST)
	public String editLecture(@ModelAttribute Lecture lecture) {
		LService.editLecture(lecture);
		System.out.println("수정들어옴");
		return "redirect:/lecture";
	}
	
	// 삭제
	@RequestMapping(value = "lectureRemove", method = RequestMethod.GET)
	public String removeLecture(HttpServletRequest request) {
		String num = request.getParameter("lectureNo");
		LService.removeLecture(num);
		System.out.println(num);
		return "redirect:/lecture";
	}
}
