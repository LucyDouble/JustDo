package com.kh.jd.registration;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.jd.account.Student;
import com.kh.jd.account.Teacher;
import com.kh.jd.lecture.Lecture;
import com.kh.jd.lecture.LectureService;
import com.kh.jd.lectureClass.LectureClass;
import com.kh.jd.lectureClass.LectureClassService;

@Controller
public class RegistrationController {
	public static final int LIMIT = 10;
	public static final int pageBlock = 5;
	@Autowired
	private LectureService LService;
	@Autowired
	private RegistrationService RService;
	@Autowired
	private LectureClassService LCService;
	
	// 수강 목록, 신청
	@RequestMapping(value = "registration", method = RequestMethod.GET)
	public ModelAndView listLecture(ModelAndView mv, HttpServletRequest request, HttpSession session,
			@RequestParam(name="page", defaultValue = "1") int page,
			@RequestParam(name="keyword", defaultValue = "") String keyword) {
		System.out.println("@@@@@@@@여기@@@@@@@@");
		int student_number = 0;
		try {
			Student st= (Student)request.getSession().getAttribute("DTO");
			student_number=st.getStudent_number();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("-----------수강목록, 신청 리스트 출력할때 학생 세션 오류------------");
		}
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		
		int listCount = LCService.getlistCount(map);
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
		List<LectureClass> list = LCService.listJoinClass(startPage, LIMIT, map);
		mv.addObject("list", list);
		List<Registration> list2 = RService.listRegistration(student_number);
		System.out.println("수강신청 리스트"+ list2);
		mv.addObject("list2", list2);
		mv.setViewName("registration/registrationList");
		return mv;
	}

	// 강의계획서
	@RequestMapping(value = "lecturePlan", method = RequestMethod.GET)
	public String addLecturePlan(Lecture lecture, Model m) {
		m.addAttribute("view", LService.addLecturePlan(lecture));
		return "/registration/lecturePlan";
	}

	// 수강 신청
		@ResponseBody
		@RequestMapping(value = "registrationAdd", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
		public String registrationAdd(HttpServletRequest request, Registration registration
				, Model m, HttpServletResponse response) {
			response.setCharacterEncoding("UTF-8");
			int student_number = 0;
			Map<String, Object> map = new HashMap<String, Object>();
			try {
				Student st= (Student)request.getSession().getAttribute("DTO");
				student_number=st.getStudent_number();
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("-----------수강신청할때 학생 세션 오류------------");
			}
			int lectureclass_no = Integer.parseInt(request.getParameter("lectureclass_no"));
			int lecture_no = Integer.parseInt(request.getParameter("lecture_no"));
			System.out.println("강의번호강의번호!"+lecture_no);
			registration.setLectureclass_no(lectureclass_no);
			registration.setStudent_number(student_number);
			System.out.println(registration);
			if(RService.checkStudent(registration)==null) {
				RService.addRegistration(registration); // 수강신청
				LCService.addPersonnel(lectureclass_no); // 수강인원 +1	
				map.put("result","수강신청을 완료했습니다.");
			}else {
				map.put("result","이미 수강중인 강의입니다.");
			}
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String result = gson.toJson(map);
			return result;
		}
	
	// 캘린더에 내 수강 신청한 목록 출력
	@RequestMapping(value = "calendarAdd", method = RequestMethod.POST)
	@ResponseBody
	public List<Registration> calendarAdd(HttpServletRequest request, HttpServletResponse response) {
		int student_number = 0;
		try {
			Student st= (Student)request.getSession().getAttribute("DTO");
			student_number=st.getStudent_number();
			System.out.println(RService.calendarAdd(student_number));
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("-------캘린더 목록출력때 학생 정보 세션 오류---------");
		} 
		return RService.calendarAdd(student_number);
	}
	
	// 캘린더에 수강 신청 할 강의 출력
	@RequestMapping(value = "calendarAdd2", method = RequestMethod.POST)
	@ResponseBody
	public List<LectureClass> calendarAdd2(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(name="keyword", defaultValue = "") String keyword) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		System.out.println("수강신청 캘린더" + LCService.listCalendarClass(map));
		return LCService.listCalendarClass(map);
	}
	
	
}
