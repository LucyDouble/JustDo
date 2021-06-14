package com.kh.jd.counseling;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class CounselingController {

	@RequestMapping(value = "/listCS", method = RequestMethod.GET)
	public String listCS(Locale locale, ModelAndView mv) {
				
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		mv.addObject("serverTime", formattedDate );
		/* counseling */
		return "counseling/listCS";
	}
	
	@RequestMapping(value = "/viewCS", method = RequestMethod.GET)
	public String viewCS(Locale locale, ModelAndView mv) {
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		mv.addObject("serverTime", formattedDate );
		
		return "counseling/viewCS";
	}
	
	@RequestMapping(value = "/addCS", method = RequestMethod.GET)
	public String addCS(Locale locale, ModelAndView mv) {
				
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		mv.addObject("serverTime", formattedDate );
		
		return "counseling/addCS";
	}
		
	@RequestMapping(value = "/editCS", method = RequestMethod.GET)
	public String editCS(Locale locale, ModelAndView mv) {
				
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		mv.addObject("serverTime", formattedDate );
		
		return "counseling/editCS";
	}
		
	@RequestMapping(value = "/removeCS", method = RequestMethod.GET)
	public String removeCS(Locale locale, ModelAndView mv) {
				
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		mv.addObject("serverTime", formattedDate );
		
		return "counseling/removeCS";
	}
	
	
}