package com.kh.jd.exam;

import java.io.IOException;
import java.io.PrintWriter;
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
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jd.account.Student;
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

		
		SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMdd");
		Calendar time = Calendar.getInstance();
		String format_time1 = format1.format(time.getTime());
		int nowdate = Integer.parseInt(format_time1);
		mv.addObject("time", nowdate);
		
		SimpleDateFormat format2 = new SimpleDateFormat("HHmm");
		String format_time2 = format2.format(time.getTime());
		int nowdate2 = Integer.parseInt(format_time2);
		mv.addObject("time2", nowdate2);
		
		SimpleDateFormat format3 = new SimpleDateFormat("yyyy-MM-dd");
		String format_time3 = format3.format(time.getTime());
		mv.addObject("nowdate", format_time3);
		
		SimpleDateFormat format4 = new SimpleDateFormat("HH:mm");
		String format_time4 = format4.format(time.getTime());
		mv.addObject("nowtime", format_time4);
		
		
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
		examService.addExam(vo);
		List<Work> aa =workService.registrationNo(vo.getLecture_no());
		System.out.println(aa);
		for (Work exam: aa) {
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
	@RequestMapping(value = "/listExamResult", method = RequestMethod.POST)
	public ModelAndView listExamResult(Exam vo,ModelAndView mv
			, @RequestParam(name = "page", defaultValue = "1") int page
			, @RequestParam(name = "keyword", defaultValue = "") String keyword,HttpServletRequest re)  {
		
		
		//TODO
		double class1_mo= examService.getCountClass1(vo.getExam_no());
		List<Integer> class1_ch= examService.getGradeExam1(vo.getExam_no());
		double class2_mo= examService.getCountClass2(vo.getExam_no());
		List<Integer> class2_ch= examService.getGradeExam2(vo.getExam_no());
		System.out.println(class1_ch+"이게 나오려나요?"+class1_ch);
		if(class1_mo==0) {
			class1_mo=1;
		}
		if(class2_mo==0) {
			class2_mo=1;
		}
		int class1Sum=0;
		int class2Sum=0;
		for (Integer integer : class1_ch) {
			class1Sum +=integer;
		}
		for (Integer integer : class2_ch) {
			class2Sum +=integer;
		}
		String classOne=String.format("%.0f", class1Sum/class1_mo);
		String classTwo=String.format("%.0f", class2Sum/class2_mo);
		String total =String.format("%.0f", (class1Sum+class2Sum)/(class2_mo+class1_mo));
		
		
		System.out.println(classOne);
		System.out.println(classTwo);
		System.out.println(total);
		Map<String,Object>map = new HashMap<String,Object>();
		map.put("keyword", keyword);
		map.put("exam_no", vo.getExam_no());
		
		
		int listCount = examService.getlistExamResultCount(map);
		
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
		mv.addObject("lecture_title",vo.getLecture_title() );
		mv.addObject("lecture_class",vo.getLectureclass_class() );
		mv.addObject("exam_subject",vo.getExam_subject() );
		mv.addObject("exam_date",vo.getExam_date() );
		mv.addObject("exam_start",vo.getExam_start() );
		mv.addObject("exam_end",vo.getExam_end() );
		mv.addObject("exam_no", vo.getExam_no() );
		mv.addObject("classOne", classOne);
		mv.addObject("classTwo", classTwo);
		mv.addObject("total", total);
		
		List<Exam> listExam = examService.listExamResult(currentPage, LIMIT,map);
		System.out.println(listExam);
		mv.addObject("listExam", listExam);
		mv.setViewName("examResult/listExamResult");
		
		re.getSession().setAttribute("examResult", vo);
		
		return mv;
	}
	@RequestMapping(value = "/listExamResult", method = RequestMethod.GET)
	public ModelAndView listExamResultw(ModelAndView mv
			, @RequestParam(name = "page", defaultValue = "1") int page
			, @RequestParam(name = "keyword", defaultValue = "") String keyword,HttpServletRequest re)  {
		Exam vo =(Exam)re.getSession().getAttribute("examResult");
		
		//TODO
		double class1_mo= examService.getCountClass1(vo.getExam_no());
		List<Integer> class1_ch= examService.getGradeExam1(vo.getExam_no());
		double class2_mo= examService.getCountClass2(vo.getExam_no());
		List<Integer> class2_ch= examService.getGradeExam2(vo.getExam_no());
		System.out.println(class1_ch+"이게 나오려나요?"+class1_ch);
		if(class1_mo==0) {
			class1_mo=1;
		}
		if(class2_mo==0) {
			class2_mo=1;
		}
		int class1Sum=0;
		int class2Sum=0;
		for (Integer integer : class1_ch) {
			class1Sum +=integer;
		}
		for (Integer integer : class2_ch) {
			class2Sum +=integer;
		}
		String classOne=String.format("%.0f", class1Sum/class1_mo);
		String classTwo=String.format("%.0f", class2Sum/class2_mo);
		String total =String.format("%.0f", (class1Sum+class2Sum)/(class2_mo+class1_mo));
		
		
		System.out.println(classOne);
		System.out.println(classTwo);
		System.out.println(total);
		Map<String,Object>map = new HashMap<String,Object>();
		map.put("keyword", keyword);
		map.put("exam_no", vo.getExam_no());
		
		
		int listCount = examService.getlistExamResultCount(map);
		
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
		mv.addObject("lecture_title",vo.getLecture_title() );
		mv.addObject("lecture_class",vo.getLectureclass_class() );
		mv.addObject("exam_subject",vo.getExam_subject() );
		mv.addObject("exam_date",vo.getExam_date() );
		mv.addObject("exam_start",vo.getExam_start() );
		mv.addObject("exam_end",vo.getExam_end() );
		mv.addObject("exam_no", vo.getExam_no() );
		mv.addObject("classOne", classOne);
		mv.addObject("classTwo", classTwo);
		mv.addObject("total", total);
		
		List<Exam> listExam = examService.listExamResult(currentPage, LIMIT,map);
		System.out.println(listExam);
		mv.addObject("listExam", listExam);
		mv.setViewName("examResult/listExamResult");
		
		re.getSession().setAttribute("examResult", vo);
		
		return mv;
	}
	@RequestMapping(value = "/viewExamResult", method = RequestMethod.POST)
	public ModelAndView viewExamResult(Exam vo, ModelAndView mv )  {
		mv.addObject("examDto", vo);
		System.out.println("안나온=면ㅇ 죽인다"+vo);
		Exam vo2=examService.viewExamResult(vo);
		vo.setExam_content(vo2.getExam_content());
		vo.setExam_answer(vo2.getExam_answer());
		vo.setExam_submit(vo.getExam_submit());
		mv.setViewName("examResult/viewExamResult");
		return mv;
	}
	@RequestMapping(value="editExamGrade", method=RequestMethod.POST) 
	public void editExamGrade( HttpServletResponse response, Exam vo,
		HttpSession session) throws IOException{
		response.setContentType("text/html; charset=utf-8"); // PrintWriter 객체를 생성하여 통신에 대한 응답 결과를 전달한다. 
		PrintWriter out = response.getWriter(); 
		examService.editExamGrade(vo);
		
			out.flush(); 
			out.close();
	}
	
	@RequestMapping(value = "/listSubmitExam", method = RequestMethod.GET)
	public ModelAndView listSubmitWork(ModelAndView mv
			, @RequestParam(name = "page", defaultValue = "1") int page
			, @RequestParam(name = "keyword", defaultValue = "") String keyword
			,HttpServletRequest re
			/*, @RequestParam(name = "student_number") int student_number*/) throws ParseException {

		//TODO 완료 - 세션값 처리
		Student st = (Student) re.getSession().getAttribute("DTO");
		int student_number=st.getStudent_number();
		Map<String,Object>map = new HashMap<String,Object>();
		map.put("keyword", keyword);
		map.put("student_number", student_number);
		
		
		SimpleDateFormat format1 = new SimpleDateFormat("HHmm");
		Calendar time = Calendar.getInstance();
		String format_time1 = format1.format(time.getTime());
		int nowdate = Integer.parseInt(format_time1);
		mv.addObject("time", nowdate);
		
		
		SimpleDateFormat format2 = new SimpleDateFormat("yyyyMMdd");
		Calendar time2 = Calendar.getInstance();
		String format_time2 = format2.format(time2.getTime());
		int nowdate2 = Integer.parseInt(format_time2);
		mv.addObject("time2", nowdate2);
		
		int listCount = examService.getlistSubmitCount(map);
		
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

		
		List<Exam> listExam = examService.listSubmitExam(currentPage, LIMIT,map);
		System.out.println(listExam);

		mv.addObject("listExam", listExam);
		mv.setViewName("exam/listSubmitExam");
		return mv;
	}	
	@RequestMapping(value = "/viewSubmitExam")
	public String viewSubmitExam(Exam vo, Model model )  {
		
		
		SimpleDateFormat format1 = new SimpleDateFormat("HHmm");
		Calendar time = Calendar.getInstance();
		String format_time1 = format1.format(time.getTime());
		int nowdate = Integer.parseInt(format_time1);
		model.addAttribute("time", nowdate);
		
		
		SimpleDateFormat format2 = new SimpleDateFormat("yyyyMMdd");
		Calendar time2 = Calendar.getInstance();
		String format_time2 = format2.format(time2.getTime());
		int nowdate2 = Integer.parseInt(format_time2);
		model.addAttribute("time2", nowdate2);
		Exam vo1 = examService.viewSubmitExam(vo);
		Exam vo2 = examService.timeSubmitExam(vo);
		
		
		
		System.out.println("뭐가 어케 들어오지?"+vo1);
		System.out.println("뭐가 어케 들어오지?"+vo2);
		model.addAttribute("examTime", vo2);
		model.addAttribute("examDto", vo1);
		return "exam/viewSubmitExam";
	}
	@RequestMapping(value = "/submitExamForm", method = RequestMethod.POST)
	public String submitExamForm(Model model,Exam vo) {
		Exam vo1 = examService.viewSubmitExam(vo);;
		Exam vo2 = examService.timeSubmitExam(vo);
		model.addAttribute("examDto", vo1);
		model.addAttribute("examTime", vo2);
		return "exam/submitExam";
	}
	@RequestMapping(value = "/submitExam", method = RequestMethod.POST)
	public String submitExam(Exam vo )  {

		examService.submitExam(vo);
		
		return "redirect:/listSubmitExam";
	}
	@RequestMapping(value = "/removeSubmitExam", method = RequestMethod.POST)
	public String removeSubmitExam(Model model,Exam vo) {
		examService.removeSubmitExam(vo);
		//TODO 리스트로 가려면 학생 넘버를 받아 와서 세션으로 넘겨 줘야 함. 애초에 리스트에서 세션으로 정해 줄 수도 있으니 참조.
		return "redirect:/listSubmitExam";
	}
	@RequestMapping(value = "/editSubmitExamForm", method = RequestMethod.POST)
	public String editSubmitExamForm(Model model,Exam vo) {
		Exam vo1 = examService.viewSubmitExam(vo);;
		Exam vo2 = examService.timeSubmitExam(vo);
		model.addAttribute("examDto", vo1);
		model.addAttribute("examTime", vo2);

		return "exam/editSubmitExam";
	}
	@RequestMapping(value = "/editSubmitExam", method = RequestMethod.POST)
	public String editSubmitExam(Model model,Exam vo)  {
		
		examService.submitExam(vo);
		
		SimpleDateFormat format1 = new SimpleDateFormat("HHmm");
		Calendar time = Calendar.getInstance();
		String format_time1 = format1.format(time.getTime());
		int nowdate = Integer.parseInt(format_time1);
		model.addAttribute("time", nowdate);
		
		
		SimpleDateFormat format2 = new SimpleDateFormat("yyyyMMdd");
		Calendar time2 = Calendar.getInstance();
		String format_time2 = format2.format(time2.getTime());
		int nowdate2 = Integer.parseInt(format_time2);
		model.addAttribute("time2", nowdate2);
		Exam vo1 = examService.viewSubmitExam(vo);
		Exam vo2 = examService.timeSubmitExam(vo);
		
		
		
		System.out.println("뭐가 어케 들어오지?"+vo1);
		System.out.println("뭐가 어케 들어오지?"+vo2);
		model.addAttribute("examTime", vo2);
		model.addAttribute("examDto", vo1);
		return "exam/viewSubmitExam";
	}
}
