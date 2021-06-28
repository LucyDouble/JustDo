package com.kh.jd.exam;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jd.account.Teacher;
import com.kh.jd.lecture.Lecture;
import com.kh.jd.work.Work;
import com.kh.jd.work.WorkService;


@Controller
public class ExamController {
	
	@Autowired
	private ExamService examService;
	@Autowired
	private WorkService workService;
	
	public static final int LIMIT = 10;
	public static final int LIMIT2 = 5;
	public static final int pageBlock = 5;
	@RequestMapping(value = "/listExam", method = RequestMethod.GET)
	public ModelAndView listExam(ModelAndView mv
			, @RequestParam(name = "page", defaultValue = "1") int page
			, @RequestParam(name = "keyword", defaultValue = "") String keyword
			,HttpServletRequest re
			/*, @RequestParam(name = "teacher_number") int teacher_number*/) {

		Teacher te= (Teacher)re.getSession().getAttribute("DTO");
		int teacher_number=te.getTeacher_number();
		Map<String,Object>map = new HashMap<String,Object>();
		map.put("keyword", keyword);
		map.put("teacher_number", teacher_number);
		
		
		SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMdd");
		Calendar time = Calendar.getInstance();
		String format_time1 = format1.format(time.getTime());
		int nowdate = Integer.parseInt(format_time1);
		mv.addObject("time", nowdate);
		
		int listCount = examService.getListCount(map);
		
		int pageCnt = (listCount / LIMIT) + (listCount % LIMIT == 0 ? 0 : 1);
		int currentPage = page;
		
		int startPage = 1; 
		int endPage = 5;
		if(currentPage % pageBlock == 0)   { 
			startPage = ((currentPage/pageBlock)-1) * pageBlock + 1;	
		}else {
			startPage = (currentPage/pageBlock) * pageBlock + 1;  
		}		
		endPage = startPage + pageBlock - 1;
	
		if(endPage > pageCnt)
			endPage = pageCnt;
		// 페이지 값 처리용
		// 한 페이지당 출력할 목록 갯수
		int maxPage = (int) ((double) listCount / LIMIT + 0.9);
		mv.addObject("pageCnt", pageCnt);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", maxPage);
		mv.addObject("keyword", keyword);
		mv.addObject("listCount", listCount);

		
		System.out.println(map.get("keyword")+""+map.get("teacher_number"));
		List<Exam> listExam = examService.listExam(currentPage, LIMIT,map);
		System.out.println(listExam);

		mv.addObject("listExam", listExam);
		mv.setViewName("exam/listExam");
		return mv;
	}
	@RequestMapping(value = "/viewExam")
	public String viewExam(@RequestParam(name = "exam_no") int exam_no, Model model )  {
		SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMdd");

		Calendar time = Calendar.getInstance();
		String format_time1 = format1.format(time.getTime());
		int nowdate = Integer.parseInt(format_time1);
		model.addAttribute("time", nowdate);
		Exam vo = examService.viewWork(exam_no);
		model.addAttribute("examDto", vo);
		return "exam/viewExam";
	}
	@RequestMapping(value = "/addExamForm")
	public String addExamForm(HttpServletRequest re, Model model )  {
		Teacher te = (Teacher)re.getSession().getAttribute("DTO");
		List<Lecture> list = workService.lecturechk(te.getTeacher_number());
		model.addAttribute("lecturechk", list);
		return "exam/addExam";
	}
	@RequestMapping(value = "/addExam", method = RequestMethod.POST)
	public String addExam(HttpServletRequest re, Model model,Exam vo )  {
		int class_no=examService.checkExamNo(vo);
		vo.setLectureclass_no(class_no);
		examService.addExam(vo);
		List<Exam> aa =examService.registrationNo(vo.getLectureclass_no());
		System.out.println(aa);
		for (Exam exam : aa) {
			examService.addExamResult(exam.getRegistration_no());
		}
		
		return "redirect:/listExam";
	}
	@RequestMapping(value = "/editExamFrom")
	public String editExamForm(@RequestParam(name = "exam_no") int exam_no
			, Model model
			,HttpServletRequest re)  {
		Teacher te =(Teacher) re.getSession().getAttribute("DTO");
		Exam vo = examService.viewWork(exam_no);
		model.addAttribute("examDto", vo);
		List<Lecture> list = workService.lecturechk(te.getTeacher_number());
		model.addAttribute("lecturechk", list);
		return "exam/editExam";
	}
	@RequestMapping(value = "/editExam", method = RequestMethod.POST)
	public String editExam(HttpServletRequest re, Model model,Exam vo )  {
		System.out.println(vo.getLecture_no());
		System.out.println(vo.getLectureclass_class());
		int class_no=examService.checkExamNo(vo);
		System.out.println("번호"+class_no);
		vo.setLectureclass_no(class_no);
		examService.editExam(vo);
		
		SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMdd");

		Calendar time = Calendar.getInstance();
		String format_time1 = format1.format(time.getTime());
		int nowdate = Integer.parseInt(format_time1);
		model.addAttribute("time", nowdate);
		Exam vo1 = examService.viewWork(vo.getExam_no());
		model.addAttribute("examDto", vo1);
		return "exam/viewExam";
	}
	@RequestMapping(value = "/removeExam", method = RequestMethod.POST)
	public String removeExam(@RequestParam(name = "exam_no") int exam_no )  {

		examService.removeExam(exam_no);
		return "redirect:/listExam";
	}
}
