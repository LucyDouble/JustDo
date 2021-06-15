package com.kh.jd.attend;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AttendController {
	@RequestMapping(value = "/listAttend", method = RequestMethod.GET)
	public ModelAndView listAttend(ModelAndView mv) {
		SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMdd");
		Calendar time = Calendar.getInstance();
		String format_time1 = format1.format(time.getTime());
		int nowdate = Integer.parseInt(format_time1);
		mv.addObject("time", nowdate);
		
		mv.setViewName("attend/listAttend");
		
		return mv;
	}
	@RequestMapping("/qr")
	public ModelAndView qrcode(@RequestParam String content) {
		System.out.println("ss?");
		return new ModelAndView("qrcodeview","content",content);
	}
	
}
