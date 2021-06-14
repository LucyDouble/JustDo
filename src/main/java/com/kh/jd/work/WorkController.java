package com.kh.jd.work;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WorkController {

	@Autowired
	private WorkService workService;
	public static final int LIMIT = 2;
	public static final int pageBlock = 5;
	@RequestMapping(value = "/listWork", method = RequestMethod.GET)
	public ModelAndView listExam(ModelAndView mv, @RequestParam(name = "page", defaultValue = "1") int page) {
		SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMdd");

		Calendar time = Calendar.getInstance();
		String format_time1 = format1.format(time.getTime());
		int nowdate = Integer.parseInt(format_time1);
		mv.addObject("time", nowdate);
		
		int listCount = workService.getListCount();
		
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
		mv.addObject("listCount", listCount);
		mv.setViewName("board/blist");
		List<Work> listWork = workService.listWork(currentPage, LIMIT);
		System.out.println(listWork);

		mv.addObject("listWork", listWork);
		mv.setViewName("work/listWork");
		return mv;
	}
}
