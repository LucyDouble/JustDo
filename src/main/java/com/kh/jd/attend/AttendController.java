package com.kh.jd.attend;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
		}
		
		return mv;
	}
	@RequestMapping("/qr")
	public ModelAndView qrcode(@RequestParam String content) {
		System.out.println("ss?");
		return new ModelAndView("qrcodeview","content",content);
	}
	
}
