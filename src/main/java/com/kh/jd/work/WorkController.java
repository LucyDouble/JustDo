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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jd.lecture.Lecture;

@Controller
public class WorkController {

	@Autowired
	private WorkService workService;
	public static final int LIMIT = 10;
	public static final int pageBlock = 5;
	@RequestMapping(value = "/listWork", method = RequestMethod.GET)
	public ModelAndView listWork(ModelAndView mv
			, @RequestParam(name = "page", defaultValue = "1") int page
			, @RequestParam(name = "keyword", defaultValue = "") String keyword
			/*, @RequestParam(name = "teacher_number") int teacher_number*/) {

		//TODO
		int teacher_number=100001;
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
	public String addWorkForm(Model model,@RequestParam(name = "teacher_number") int teacher_number) {
		List<Lecture> list = workService.lecturechk(teacher_number);
		model.addAttribute("lecturechk", list);
		return "work/addWork";
	}
	@RequestMapping(value = "/addWork", method = RequestMethod.POST)
	public String addWork(ModelAndView mv,Work vo)  {
		workService.addWork(vo);
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

		System.out.println("바보야"+work_no);
		workService.removeWork(work_no);
		return "redirect:/listWork";
	}
	@RequestMapping(value = "/editWorkFrom")
	public String editWorkForm(@RequestParam(name = "work_no") int work_no
			, Model model
			,@RequestParam(name = "teacher_number") int teacher_number)  {
		SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMdd");

		Calendar time = Calendar.getInstance();
		String format_time1 = format1.format(time.getTime());
		int nowdate = Integer.parseInt(format_time1);
		model.addAttribute("time", nowdate);
		Work vo = workService.viewWork(work_no);
		model.addAttribute("workDto", vo);
		List<Lecture> list = workService.lecturechk(teacher_number);
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
			, @RequestParam(name = "keyword", defaultValue = "") String keyword)  {
		System.out.println("결과목록으로 이동할껀데 잘 들어왔나"+vo);
		
		//TODO
		Map<String,Object>map = new HashMap<String,Object>();
		map.put("keyword", keyword);
		map.put("work_no", vo.getWork_no());
		
		
		int listCount = workService.getlistWorkResultCount(map);
		
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
		mv.addObject("lecture_class",vo.getLecture_class() );
		mv.addObject("work_subject",vo.getWork_subject() );
		mv.addObject("work_start",vo.getWork_start() );
		mv.addObject("work_end",vo.getWork_end() );
		mv.addObject("work_no", vo.getWork_no() );
		
		List<Work> listWork = workService.listWorkResult(currentPage, LIMIT,map);
		System.out.println(listWork);

		mv.addObject("listWork", listWork);
		mv.setViewName("workResult/listWorkResult");
		
		
		
		return mv;
	}
}
