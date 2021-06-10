package com.kh.jd.exam;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ExamController {
	
	@RequestMapping(value = "/listExam", method = RequestMethod.GET)
	public String listExam(Locale locale, Model model) {
		
	
		return "exam/listExam";
	}
}
