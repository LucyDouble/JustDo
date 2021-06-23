package com.kh.jd.account;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

	private static final Logger logger = LoggerFactory.getLogger(AccountController.class);


	@RequestMapping(value = "/idCheck", method = RequestMethod.GET)
	@ResponseBody
	public String idCheck(HttpServletRequest request, @RequestParam(name = "signUpSelect") String check) {
		System.out.println(check);
		if (check == "student" || check.equals("student")) {
			String student_id = request.getParameter("id");
			System.out.println(student_id);
			int result = sService.idCheck(student_id);
			return Integer.toString(result);
		} else {
			String teacher_id = request.getParameter("id");
			System.out.println(teacher_id);
			int result = tService.idCheck(teacher_id);
			return Integer.toString(result);
		}
	}

	@RequestMapping("/login")
	public String login() {
		return "account/login";
	}



	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		sService.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("account/signUp");
		mav.addObject("msg", "logout");
		return mav;
	}



	
}
	






