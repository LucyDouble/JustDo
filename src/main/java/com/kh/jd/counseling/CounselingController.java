package com.kh.jd.counseling;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.jd.notice.Notice;


@Controller
public class CounselingController {
@Autowired
private CounselingService counselingService;
public static final int LIMIT = 10;
public static final int pageBlock = 5;
	
	//목록조회
	@RequestMapping(value = "/listCS", method = RequestMethod.GET)
	public ModelAndView listCS(ModelAndView mv, HttpServletRequest request, @RequestParam(name = "page", defaultValue = "1") int page) {
				
		Map<String,Object> map = new HashMap<String, Object>(); 
		
		int listCount = counselingService.getListCount(map);
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
		
		List<Counseling> listCS = counselingService.listCS(startPage, LIMIT, map);
		System.out.println("listCS =" + listCS);
		mv.addObject("listCS", listCS);
		mv.setViewName("counseling/listCS");
		return mv;
	}
	
	//상세조회
	@RequestMapping(value = "/viewCS", method = RequestMethod.GET)
	public ModelAndView viewCS(ModelAndView mv,@RequestParam(name="c_no") int counseling_no) {
		/*
		 * public ModelAndView viewCS(ModelAndView mv,@RequestParam(name="c_no") int
		 * counseling_no) {
		 */
		Counseling vo = new Counseling();
		vo = counselingService.viewCS(counseling_no);
		System.out.println("컨트롤 조회 ="+vo);
		mv.addObject("counseling",vo);
		mv.setViewName("counseling/listCS");
		return mv;
	}
	
	//등록
	@RequestMapping(value = "/addCS", method = RequestMethod.POST)
	public ModelAndView addCS(Counseling vo,ModelAndView mv, HttpServletRequest request) throws ParseException {

		//데이터형식에서 T자르기
		String[] aaa = request.getParameter("counseling_da").split("T");
		String ccc = aaa[0]+" "+aaa[1];
		//VO에 T자른거 세팅
		vo.setCounseling_date(ccc);
		mv.setViewName("redirect:/listCS");
		counselingService.addCS(vo);
		return mv;
	}
	// 수정	
	@RequestMapping(value = "/editCS", method = RequestMethod.GET)
	public String editCS(Locale locale, ModelAndView mv) {
				
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		mv.addObject("serverTime", formattedDate );
		return "counseling/editCS";
	}
	// 삭제
	@RequestMapping(value="/removeCS",  method=RequestMethod.GET)
	public String removeCS(@RequestParam(name="c_no", required=false) List<Integer> counseling_no) {
		for(Integer num : counseling_no) counselingService.removeCS(num);
	return "redirect:/listCS";
	}
}