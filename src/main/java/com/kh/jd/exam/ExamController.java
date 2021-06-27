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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jd.work.Work;


@Controller
public class ExamController {
	
	@Autowired
	private ExamService examService;
	public static final int LIMIT = 10;
	public static final int LIMIT2 = 5;
	public static final int pageBlock = 5;
	@RequestMapping(value = "/listExam", method = RequestMethod.GET)
	public ModelAndView listExam(ModelAndView mv
			, @RequestParam(name = "page", defaultValue = "1") int page
			, @RequestParam(name = "keyword", defaultValue = "") String keyword
			/*, @RequestParam(name = "teacher_number") int teacher_number*/) {

		//TODO 세션값으로 가져오길..
		int teacher_number=100002;
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
}
