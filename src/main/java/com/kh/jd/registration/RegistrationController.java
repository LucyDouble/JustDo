package com.kh.jd.registration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jd.lecture.Lecture;
import com.kh.jd.lecture.LectureService;

@Controller
public class RegistrationController {
	@Autowired
	private LectureService LService;
	@Autowired
	private RegistrationService RService;
	
	// 수강 목록
	@RequestMapping(value = "registration", method = RequestMethod.GET)
	public ModelAndView listLecture(ModelAndView mv, HttpServletRequest request, HttpSession session) {
		System.out.println("@@@@@@@@여기@@@@@@@@");
		mv.addObject("list", LService.listLectureClass());
		mv.setViewName("registration/registrationList");
		return mv;
	}

	// 강의계획서
	@RequestMapping(value = "lecturePlan", method = RequestMethod.GET)
	public String editLecture(Lecture lecture, Model m) {
		m.addAttribute("view", LService.viewLectureClass(lecture));
		return "/registration/lecturePlan";
	}

	// 수강 신청
	@RequestMapping(value = "registrationAdd", method = RequestMethod.POST)
	public String registrationAdd(HttpServletRequest request, Registration registration
			, Model m) {
		int student_no = Integer.parseInt(request.getParameter("student_number"));
		int lectureclass_no = Integer.parseInt(request.getParameter("lectureclass_no"));
		String lectureClassNo = request.getParameter("lectureclass_no");
		registration.setLectureclass_no(lectureclass_no);
		registration.setStudent_number(student_no);
		System.out.println(registration);
		RService.addRegistration(registration);
//		m.addAttribute("check", RService.checkStudent(lectureClassNo));
		return "";
	}
}
