package com.kh.jd.lecture;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LectureController {
	@RequestMapping(value = "/lecture", method = RequestMethod.GET)
	public String listLecture(Locale locale, Model model) {
	
		return "lecture/lectureList";
	}
	@RequestMapping(value = "/lectureAddForm", method = RequestMethod.GET)
	public String addLecture(Locale locale, Model model) {
		
		return "lecture/lectureAdd";
	}
	@RequestMapping(value = "/lectureEditForm", method = RequestMethod.GET)
	public String editLecture(Locale locale, Model model) {
		
		return "lecture/lectureEdit";
	}
}
