package com.kh.jd.attend;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.jd.account.Student;

@Controller
public class AttendController {
	
	
	@Autowired
	private AttendService attendService;
	public static final int LIMIT = 10;
	public static final int LIMIT2 = 5;
	public static final int pageBlock = 5;
	
	@RequestMapping(value = "/listAttend", method = RequestMethod.GET)
	public ModelAndView listAttend(ModelAndView mv,HttpServletRequest re,Attend vo
			, @RequestParam(name = "page", defaultValue = "1") int page) throws ParseException {
		Student st  = (Student)re.getSession().getAttribute("DTO");
		int student_number =st.getStudent_number();
		List<Attend> vo2 = attendService.checkLecture(student_number);
		mv.addObject("list", vo2);
		int stu_no=st.getStudent_number();
		SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMdd");
		Calendar time = Calendar.getInstance();
		String format_time1 = format1.format(time.getTime());
		int nowdate = Integer.parseInt(format_time1);
		mv.addObject("time", nowdate);
		
		if(re.getSession().getAttribute("lecture_no") !=null) {
			vo.setLecture_no((int)re.getSession().getAttribute("lecture_no"));
			re.getSession().removeAttribute("lecture_no");
			System.out.println("성공한건뎅,,,?");
		}
		
		mv.setViewName("attend/listAttend");
		vo.setStudent_number(st.getStudent_number());
		if(vo.getLecture_no()!=0) {
			
			
			int listCount = attendService.getlistAttendCount(vo);
			
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
			
			
			
			
			
			List<Attend> attendList= attendService.listAttend(vo);
			mv.addObject("attendList", attendList);
			System.out.println(attendList);
			int lecture_no=attendList.get(0).getLecture_no();
			String lecture_title=attendList.get(0).getLecture_title();
			int lectureclass_no=attendList.get(0).getLectureclass_no();
			vo.setLectureclass_no(lectureclass_no);
			java.sql.Date attend_date = attendList.get(0).getAttend_date();
			re.getSession().setAttribute("attend_date", attend_date);
			
			String lecture_start = attendList.get(0).getLecture_start();
			String lecture_end = attendList.get(0).getLecture_end();
			String lectureclass_start = attendList.get(0).getLectureclass_start();
			String lectureclass_end = attendList.get(0).getLectureclass_end();
			
			
			SimpleDateFormat format2 = new SimpleDateFormat("HH:mm");
			String format_time2=format2.format(time.getTime());
			Date nowTime = format2.parse(format_time2);
			
			Date lectureclass_end2 = format2.parse(lectureclass_end);
			Calendar cal = Calendar.getInstance();
			cal.setTime(lectureclass_end2 );
			cal.add(Calendar.MINUTE, 5);
			String lectureclass_aEnd=format2.format(cal.getTime());
			Date aEnd = format2.parse(lectureclass_aEnd);
			
			int compareEndNow = aEnd.compareTo(nowTime);
			
			//입실 처리 되어있는지 확인.
			int startCh = attendService.startCheck(vo);
			System.out.println("입실처리 됐으면 1인데?"+startCh);
			//퇴실 처리 되어있는지 확인.
			int endCh = attendService.endCheck(vo);
			if(compareEndNow<0) {
				endCh=3;
			}
			
			
			
			mv.addObject("endCh", endCh);
			mv.addObject("startCh", startCh);
			mv.addObject("lecture_start",lecture_start );
			mv.addObject("lecture_end",lecture_end );
			mv.addObject("lecture_title",lecture_title );
			mv.addObject("lectureclass_no",lectureclass_no);
			mv.addObject("lecture_no",lecture_no );
			mv.addObject("stu_no",stu_no );
			mv.addObject("lectureclass_start",lectureclass_start );
			mv.addObject("lectureclass_end",lectureclass_end );
			
		}
		
		return mv;
	}

	@RequestMapping("/qr")
	public ModelAndView qrcode(
			 @RequestParam int lecture_no,@RequestParam int stu_no) {
		
		SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMdd");
		Calendar time = Calendar.getInstance();
		String format_time1 = format1.format(time.getTime());
		
		SimpleDateFormat format2 = new SimpleDateFormat("HH:mm:ss");
		String format_time2=format2.format(time.getTime());

		String content = "stu_no="+stu_no+"lecture_no="+lecture_no+"date="+format_time1+"&"+format_time2;
		System.out.println("왜 생성할 때 자꾸 같은 값이 나오지?"+format_time2);
		
		return new ModelAndView("qrcodeview","content",content);
	}	
	@RequestMapping("/qr2")
	public void qrcode2(HttpServletResponse response,
			@RequestParam int lecture_no,@RequestParam int stu_no) throws IOException {
		
		SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMdd");
		Calendar time = Calendar.getInstance();
		String format_time1 = format1.format(time.getTime());
		
		SimpleDateFormat format2 = new SimpleDateFormat("HH:mm:ss");
		String format_time2=format2.format(time.getTime());

		String content = "stu_no="+stu_no+"lecture_no="+lecture_no+"date="+format_time1+"&"+format_time2;
		response.setContentType("text/html; charset=utf-8"); // PrintWriter 객체를 생성하여 통신에 대한 응답 결과를 전달한다. 
		PrintWriter out = response.getWriter(); 
		out.append(content);
	}	
	@RequestMapping("/editAttend")
	public String editAttend(HttpServletRequest re,Attend vo,RedirectAttributes rttr) throws ParseException  {
		String content = re.getParameter("content");
		int lectureclass_no = Integer.parseInt(re.getParameter("lectureclass_no"));
		
		int lecture_no = Integer.parseInt(re.getParameter("lecture_no2"));
		re.getSession().setAttribute("lecture_no", lecture_no);
		
		Student st  = (Student)re.getSession().getAttribute("DTO");
		int student_number =st.getStudent_number();
		
		String[] str = content.split("&");
		
		vo.setStudent_number(student_number);
		vo.setLectureclass_no(lectureclass_no);
		vo.setAttend_start(str[1]);
		vo.setAttend_date((java.sql.Date)re.getSession().getAttribute("attend_date"));
		System.out.println(content+"이거는?"+lectureclass_no+"학생번호"+student_number+"여기가 중요"+str[1]);
		re.getSession().removeAttribute("attend_date");
		System.out.println(vo);
		
		//이걸로 if문 오지게 돌려서 유효성 검사.
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");

		//강의사작 5분 전 시간 구함 => 변수명 bStart
		Date lectureclass_start = sdf.parse(vo.getLectureclass_start());
		Calendar cal = Calendar.getInstance();
		cal.setTime(lectureclass_start );
		cal.add(Calendar.MINUTE, -5);
		String lectureclass_bStrat=sdf.format(cal.getTime());
		Date bStart = sdf.parse(lectureclass_bStrat);

		//강의시작 5분 후 시간 구함 => 변수명 aStart
		Calendar cal2 = Calendar.getInstance();
		cal2.setTime(lectureclass_start );
		cal2.add(Calendar.MINUTE, 5);
		
		Date lectureclass_end = sdf.parse(vo.getLectureclass_end());
		Date nowTime = sdf.parse(str[1]);
		
		int compareStartNow = bStart.compareTo(nowTime);
		int compareEndNow = lectureclass_end.compareTo(nowTime);
		int startCh = attendService.startCheck(vo);
		rttr.addFlashAttribute("startCh", startCh);
		if(compareStartNow >0 ) {
			rttr.addFlashAttribute("warning", "입실시간("+vo.getLectureclass_start()+") 5분전부터 출석이 가능합니다.");
			rttr.addFlashAttribute("warning1", "실패");
		}else if (compareEndNow >0) {
			System.out.println(lectureclass_start+"ddd"+lectureclass_end+"dd"+nowTime);
			attendService.editAttend(vo);
			System.out.println("성공한건뎅,,,?");
			rttr.addFlashAttribute("msg", "퇴실처리 안할 시 조퇴로 처리됩니다.");
			rttr.addFlashAttribute("msg1", "입실");
		}else {
			rttr.addFlashAttribute("warning", "금일 수업이 종료되었습니다.");
			rttr.addFlashAttribute("warning1", "실패");
		}
		
	
		return "redirect:/listAttend";
	}	
	@RequestMapping("/editAttendExit")
	public String editAttendExit(HttpServletRequest re,Attend vo,RedirectAttributes rttr) throws ParseException {
		String content = re.getParameter("content");
		int lectureclass_no = Integer.parseInt(re.getParameter("lectureclass_no"));
		
		int lecture_no = Integer.parseInt(re.getParameter("lecture_no2"));
		re.getSession().setAttribute("lecture_no", lecture_no);
		
		Student st  = (Student)re.getSession().getAttribute("DTO");
		int student_number =st.getStudent_number();
		
		String[] str = content.split("&");
		
		vo.setStudent_number(student_number);
		vo.setLectureclass_no(lectureclass_no);
		vo.setAttend_end(str[1]);
		vo.setAttend_date((java.sql.Date)re.getSession().getAttribute("attend_date"));
		System.out.println(content+"이거는?"+lectureclass_no+"학생번호"+student_number+"여기가 중요"+str[1]);
		re.getSession().removeAttribute("attend_date");
		System.out.println(vo);
		
		
		//이걸로 if문 오지게 돌려서 유효성 검사.
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
		
		
		Date lectureclass_start = sdf.parse(vo.getLectureclass_start());
				
		//강의끝 5분 후 시간 구함 => 변수명 aEnd
		Date lectureclass_end = sdf.parse(vo.getLectureclass_end());
		Calendar cal = Calendar.getInstance();
		cal.setTime(lectureclass_end );
		cal.add(Calendar.MINUTE, 5);
		String lectureclass_aEnd=sdf.format(cal.getTime());
		Date aEnd = sdf.parse(lectureclass_aEnd);
		System.out.println("5분 빼져서 나왔을 까요 ?=============="+aEnd);
		
		
		Date nowTime = sdf.parse(str[1]);
				
		int compareEndNow = lectureclass_end.compareTo(nowTime);
		int compareAfterEndNow = aEnd.compareTo(nowTime);
		
		int startCh = attendService.startCheck(vo);
		if(startCh==0){
			rttr.addFlashAttribute("warning", "입실처리 한 후 퇴실 하시길 바랍니다.");
			rttr.addFlashAttribute("warning1", "실패");
		}else {
			if(compareEndNow > 0 ) {
				rttr.addFlashAttribute("warning", "퇴실 시간이 아닙니다.조퇴를 원하실 경우 조퇴하기 버튼을 눌러주세요.");
				rttr.addFlashAttribute("warning1", "실패");
			}else if(compareEndNow <= 0 && compareAfterEndNow>=0) {
				attendService.editAttendExit(vo);
				System.out.println("성공한건뎅,,,?");
				rttr.addFlashAttribute("msg", "퇴실이 되었습니다.");
				rttr.addFlashAttribute("msg1", "퇴실");
				
			}else if(compareAfterEndNow<0) {
				rttr.addFlashAttribute("warning", "퇴실 시간이 지나 조퇴처리 되었습니다.");
				rttr.addFlashAttribute("warning1", "실패");
			}
			
		}
		
		
		return "redirect:/listAttend";
	}	
	@RequestMapping("/editAttendEarly")
	public String editAttendEarly(HttpServletRequest re,Attend vo,RedirectAttributes rttr) throws ParseException {
		String content = re.getParameter("content");
		int lectureclass_no = Integer.parseInt(re.getParameter("lectureclass_no"));
		
		int lecture_no = Integer.parseInt(re.getParameter("lecture_no2"));
		re.getSession().setAttribute("lecture_no", lecture_no);
		
		Student st  = (Student)re.getSession().getAttribute("DTO");
		int student_number =st.getStudent_number();
		
		String[] str = content.split("&");
		
		vo.setStudent_number(student_number);
		vo.setLectureclass_no(lectureclass_no);
		vo.setAttend_end(str[1]);
		vo.setAttend_date((java.sql.Date)re.getSession().getAttribute("attend_date"));
		System.out.println(content+"이거는?"+lectureclass_no+"학생번호"+student_number+"여기가 중요"+str[1]);
		re.getSession().removeAttribute("attend_date");
		System.out.println(vo);
		
		
		//이걸로 if문 오지게 돌려서 유효성 검사.
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
		
		
		Date lectureclass_start = sdf.parse(vo.getLectureclass_start());
		
		//강의끝 5분 후 시간 구함 => 변수명 aEnd
		Date lectureclass_end = sdf.parse(vo.getLectureclass_end());
		Calendar cal = Calendar.getInstance();
		cal.setTime(lectureclass_end );
		cal.add(Calendar.MINUTE, 5);
		String lectureclass_aEnd=sdf.format(cal.getTime());
		Date aEnd = sdf.parse(lectureclass_aEnd);
		System.out.println("5분 빼져서 나왔을 까요 ?=============="+aEnd);
		
		
		Date nowTime = sdf.parse(str[1]);
		
		int compareEndNow = lectureclass_end.compareTo(nowTime);
		int compareAfterEndNow = aEnd.compareTo(nowTime);
		
		
			if(compareEndNow > 0 ) {
				attendService.editAttendExit(vo);
				System.out.println("성공한건뎅,,,?");
				rttr.addFlashAttribute("msg", "조퇴처리 되었습니다.");
				rttr.addFlashAttribute("msg1", "조퇴");
			}else if(compareEndNow <= 0 && compareAfterEndNow>=0) {
				attendService.editAttendExit(vo);
				System.out.println("성공한건뎅,,,?");
				rttr.addFlashAttribute("msg", "퇴실이 되었습니다.");
				rttr.addFlashAttribute("msg1", "퇴실");
				
			}else if(compareAfterEndNow<0) {
				rttr.addFlashAttribute("warning", "퇴실 시간이 지나 조퇴처리 되었습니다.");
				rttr.addFlashAttribute("warning1", "실패");
			}
			
		
		
		
		return "redirect:/listAttend";
	}	
}
