package com.kh.jd.account;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AccountController {

	@Autowired
	StudentService sService;
	@Autowired
	TeacherService tService;

	@RequestMapping(value = "/signUpPage")
	public String signUpPage() {
		return "account/signUp";
	}

	@RequestMapping(value = "/idCheck", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	@ResponseBody
	public String idCheck(HttpServletRequest request,@RequestParam(name = "select") String check) {
		if(check =="student" || check.equals("student")) {
		String student_id = request.getParameter("student_id");
		int result = sService.idCheck(student_id);
		return Integer.toString(result);
	}else {
		String teacher_id = request.getParameter("teacher_id");
		int result = tService.idCheck(teacher_id);
		return Integer.toString(result);
	}
	}

	@RequestMapping("/login")
	public String login() {
		return "account/login";
	}

	@RequestMapping(value = "/loginCheck")
	public String loginCheck(Student sDto, Teacher tDto, HttpSession session, HttpServletRequest request,
			@RequestParam(name = "select") String check, Model model) {
		System.out.println(check);
		boolean result = false;
		if (check == "student" || check.equals("student")) {
			result = sService.loginCheck(sDto, session);
		} else {
			result = tService.loginCheck(tDto, session);
		}
		if (result) {
			model.addAttribute("msg", "성공");
			session = request.getSession();
			if (check == "student" || check.equals("student")) {
			Student list = new Student();
			list = sService.infoStudent(sDto);
			System.out.println(list);
			request.getSession().setAttribute("studentDTO", list);
			}else {
				Teacher list = new Teacher();
				list = tService.infoTeacher(tDto);
				System.out.println(list);
				request.getSession().setAttribute("teacherDTO", list);
			}
		} else {
			model.addAttribute("msg", "실패");
		}
		return "account/login";
	}

	@RequestMapping("logout")
	public ModelAndView logout(HttpSession session) {
		sService.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("account/login");
		mav.addObject("msg", "logout");
		return mav;
	}
}
