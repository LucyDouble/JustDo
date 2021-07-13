package com.kh.jd.work;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jd.account.Student;
import com.kh.jd.account.Teacher;
import com.kh.jd.lecture.Lecture;

@Controller
public class WorkController {

	@Autowired
	private WorkService workService;
	public static final int LIMIT = 10;
	public static final int LIMIT2 = 5;
	public static final int pageBlock = 5;
	@RequestMapping(value = "/listWork", method = RequestMethod.GET)
	public ModelAndView listWork(ModelAndView mv
			, @RequestParam(name = "page", defaultValue = "1") int page
			, @RequestParam(name = "keyword", defaultValue = "") String keyword
			,HttpServletRequest re
			/*, @RequestParam(name = "teacher_number") int teacher_number*/) {

		//TODO 완료 -세션값으로 가져오길..
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
		
		int listCount = workService.getListCount(map);
		
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
		List<Work> listWork = workService.listWork(currentPage, LIMIT,map);
		System.out.println(listWork);

		mv.addObject("listWork", listWork);
		mv.setViewName("work/listWork");
		return mv;
	}
	@RequestMapping(value = "/addWorkForm", method = RequestMethod.POST)
	public String addWorkForm(Model model,HttpServletRequest re) {
		Teacher te = (Teacher)re.getSession().getAttribute("DTO");
		List<Lecture> list = workService.lecturechk(te.getTeacher_number());
		model.addAttribute("lecturechk", list);
		return "work/addWork";
	}
	@RequestMapping(value = "/addWork", method = RequestMethod.POST)
	public String addWork(ModelAndView mv,Work vo,HttpServletRequest re)  {
		System.out.println(vo.getLecture_no());
		List<Work> aa =workService.registrationNo(vo.getLecture_no());
		System.out.println(aa);
		workService.addWork(vo);
		for (Work work : aa) {
			workService.addWorkResult( work.getRegistration_no());
		}
		//TODO 완료-과제를 출제하고 list로 바로 넘어 가야 함.
		return "redirect:/listWork";
		
	}
	@RequestMapping(value = "classCheck", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	@ResponseBody
	public void classCheck(@RequestParam(name = "lecture_no") int lecture_no
			,HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		List<Work> list = workService.classCheck(lecture_no);
		out.println(list);
		out.flush();
		out.close();
	}
	@RequestMapping(value = "/viewWork")
	public String viewWork(@RequestParam(name = "work_no") int work_no, Model model )  {
		SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMdd");

		Calendar time = Calendar.getInstance();
		String format_time1 = format1.format(time.getTime());
		int nowdate = Integer.parseInt(format_time1);
		model.addAttribute("time", nowdate);
		Work vo = workService.viewWork(work_no);
		model.addAttribute("workDto", vo);
		return "work/viewWork";
	}
	@RequestMapping(value = "/removeWork", method = RequestMethod.POST)
	public String removeWork(@RequestParam(name = "work_no") int work_no )  {

		workService.removeWork(work_no);
		return "redirect:/listWork";
	}
	@RequestMapping(value = "/editWorkFrom")
	public String editWorkForm(@RequestParam(name = "work_no") int work_no
			, Model model
			,HttpServletRequest re)  {
		SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMdd");
		Teacher te =(Teacher) re.getSession().getAttribute("DTO");
		Calendar time = Calendar.getInstance();
		String format_time1 = format1.format(time.getTime());
		int nowdate = Integer.parseInt(format_time1);
		model.addAttribute("time", nowdate);
		Work vo = workService.viewWork(work_no);
		model.addAttribute("workDto", vo);
		List<Lecture> list = workService.lecturechk(te.getTeacher_number());
		model.addAttribute("lecturechk", list);
		return "work/editWork";
	}
	@RequestMapping(value = "/editWork", method = RequestMethod.POST)
	public String editWork(Model model,Work vo)  {
		System.out.println(vo);
		workService.editWork(vo);
		
		SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMdd");
		Calendar time = Calendar.getInstance();
		String format_time1 = format1.format(time.getTime());
		int nowdate = Integer.parseInt(format_time1);
		model.addAttribute("time", nowdate);
		Work vo2 = workService.viewWork(vo.getWork_no());
		model.addAttribute("workDto", vo2);
		return "work/viewWork";
	}
	
	
	@RequestMapping(value = "/listWorkResult", method = RequestMethod.POST)
	public ModelAndView listWorkResult(Work vo,ModelAndView mv
			, @RequestParam(name = "page", defaultValue = "1") int page
			, @RequestParam(name = "keyword", defaultValue = "") String keyword,HttpServletRequest re)  {
		
		
		double class1_mo= workService.getCountClass1(vo.getWork_no());
		double class1_ch= workService.getCountWorkSubmit1(vo.getWork_no())*100;
		double class2_mo= workService.getCountClass2(vo.getWork_no());
		double class2_ch= workService.getCountWorkSubmit2(vo.getWork_no())*100;
		if(class1_mo==0) {
			class1_mo=1;
		}
		if(class2_mo==0) {
			class2_mo=1;
		}
		String classOne=String.format("%.0f", class1_ch/class1_mo);
		String classTwo=String.format("%.0f", class2_ch/class2_mo);
		String total =String.format("%.0f", (class2_ch+class1_ch)/(class2_mo+class1_mo));
		//TODO
		Map<String,Object>map = new HashMap<String,Object>();
		map.put("keyword", keyword);
		map.put("work_no", vo.getWork_no());
		
		
		int listCount = workService.getlistWorkResultCount(map);
		
		int pageCnt = (listCount / LIMIT2) + (listCount % LIMIT2 == 0 ? 0 : 1);
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
		int maxPage = (int) ((double) listCount / LIMIT2 + 0.9);
		mv.addObject("pageCnt", pageCnt);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", maxPage);
		mv.addObject("keyword", keyword);
		mv.addObject("listCount", listCount);
		mv.addObject("lecture_title",vo.getLecture_title() );
		mv.addObject("lecture_class",vo.getLecture_class() );
		mv.addObject("work_subject",vo.getWork_subject() );
		mv.addObject("work_start",vo.getWork_start() );
		mv.addObject("work_end",vo.getWork_end() );
		mv.addObject("work_no", vo.getWork_no() );
		mv.addObject("classOne", classOne);
		mv.addObject("classTwo", classTwo);
		mv.addObject("total", total);
		
		List<Work> listWork = workService.listWorkResult(currentPage, LIMIT2,map);
		System.out.println(listWork);

		mv.addObject("listWork", listWork);
		mv.setViewName("workResult/listWorkResult");
		
		re.getSession().setAttribute("workResult", vo);
		
		return mv;
	}
	@RequestMapping(value = "/listWorkResult", method = RequestMethod.GET)
	public ModelAndView listWorkResult2(ModelAndView mv
			, @RequestParam(name = "page", defaultValue = "1") int page
			, @RequestParam(name = "keyword", defaultValue = "") String keyword,HttpServletRequest re)  {
		Work vo = (Work)re.getSession().getAttribute("workResult");
		
		double class1_mo= workService.getCountClass1(vo.getWork_no());
		double class1_ch= workService.getCountWorkSubmit1(vo.getWork_no())*100;
		double class2_mo= workService.getCountClass2(vo.getWork_no());
		double class2_ch= workService.getCountWorkSubmit2(vo.getWork_no())*100;
		if(class1_mo==0) {
			class1_mo=1;
		}
		if(class2_mo==0) {
			class2_mo=1;
		}
		String classOne=String.format("%.0f", class1_ch/class1_mo);
		String classTwo=String.format("%.0f", class2_ch/class2_mo);
		String total =String.format("%.0f", (class2_ch+class1_ch)/(class2_mo+class1_mo));
		//TODO
		Map<String,Object>map = new HashMap<String,Object>();
		map.put("keyword", keyword);
		map.put("work_no", vo.getWork_no());
		
		
		int listCount = workService.getlistWorkResultCount(map);
		
		int pageCnt = (listCount / LIMIT2) + (listCount % LIMIT2 == 0 ? 0 : 1);
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
		int maxPage = (int) ((double) listCount / LIMIT2 + 0.9);
		mv.addObject("pageCnt", pageCnt);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", maxPage);
		mv.addObject("keyword", keyword);
		mv.addObject("listCount", listCount);
		mv.addObject("lecture_title",vo.getLecture_title() );
		mv.addObject("lecture_class",vo.getLecture_class() );
		mv.addObject("work_subject",vo.getWork_subject() );
		mv.addObject("work_start",vo.getWork_start() );
		mv.addObject("work_end",vo.getWork_end() );
		mv.addObject("work_no", vo.getWork_no() );
		mv.addObject("classOne", classOne);
		mv.addObject("classTwo", classTwo);
		mv.addObject("total", total);
		
		List<Work> listWork = workService.listWorkResult(currentPage, LIMIT2,map);
		System.out.println(listWork);

		mv.addObject("listWork", listWork);
		mv.setViewName("workResult/listWorkResult");
		
		re.getSession().setAttribute("workResult", vo);
		
		return mv;
	}
	
	@RequestMapping(value = "/viewWorkResult")
	public String viewWorkResult(Work vo, Model model )  {
		SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMdd");
		System.out.println(vo);
		System.out.println(vo.getRegistration_no());
		System.out.println(vo.getWork_no());
		model.addAttribute("workDto", vo);
		/*
		 * Calendar time = Calendar.getInstance(); String format_time1 =
		 * format1.format(time.getTime()); int nowdate = Integer.parseInt(format_time1);
		 * model.addAttribute("time", nowdate); Work vo = workService.viewWork(work_no);
		 * model.addAttribute("workDto", vo);
		 */
		return "workResult/viewWorkResult";
	}
	@RequestMapping(value = "/listSubmitWork", method = RequestMethod.GET)
	public ModelAndView listSubmitWork(ModelAndView mv
			, @RequestParam(name = "page", defaultValue = "1") int page
			, @RequestParam(name = "keyword", defaultValue = "") String keyword
			,HttpServletRequest re
			/*, @RequestParam(name = "student_number") int student_number*/) {

		//TODO 완료 - 세션값 처리
		Student st = (Student) re.getSession().getAttribute("DTO");
		int student_number=st.getStudent_number();
		Map<String,Object>map = new HashMap<String,Object>();
		map.put("keyword", keyword);
		map.put("student_number", student_number);
		
		
		SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMdd");
		Calendar time = Calendar.getInstance();
		String format_time1 = format1.format(time.getTime());
		int nowdate = Integer.parseInt(format_time1);
		mv.addObject("time", nowdate);
		
		int listCount = workService.getListSubmitCount(map);
		
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

		
		List<Work> listWork = workService.listSubmitWork(currentPage, LIMIT,map);
		System.out.println(listWork);

		mv.addObject("listWork", listWork);
		mv.setViewName("work/listSubmitWork");
		return mv;
	}
	@RequestMapping(value = "/viewSubmitWork")
	public String viewSubmitWork(Work vo, Model model )  {
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat format2 = new SimpleDateFormat("yyyyMMdd");
		
		Calendar time = Calendar.getInstance();
		String format_time1 = format2.format(time.getTime());
		int nowdate = Integer.parseInt(format_time1);
		model.addAttribute("time", nowdate);
		Work vo1 = workService.viewSubmitWork(vo);
		String endtime = format2.format(vo1.getWork_end());
		String srarttime = format2.format(vo1.getWork_start());
		int endtime1 = Integer.parseInt(endtime);
		int srarttime1 = Integer.parseInt(srarttime);
		model.addAttribute("endtime", endtime1);
		model.addAttribute("starttime", srarttime1);
		model.addAttribute("workDto", vo1);
		return "work/viewSubmitWork";
	}
	@RequestMapping(value = "/submitWorkForm", method = RequestMethod.POST)
	public String submitWorkForm(Model model,Work vo) {
		Work vo1 = workService.viewSubmitWork(vo);
		
		model.addAttribute("workDto", vo1);

		return "work/submitWork";
	}
	@RequestMapping(value = "/submitWork", method = RequestMethod.POST)
	public String submitWork(Work vo )  {

		workService.submitWork(vo);
		
		//TODO 리스트로 가려면 학생 넘버를 받아 와서 세션으로 넘겨 줘야 함. 애초에 리스트에서 세션으로 정해 줄 수도 있으니 참조.
		return "redirect:/listSubmitWork";
	}
	@RequestMapping(value = "/editSubmitWorkForm", method = RequestMethod.POST)
	public String editSubmitWorkForm(Model model,Work vo) {
		Work vo1 = workService.viewSubmitWork(vo);
		
		model.addAttribute("workDto", vo1);

		return "work/editSubmitWork";
	}
	@RequestMapping(value = "/editSubmitWork", method = RequestMethod.POST)
	public String editSubmitWork(Model model,Work vo)  {
		System.out.println(vo);
		workService.submitWork(vo);
		SimpleDateFormat format2 = new SimpleDateFormat("yyyyMMdd");
		Calendar time = Calendar.getInstance();
		String format_time1 = format2.format(time.getTime());
		int nowdate = Integer.parseInt(format_time1);
		model.addAttribute("time", nowdate);
		Work vo1 = workService.viewSubmitWork(vo);
		String endtime = format2.format(vo1.getWork_end());
		String srarttime = format2.format(vo1.getWork_start());
		int endtime1 = Integer.parseInt(endtime);
		int srarttime1 = Integer.parseInt(srarttime);
		model.addAttribute("endtime", endtime1);
		model.addAttribute("starttime", srarttime1);
		model.addAttribute("workDto", vo1);
		return "work/viewSubmitWork";
	}
	@RequestMapping(value = "/removeSubmitWork", method = RequestMethod.POST)
	public String removeSubmitWork(Model model,Work vo) {
		workService.removeSubmitWork(vo);
		//TODO 리스트로 가려면 학생 넘버를 받아 와서 세션으로 넘겨 줘야 함. 애초에 리스트에서 세션으로 정해 줄 수도 있으니 참조.
		return "redirect:/listSubmitWork";
	}
}
