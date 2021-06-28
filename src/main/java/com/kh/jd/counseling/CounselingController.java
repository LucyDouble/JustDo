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
public static final int LIMIT2 = 10;
public static final int pageBlock = 5;
	
	//목록조회
	@RequestMapping(value = "/listCS", method = RequestMethod.GET)
	public ModelAndView listCS(ModelAndView mv
			, @RequestParam(name = "page", defaultValue = "1") int page
			, @RequestParam(name = "keyword", defaultValue = "") String keyword ) {
				
		Map<String,Object> map = new HashMap<String, Object>(); 
		map.put("keyword", keyword);
		
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
		mv.addObject("keyword", keyword);
		mv.addObject("listCount", listCount);
		
		System.out.println(map.get("keyword"));
		List<Counseling> listCS = counselingService.listCS(currentPage, LIMIT, map);
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
	
	// 수정폼
	@RequestMapping(value = "/editCSForm", method = RequestMethod.GET)
	public ModelAndView eidtNotice(ModelAndView mv, @RequestParam(name="c_no") int counseling_no) {
		Counseling vo = new Counseling ();
		vo = counselingService.viewCS(counseling_no);
		System.out.println("vo : " + vo);
		mv.addObject("counseling", vo);
		mv.setViewName("counseling/editCS");
		return mv;
	}
		
	// 수정	
	@RequestMapping(value = "/editCS", method = RequestMethod.POST)
	public ModelAndView editNotice(HttpServletRequest request) throws ParseException {
		ModelAndView mv = new ModelAndView(); // mv 객체 생성
		Map<String, Object> map = new HashMap<String, Object>();
		String c_no = "";
		String c_name = "";
		String c_phone = "";
		String c_email = "";
		String c_date = "";
		c_no = request.getParameter("c_no");
		c_name = request.getParameter("c_name");
		c_phone = request.getParameter("c_phone");
		c_email = request.getParameter("c_email");
		c_date = request.getParameter("c_date");
		System.out.println("날짜 이렇게 들어옴 = "+c_date);
		String[] aaa = c_date.split("T");
		String ccc = aaa[0]+" "+aaa[1];
//		SimpleDateFormat fm = new SimpleDateFormat("yyyy-mm-dd hh:mm");
//		Date to = fm.parse(ccc);
//		System.out.println("포맷은 = "+ fm.parse(ccc));
		
		
		map.put("counseling_no", c_no);
		map.put("counseling_name", c_name);
		map.put("counseling_phone", c_phone);
		map.put("counseling_email", c_email);
		map.put("counseling_date", ccc);
		System.out.println("컨트롤러 map : " + map);
		counselingService.editCS(map);
		mv.setViewName("redirect:/listCS");
		return mv;
	}
	// 삭제
	@RequestMapping(value="/removeCS",  method=RequestMethod.GET)
	public String removeCS(@RequestParam(name="c_no", required=false) List<Integer> counseling_no) {
		for(Integer num : counseling_no) counselingService.removeCS(num);
	return "redirect:/listCS";
	}
}