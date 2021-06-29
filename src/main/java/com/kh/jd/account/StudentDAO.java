package com.kh.jd.account;

import java.security.SecureRandom;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.apache.tomcat.util.codec.binary.Base64;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Repository;

@Repository
public class StudentDAO {

	@Autowired
	SqlSession sqlSession;
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	@Autowired
	JavaMailSender mailSender;
	
	private static final Logger logger = LoggerFactory.getLogger(SignUpController.class);

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
		
		//비밀번호 찾기 이메일 발송
		public void sendPassword(String student_id, String student_email) {
			//난수 생성
			String key = "";
			while(true) {
				byte[] bytes = new byte[4];
				SecureRandom random = new SecureRandom();
				random.nextBytes(bytes);
				
				try {
					key = new String(Base64.encodeBase64(bytes, false), "UTF-8").replace("==", "");
				} catch (Exception e) {
					e.printStackTrace();
				}
				if(key.matches("[a-zA-Z0-9]*$")) {
					break;
				}
			}
			
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("id", student_id);
			map.put("email", student_email);
			System.out.println(student_id);
			System.out.println(student_email);
			sqlSession.update("Student.tempPassword", key);
			
			Student student = sqlSession.selectOne("Student.infoStudent2", student_id);
			String name = student.getName();
			MimeMessage mail = mailSender.createMimeMessage();
			String cert_msg ="<h2>안녕하세요 '"+ name +"' 님</h2><br><br>" 
					+ "<p>비밀번호 찾기를 신청해주셔서 임시 비밀번호를 발급해드렸습니다.</p>"
					+ "<p>임시로 발급 드린 비밀번호는 <h2 style='color : blue'>'" + key +"'</h2>이며 로그인 후 마이페이지에서 비밀번호를 변경해주시면 됩니다.</p><br>"
					+ "<h3><a href='http://localhost:8080/jd/jdHome'> 교육원 접속 ^0^</a></h3><br><br>"
					+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
		try {
			mail.setSubject("[JD 교육원] 임시 비밀번호가 발급되었습니다", "utf-8");
			mail.setText(cert_msg);
			mail.addRecipient(RecipientType.TO, new InternetAddress(student_email));
			mailSender.send(mail);;
		} catch (Exception e) {
			e.printStackTrace();
		}}
		
		

		
}
