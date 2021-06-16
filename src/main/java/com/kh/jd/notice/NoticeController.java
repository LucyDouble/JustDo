package com.kh.jd.notice;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeController {
@Autowired
private NoticeService noticeService;

	// 목록조회
	@RequestMapping(value = "/listNotice", method = RequestMethod.GET)
	public ModelAndView listNotice(Locale locale, ModelAndView mv) {
		System.out.println(noticeService.listNotice());
		mv.addObject("listNotice", noticeService.listNotice());
		mv.setViewName("notice/listNotice");
		return mv;
	}
	
	// 글조회
	@RequestMapping(value = "/viewNotice", method = RequestMethod.GET)
	public ModelAndView viewNotice(Locale locale, ModelAndView mv, @RequestParam(name="n_no") int notice_no) {
		System.out.println(noticeService.viewNotice(notice_no));
		Notice vo = new Notice ();
		vo = noticeService.viewNotice(notice_no);
		mv.addObject("notice", vo);
		mv.setViewName("notice/viewNotice");
		return mv;
	}
	
	// 글등록
	@RequestMapping(value = "/addNotice", method = RequestMethod.GET)
	public String addNotice(Locale locale, ModelAndView mv) {
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		mv.addObject("serverTime", formattedDate );
		
		return "notice/addNotice";
	}
	
	// 글수정
	@RequestMapping(value = "/editNotice", method = RequestMethod.GET)
	public String editNotice(Locale locale, ModelAndView mv) {
				
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		mv.addObject("serverTime", formattedDate );
		
		return "notice/editNotice";
	}
		
	
	// 글삭제
	@RequestMapping(value = "/removeNotice", method = RequestMethod.GET)
	public String removeNotice(Locale locale, ModelAndView mv) {
				
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		mv.addObject("serverTime", formattedDate );
		
		return "notice/removeNotice";
	}
	
	
}
