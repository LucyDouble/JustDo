package com.kh.jd.account;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AccountController {

	@Autowired
	StudentService service;

	@RequestMapping(value = "/signUpPage")
	public String signUpPage() {
		return "signUp";
	}

	@RequestMapping(value = "/Student/idCheck", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	@ResponseBody
	public String idCheck(HttpServletRequest request) {
		String student_id = request.getParameter("student_id");
		int result = service.idCheck(student_id);
		return Integer.toString(result);
	}
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping(value="/loginCheck")
	public ModelAndView loginCheck(@ModelAttribute Student dto, HttpSession session) {
		boolean result = service.loginCheck(dto, session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login");
		if(result) {
			mav.addObject("msg", "성공");
		}else {
			mav.addObject("msg", "실패");
		}
		return mav;
	}
	@RequestMapping("logout")
	public ModelAndView logout(HttpSession session) {
		service.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login");
		mav.addObject("msg", "logout");
		return mav;
	}
}
