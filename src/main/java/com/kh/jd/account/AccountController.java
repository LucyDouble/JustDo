package com.kh.jd.account;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AccountController {
	
	@Autowired
	StudentService service;
	
	@RequestMapping(value = "/signUpPage.do")
	public String signUpPage() {
		return "signUp";
	}
		@RequestMapping(value = "/signUp.do")
		public String signUp(Student dto) {
		service.signUp(dto);	
		return "login";
	}
@RequestMapping(value="idCheck", method = RequestMethod.GET, produces = "application/text; charset=utf8")
@ResponseBody
	public String idCheck(HttpServletRequest request) {
	String student_id = request.getParameter("student_id");
	int result = service.idCheck(student_id);
	return Integer.toString(result);
}
	
}
