package com.kh.jd.notice;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeController {

	@RequestMapping(value = "/listNotice", method = RequestMethod.GET)
	public String listNotice(Locale locale, ModelAndView mv) {
				
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		mv.addObject("serverTime", formattedDate );
		
		return "notice/listNotice";
	}
	
	@RequestMapping(value = "/viewNotice", method = RequestMethod.GET)
	public String viewNotice(Locale locale, ModelAndView mv) {
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		mv.addObject("serverTime", formattedDate );
		
		return "notice/viewNotice";
	}
	
	@RequestMapping(value = "/addNotice", method = RequestMethod.GET)
	public String addNotice(Locale locale, ModelAndView mv) {
				
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		mv.addObject("serverTime", formattedDate );
		
		return "notice/addNotice";
	}
		
	@RequestMapping(value = "/editNotice", method = RequestMethod.GET)
	public String editNotice(Locale locale, ModelAndView mv) {
				
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		mv.addObject("serverTime", formattedDate );
		
		return "notice/editNotice";
	}
		
	@RequestMapping(value = "/removeNotice", method = RequestMethod.GET)
	public String removeNotice(Locale locale, ModelAndView mv) {
				
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		mv.addObject("serverTime", formattedDate );
		
		return "notice/removeNotice";
	}
	
	@RequestMapping(value = "/NewFile", method = RequestMethod.GET)
	public String NewFile(Locale locale, ModelAndView mv) {
				
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		mv.addObject("serverTime", formattedDate );
		
		return "notice/NewFile";
	}
	
}
