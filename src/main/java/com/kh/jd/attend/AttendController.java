package com.kh.jd.attend;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jd.account.Student;

@Controller
public class AttendController {
	
	
	@Autowired
	private AttendService attendService;
	
	
	@RequestMapping(value = "/listAttend", method = RequestMethod.GET)
	public ModelAndView listAttend(ModelAndView mv,HttpServletRequest re,Attend vo) {
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
		
		mv.setViewName("attend/listAttend");
		vo.setStudent_number(st.getStudent_number());
		if(vo.getLecture_no()!=0) {
			List<Attend> attendList= attendService.listAttend(vo);
			mv.addObject("attendList", attendList);
			System.out.println(attendList);
			int lecture_no=attendList.get(0).getLecture_no();
			String lecture_title=attendList.get(0).getLecture_title();
			mv.addObject("lecture_title",lecture_title );
			mv.addObject("lecture_no",lecture_no );
			mv.addObject("stu_no",stu_no );
			
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
}
