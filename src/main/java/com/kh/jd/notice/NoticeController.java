package com.kh.jd.notice;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public ModelAndView viewNotice(ModelAndView mv, @RequestParam(name="n_no") int notice_no) {
		System.out.println(noticeService.viewNotice(notice_no));
		Notice vo = new Notice ();
		vo = noticeService.viewNotice(notice_no);
		mv.addObject("notice", vo);
		mv.setViewName("notice/viewNotice");
		return mv;
	}
	// 글등록 폼
	@RequestMapping(value = "/addNoticeForm", method = RequestMethod.GET)
	public String addNoticeForm(ModelAndView mv){
		return "notice/addNotice";
	}
	
	// 글등록
	@RequestMapping(value = "/addNotice", method = RequestMethod.POST)
	public ModelAndView addNotice(HttpServletRequest request) {
		//System.out.println("들어왔니 add = "+add);
		ModelAndView mv = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		
		String t_no = "";
		String m_no = "";
		String n_sub = "";
		String n_con = "";
		
		
		t_no = request.getParameter("teacher_number");
		m_no = request.getParameter("manager_number");
		n_sub = request.getParameter("notice_sub");
		n_con = request.getParameter("notice_con");
		
		map.put("teacher_number", t_no);
		map.put("manager_number", m_no);
		map.put("notice_sub", n_sub);
		map.put("notice_con", n_con);
		//map.put("manager_number", mng); //subject, content, num 
		
		System.out.println("map : " + map);
		noticeService.addNotice(map);
		
		mv.setViewName("redirect:/listNotice");
		return mv;
	}
	
	
	
	// 글수정폼
	@RequestMapping(value = "/editNoticeForm", method = RequestMethod.GET)
	public ModelAndView eidtNotice(ModelAndView mv, @RequestParam(name="n_no") int notice_no) {
		Notice vo = new Notice ();
		vo = noticeService.viewNotice(notice_no);
		System.out.println("vo : " + vo);
		mv.addObject("notice", vo);
		mv.setViewName("notice/editNotice");
		return mv;
	}
		
	// 글수정
	@RequestMapping(value = "/editNotice", method = RequestMethod.POST)
	public ModelAndView editNotice(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView(); // mv 객체 생성
		Map<String, Object> map = new HashMap<String, Object>();
		String n_no = "";
		String n_sub = "";
		String n_con = "";
		n_no = request.getParameter("n_no");
		n_sub = request.getParameter("n_sub");
		n_con = request.getParameter("editor1");
		map.put("notice_no", n_no);
		map.put("notice_sub", n_sub);
		map.put("notice_con", n_con);
		System.out.println("컨트롤러 map : " + map);
		noticeService.editNotice(map);
		mv.setViewName("redirect:/viewNotice?n_no="+n_no);
		return mv;
	}
	
	
	// 글삭제
	@RequestMapping(value = "/removeNotice", method = RequestMethod.GET)
	public String removeNotice(RedirectAttributes rttr, @RequestParam(name="n_no") int notice_no) {
		noticeService.removeNotice(notice_no);
		return "redirect:/listNotice";
	}
	
	
}
