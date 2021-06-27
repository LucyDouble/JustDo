package com.kh.jd.account;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class EditController {

	@Autowired
	StudentService sService;
	@Autowired
	TeacherService tService;

	@RequestMapping(value = "/editStudentForm", method = RequestMethod.GET)
	public String editInfo() {
		return "account/studentEdit";
	}

	// 수강생 비밀번호 수정
	@RequestMapping(value = "account/studentEditpw", method = RequestMethod.POST)

	public @ResponseBody String editStudentPw(Student studentVO) {
		String student_pw = studentVO.getPassword();
		String student_id = studentVO.getId();

		sService.editStudentPw(student_pw, student_id);
		return "";
	}

	// 수강생 이름 수정
	@RequestMapping(value = "account/studentEditname", method = RequestMethod.POST)

	public @ResponseBody String editStudentName(Student studentVO) {
		String student_name = studentVO.getName();
		String student_id = studentVO.getId();

		sService.editStudentName(student_name, student_id);
		return "";
	}

	// 수강생 주소 수정
	@RequestMapping(value = "account/studentEditaddress", method = RequestMethod.POST)

	public @ResponseBody String editStudentAddress(Student studentVO) {
		String student_address = studentVO.getAddress();
		String student_id = studentVO.getId();

		sService.editStudentAddress(student_address, student_id);
		return "";
	}

	// 수강생 휴대폰 번호 수정
	@RequestMapping(value = "account/studentEditphone", method = RequestMethod.POST)

	public @ResponseBody String editStudentPhone(Student studentVO) {
		String student_phone = studentVO.getPhone();
		String student_id = studentVO.getId();

		sService.editStudentPhone(student_phone, student_id);
		return "";
	}
	@RequestMapping(value	="account/studentDelete", method = RequestMethod.POST)
	public String delete(Student studentVO) {
		String student_id = studentVO.getId();
		sService.deleteStudent(student_id);
		return "common/main";
	}
	
}
