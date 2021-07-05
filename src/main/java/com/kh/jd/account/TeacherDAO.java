package com.kh.jd.account;

import java.security.SecureRandom;
import java.util.HashMap;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Repository;

@Repository
public class TeacherDAO {

	@Autowired
	SqlSession sqlSession;
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	@Autowired
	JavaMailSender mailSender;
	
	// 아이디 체크
	public int idCheck(String teacher_id) {
		System.out.println("idCheck");
		int result = sqlSession.selectOne("Teacher.idCheck", teacher_id);
		return result;
	}

	// 회원 가입
	public void signUp(Teacher dto) {
		sqlSession.insert("Teacher.signUp", dto);
	}

	// 로그인 체크
	public boolean loginCheck(Teacher dto) {
		System.out.println("loginCheck");
		String name = sqlSession.selectOne("Teacher.loginCheck", dto);
		System.out.println(name);
		return (Integer.parseInt(name) == 0) ? false : true;
	}
	
	//승인 체크
	public int acceptCheck(String teacher_id) {
		System.out.println("acceptCheck");
		int accept = sqlSession.selectOne("Teacher.acceptCheck", teacher_id);
		System.out.println(accept);
		return accept;
	}

	// 로그 아웃
	public void logout(HttpSession session) {
		session.invalidate();
	}

	// 교직원 정보
	public Teacher infoTeacher(Teacher dto) {

		Teacher result = sqlSession.selectOne("Teacher.infoTeacher", dto);
		return result;
	}

	// 이메일 체크
	public int emailCheck(String teacher_email) {
		System.out.println("emailCheck");
		int result = sqlSession.selectOne("Teacher.emailCheck", teacher_email);
		return result;
	}

	// 휴대폰 체크
	public int phoneCheck(String teacher_phone) {
		System.out.println("phoneCheck");
		int result = sqlSession.selectOne("Teacher.phoneCheck", teacher_phone);
		return result;
	}

	// 교직원 비밀번호 수정
	public void editTeacherPw(String teacher_pw, String teacher_id) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("password", teacher_pw);
		map.put("id", teacher_id);
		sqlSession.update("Teacher.editTeacherPw", map);
	}

	// 교직원 이름 수정
	public void editTeacherName(String teacher_name, String teacher_id) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("name", teacher_name);
		map.put("id", teacher_id);
		sqlSession.update("Teacher.editTeacherName", map);
	}

	// 교직원 주소 수정
	public void editTeacherAddress(String teacher_address, String teacher_id) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("address", teacher_address);
		map.put("id", teacher_id);
		sqlSession.update("Teacher.editTeacherAddress", map);
	}

	// 교직원 휴대폰번호 수정
	public void editTeacherPhone(String teacher_phone, String teacher_id) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("phone", teacher_phone);
		map.put("id", teacher_id);
		sqlSession.update("Teacher.editTeacherPhone", map);
	}

	// 교직원 탈퇴
	public void deleteTeacher(String teacher_id) {
		sqlSession.delete("Teacher.deleteTeacher", teacher_id);
	}
	
	// 아이디 찾기
		public String teacher_searchId(String teacher_name, String teacher_email) {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("name", teacher_name);
			map.put("email", teacher_email);
			String result = "";
			try {
				result = sqlSession.selectOne("Teacher.searchTeacherId", map);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return result;
		}

		// 비밀번호 찾기 이메일 발송
		public void sendPassword(String teacher_id, String teacher_email) {
			// 난수 생성
			String key = "";
			while (true) {
				byte[] bytes = new byte[4];
				SecureRandom random = new SecureRandom();
				random.nextBytes(bytes);

				try {
					key = new String(Base64.encodeBase64(bytes, false), "UTF-8").replace("==", "");
				} catch (Exception e) {
					e.printStackTrace();
				}
				if (key.matches("[a-zA-Z0-9]*$")) {
					break;
				}
			}

			HashMap<String, String> map = new HashMap<String, String>();
			map.put("id", teacher_id);
			map.put("email", teacher_email);
			HashMap<String, String> map2 = new HashMap<String, String>();
			map2.put("id", teacher_id);
			map2.put("password", key);
			System.out.println(teacher_id);
			System.out.println(teacher_email);
			sqlSession.update("Teacher.tempPassword", map2);

			Student teacher = sqlSession.selectOne("Teacher.infoTeacher2", teacher_id);
			String name = teacher.getName();
			MimeMessage mail = mailSender.createMimeMessage();
			String cert_msg = "<h2>안녕하세요 '" + name + "' 선생님</h2><br><br>" + "<p>JD교육원 임시 비밀번호를 발급해드렸습니다.</p>"
					+ "<p>임시로 발급 드린 비밀번호는 <h2 style='color : blue'>'" + key
					+ "'</h2>이며 로그인 후 마이페이지에서 비밀번호를 변경해주시면 됩니다.</p><br>"
					+ "<h3><a href='http://localhost:8090/jd/jdHome'> 교육원 접속</a></h3><br><br>"
					+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
			try {
				mail.setSubject("[JD 교육원] 임시 비밀번호가 발급되었습니다", "utf-8");
				mail.setText(cert_msg, "utf-8", "html");
				mail.addRecipient(RecipientType.TO, new InternetAddress(teacher_email));
				mailSender.send(mail);
				;
			} catch (MessagingException e) {
				e.printStackTrace();
			}
		}


}
