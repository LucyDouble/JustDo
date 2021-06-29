package com.kh.jd.account;

import org.springframework.beans.factory.annotation.Autowired;
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
}
