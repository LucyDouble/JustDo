package com.kh.jd.account;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ManagerDAO {

	@Autowired
	SqlSession sqlSession;
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	// 아이디 체크
	public int idCheck(String manager_id) {
		System.out.println("idCheck");
		int result = sqlSession.selectOne("Manager.idCheck", manager_id);
		return result;
	}

	// 로그인 체크
	public boolean loginCheck(Manager dto) {
		System.out.println("loginCheck");
		String name = sqlSession.selectOne("Manager.loginCheck", dto);
		System.out.println(name);
		return (Integer.parseInt(name) == 0) ? false : true;
	}
	
	//로그 아웃
	public void logout(HttpSession session) {
		session.invalidate();
	}
	
	//운영자 정보
	public Manager infoManager(Manager dto) {
		Manager result = sqlSession.selectOne("Manager.infoManager", dto);
		return result;
	}
	
	//교직원 승인
	public void acceptTeacher(String teacher_id, int teacher_accept) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", teacher_id);
		map.put("teacher_accept", teacher_accept);
		sqlSession.update("acceptTeacher", teacher_accept);
	}
	//비승인 교직원 조회
	public List<Teacher> teacherList(){
		return sqlSession.selectList("Teacher.notAcceptTeacher");
	};
}
