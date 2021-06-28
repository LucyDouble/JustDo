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
	public String editStudent() {
		return "account/studentEdit";
	}

	@RequestMapping(value = "/editTeacherForm", method = RequestMethod.GET)
	public String editTeacher() {
		return "account/teacherEdit";
	}

	// 수강생 비밀번호 수정
	@RequestMapping(value = "account/studentEditpw", method = RequestMethod.POST)

	public @ResponseBody String editStudentPw(Student studentVO) {
		String student_pw = studentVO.getPassword();
		String student_id = studentVO.getId();

		sService.editStudentPw(student_pw, student_id);
		return "";
	}

	// 교직원 비밀번호 수정
	@RequestMapping(value = "account/teacherEditpw", method = RequestMethod.POST)

	public @ResponseBody String editTeacherPw(Teacher teacherVO) {
		String teacher_pw = teacherVO.getPassword();
		String teacher_id = teacherVO.getId();

		tService.editTeacherPw(teacher_pw, teacher_id);
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
	
	// 교직원 이름 수정
	@RequestMapping(value = "account/teacherEditname", method = RequestMethod.POST)
	
	public @ResponseBody String editTeacherName(Teacher teacherVO) {
		String teacher_name = teacherVO.getName();
		String teacher_id = teacherVO.getId();
		
		tService.editTeacherName(teacher_name, teacher_id);
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
	// 교직원 주소 수정
	@RequestMapping(value = "account/teacherEditaddress", method = RequestMethod.POST)

	public @ResponseBody String editTeacherAddress(Teacher TeacherVO) {
		String teacher_address = TeacherVO.getAddress();
		String teacher_id = TeacherVO.getId();

		tService.editTeacherAddress(teacher_address, teacher_id);
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
	// 교직원 휴대폰 번호 수정
	@RequestMapping(value = "account/teacherEditphone", method = RequestMethod.POST)
	
	public @ResponseBody String editTeacherPhone(Teacher teacherVO) {
		String teacher_phone = teacherVO.getPhone();
		String teacher_id = teacherVO.getId();
		
		tService.editTeacherPhone(teacher_phone, teacher_id);
		return "";
	}

	// 수강생 탈퇴
	@RequestMapping(value = "account/studentDelete", method = RequestMethod.POST)
	public String studentDelete(Student studentVO) {
		String student_id = studentVO.getId();
		sService.deleteStudent(student_id);
		return "common/main";
	}
	
	//교직원 탈퇴
	@RequestMapping(value = "account/teacherDelete", method = RequestMethod.POST)
	public String teacherDelete(Teacher teacherVO) {
		String teacher_id = teacherVO.getId();
		tService.deleteTeacher(teacher_id);
		return "common/main";
	}

}
