package com.kh.jd.registration;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jd.lecture.Lecture;
import com.kh.jd.lecture.LectureService;

@Controller
public class RegistrationController {
	public static final int LIMIT = 10;
	public static final int pageBlock = 5;
	@Autowired
	private LectureService LService;
	@Autowired
	private RegistrationService RService;
	
	// 수강 목록
	@RequestMapping(value = "registration", method = RequestMethod.GET)
	public ModelAndView listLecture(ModelAndView mv, HttpServletRequest request, HttpSession session,
			@RequestParam(name="page", defaultValue = "1") int page,
			@RequestParam(name="keyword", defaultValue = "") String keyword) {
		System.out.println("@@@@@@@@여기@@@@@@@@");
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		
		int listCount = LService.getListCount(map);
		int pageCnt = (listCount / LIMIT) + (listCount % LIMIT == 0 ? 0 : 1);
		int currentPage = page;
		
		int startPage = 1;
		int endPage = 5;
		if(currentPage % pageBlock == 0) {
			startPage = ((currentPage/pageBlock)-1) * pageBlock + 1;
		}else {
			startPage = ((currentPage/pageBlock)) * pageBlock + 1;
		}
		endPage = startPage + pageBlock - 1;
		
		if(endPage > pageCnt)
			endPage = pageCnt;
		
		int maxPage = (int)((double) listCount / LIMIT + 0.9 );
		mv.addObject("pageCnt", pageCnt);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", maxPage);
		mv.addObject("keyword", keyword);
		mv.addObject("listCount", listCount);

		
		
		mv.addObject("list", LService.listLectureClass());
		mv.setViewName("registration/registrationList");
		return mv;
	}

	// 강의계획서
	@RequestMapping(value = "lecturePlan", method = RequestMethod.GET)
	public String editLecture(Lecture lecture, Model m) {
		m.addAttribute("view", LService.viewLectureClass(lecture));
		return "/registration/lecturePlan";
	}

	// 수강 신청
	@RequestMapping(value = "registrationAdd", method = RequestMethod.POST)
	public String registrationAdd(HttpServletRequest request, Registration registration
			, Model m) {
		int student_no = Integer.parseInt(request.getParameter("student_number"));
		int lectureclass_no = Integer.parseInt(request.getParameter("lectureclass_no"));
		String lectureClassNo = request.getParameter("lectureclass_no");
		registration.setLectureclass_no(lectureclass_no);
		registration.setStudent_number(student_no);
		System.out.println(registration);
		RService.addRegistration(registration);
//		m.addAttribute("check", RService.checkStudent(lectureClassNo));
		return "";
	}
	
	// 캘린더에 내 강의 출력
	@RequestMapping(value = "calendarAdd", method = RequestMethod.POST)
	@ResponseBody
	public List<Registration> calendarAdd(HttpServletRequest request, HttpServletResponse response) {
		String number = "4";
		System.out.println(RService.calendarAdd(number));
//		JSONObject json = new JSONObject();
//		JSONArray json = new JSONArray();
//		json.add(RService.calendarAdd(number));
//		json.put("result", RService.calendarAdd(number));
		
//		return json;
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		map.put("result",  RService.calendarAdd(number));
		return RService.calendarAdd(number);
	}
	
	
}
