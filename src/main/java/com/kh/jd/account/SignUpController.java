package com.kh.jd.account;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SignUpController {

	@Autowired
	StudentService sService;
	@Autowired
	TeacherService tService;
	@Autowired
	private JavaMailSender mailSender;

	private static final Logger logger = LoggerFactory.getLogger(SignUpController.class);
	@RequestMapping(value="/agreeSignUp")
	public String agreeSignUp() {
		return "account/agreeSignUp";
	}
	@RequestMapping(value = "/signUp", method=RequestMethod.GET)
	public String signUpPage() {
		logger.info("get register");
		return "account/signUp";
	}

	@RequestMapping(value = "idCheck", method = RequestMethod.GET)
	@ResponseBody
	public String idCheck(HttpServletRequest request, @RequestParam(name = "signUpSelect") String check) {
		System.out.println(check);
		if (check == "student" || check.equals("student")) {
			String student_id = request.getParameter("id");
			System.out.println(student_id);
			int result = sService.idCheck(student_id);
			return Integer.toString(result);
		} else {
			String teacher_id = request.getParameter("id");
			System.out.println(teacher_id);
			int result = tService.idCheck(teacher_id);
			return Integer.toString(result);
		}
	}

	@RequestMapping(value = "/emailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String emailCheck(HttpServletRequest request, @RequestParam(name = "signUpSelect") String check) {
		System.out.println(check);
		if (check == "student" || check.equals("student")) {
			String student_email = request.getParameter("email");
			System.out.println(student_email);
			int result = sService.emailCheck(student_email);
			return Integer.toString(result);
		} else {
			String teacher_email = request.getParameter("email");
			System.out.println(teacher_email);
			int result = tService.emailCheck(teacher_email);
			return Integer.toString(result);
		}
	}

@RequestMapping(value="/mailCheck", method=RequestMethod.GET)
@ResponseBody
public String mailCheckGet(String email) throws Exception{
	logger.info("이메일 데이터 전송 확인");
	logger.info("인증번호 : " + email);
	
/* 인증번호(난수) 생성*/
	Random random = new Random();
	int checkNum = random.nextInt(888888) + 111111;
	logger.info("인증번호 " + checkNum);
	
/* 이메일 보내기 */
	String setFrom = "rkdgns92@gmail.com";
	String toMail = email;
	String title = "[JD 교육원] 회원가입 인증 이메일입니다.";
	String content = "인증번호는 " + checkNum + "입니다.";
	try {
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
		helper.setFrom(setFrom);
		helper.setTo(toMail);
		helper.setSubject(title);
		helper.setText(content, true);
		mailSender.send(message);
	}catch(Exception e) {
		e.printStackTrace();
	}
	String num = Integer.toString(checkNum);
	return num;

}
@RequestMapping(value="/phoneCheck", method=RequestMethod.GET)
@ResponseBody
public String phoneCheck(HttpServletRequest request, @RequestParam(name = "signUpSelect") String check) {
	System.out.println(check);
	if (check == "student" || check.equals("student")) {
		String student_phone = request.getParameter("phone");
		System.out.println(student_phone);
		int result = sService.phoneCheck(student_phone);
		return Integer.toString(result);
	} else {
		String teacher_phone = request.getParameter("phone");
		System.out.println(teacher_phone);
		int result = tService.phoneCheck(teacher_phone);
		return Integer.toString(result);
	}
}
@RequestMapping(value="/signUp", method = RequestMethod.POST)
public String addMember(Student sDto, Teacher tDto, @RequestParam(name = "signUpSelect") String check) {
	logger.info("post register");
	System.out.println("TEST");
	if (check == "student" || check.equals("student")) {
		sService.signUp(sDto);
	} else {
		tService.signUp(tDto);
	}
	return "common/main";
			
}
}






