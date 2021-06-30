package com.kh.jd.account;




import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ManagerController {

	@Autowired
	StudentService sService;
	@Autowired
	TeacherService tService;
	@Autowired
	ManagerService mService;




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

	@RequestMapping("login")
	public String login() {
		return "account/login";
	}

	@RequestMapping(value = "loginCheck", method = RequestMethod.POST)
	public String loginCheck(Student sDto, Teacher tDto, HttpSession session, HttpServletRequest request,
			@RequestParam(name = "loginSelect") String check, Model model) {
		System.out.println(check);
		boolean result = false;
		if (check == "student" || check.equals("student")) {
			result = sService.loginCheck(sDto, session);
		} else {
			result = tService.loginCheck(tDto, session);
		}
		if (result == true) {
			System.out.println(result);
			model.addAttribute("msg", "성공");
			session = request.getSession();
			if (check == "student" || check.equals("student")) {
				Student list = new Student();
				list = sService.infoStudent(sDto);
				System.out.println(list);
				request.getSession().setAttribute("DTO", list);
			} else {
				Teacher list = new Teacher();
				list = tService.infoTeacher(tDto);
				System.out.println(list);
				request.getSession().setAttribute("DTO", list);
			}
		} else {
			System.out.println(result);
			model.addAttribute("msg", "실패");
			return "account/login";
		}
		return "common/main";
	}

	@RequestMapping("logout")
	public ModelAndView logout(HttpSession session) {

		sService.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("common/main");
		mav.addObject("msg", "logout");
		return mav;
	}


@RequestMapping("managerLoginJDEDU")
public String managerLogin() {
	return "account/managerLogin";
}

@RequestMapping(value = "managerIdCheck", method = RequestMethod.GET)
@ResponseBody
public String managerIdCheck(HttpServletRequest request) {

		String manager_id = request.getParameter("id");
		System.out.println(manager_id);
		int result = mService.idCheck(manager_id);
		return Integer.toString(result);
	}

@RequestMapping(value = "managerLoginCheck", method = RequestMethod.POST)	
public String loginCheck(Manager aDto, HttpSession session, HttpServletRequest request, Model model) {
	boolean result = false;
	result = mService.loginCheck(aDto, session);
	System.out.println(result);
	if(result == true) {
		System.out.println(result);
		model.addAttribute("msg", "성공");
		session = request.getSession();
		Manager list = new Manager();
		list = mService.infoManager(aDto);
		System.out.println(list);
		request.getSession().setAttribute("DTO", list);
	}else {
		System.out.println(result);
		model.addAttribute("msg", "실패");
		return "account/managerLogin";
	}
	return "common/main";
}

}
	






