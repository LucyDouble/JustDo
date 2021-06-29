package com.kh.jd.account;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StudentDAO {

	@Autowired
	SqlSession sqlSession;
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	//아이디 체크
	public int idCheck(String student_id) {
		System.out.println("idCheck");
		int result = sqlSession.selectOne("Student.idCheck", student_id);
		return result;
	}
	// 회원 가입
	public void signUp(Student dto) {
		sqlSession.insert("Student.signUp", dto);
	}
		
	// 로그인 체크
	public boolean loginCheck(Student dto) {
		System.out.println("loginCheck");
		String name = sqlSession.selectOne("Student.loginCheck", dto);
		System.out.println(name);
		return (Integer.parseInt(name)==0)?false:true;
	}
	
	//로그 아웃
	public void logout(HttpSession session) {
		session.invalidate();
	}
	
	//학생 정보
		public Student infoStudent(Student dto) {
			
			Student result = sqlSession.selectOne("Student.infoStudent", dto);
			return result;
		}
		
	//이메일 체크
		public int emailCheck(String student_email) {
			System.out.println("emailCheck");
			int result = sqlSession.selectOne("Student.emailCheck", student_email);
			return result;
		}
		
	//휴대폰 체크
		public int phoneCheck(String student_phone) {
			System.out.println("phoneCheck");
			int result = sqlSession.selectOne("Student.phoneCheck", student_phone);
			return result;
		}
	//수강생 비밀번호 수정
		public void editStudentPw(String student_pw, String student_id) {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("password", student_pw);
			map.put("id", student_id);
			sqlSession.update("Student.editStudentPw", map);
		}
	//수강생 이름 수정
		public void editStudentName(String student_name, String student_id) {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("name", student_name);
			map.put("id", student_id);
			sqlSession.update("Student.editStudentName", map);
		}
	//수강생 주소 수정
		public void editStudentAddress(String student_address, String student_id) {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("address", student_address);
			map.put("id", student_id);
			sqlSession.update("Student.editStudentAddress", map);
		}
		//수강생 휴대폰번호 수정
		public void editStudentPhone(String student_phone, String student_id) {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("phone", student_phone);
			map.put("id", student_id);
			sqlSession.update("Student.editStudentPhone", map);
		}
		//수강생 탈퇴
		public void deleteStudent(String student_id) {
			sqlSession.delete("Student.deleteStudent", student_id);
		}
		
		//아이디 찾기
		public String student_searchId(String student_name, String student_email) {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("name", student_name);
			map.put("email", student_email);
			String result = "";
			try {
				result = sqlSession.selectOne("Student.searchStudentId", map);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return result;
		}
		
		//비밀번호 찾기

		
}
