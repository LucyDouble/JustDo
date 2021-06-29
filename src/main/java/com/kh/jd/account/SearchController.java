package com.kh.jd.account;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SearchController {

	@Autowired
	StudentService sService;
	@Autowired
	TeacherService tService;
	

	
	@RequestMapping(value="studentSearch", method=RequestMethod.GET)
	public String studentSearch() {
		return "account/studentSearch";
	}
	
	@RequestMapping(value="account/searchId", method=RequestMethod.POST)
	@ResponseBody
	public String studentIdSearch(@RequestParam("inputName_1") String student_name, @RequestParam("inputEmail_1") String student_email) {
		String result = sService.student_searchId(student_name, student_email);
		System.out.println(result);
		return result;
	}
	
	@RequestMapping(value="account/searchPassword", method=RequestMethod.GET)
	@ResponseBody
	public String studentPwSearch(@RequestParam(name = "inputId") String student_id, @RequestParam(name = "inputEmail_2") String student_email) {
		sService.sendPassword(student_id, student_email);
		System.out.println(student_id);
		System.out.println(student_email);
		return "account/studentSearchPassword";
	}
}
