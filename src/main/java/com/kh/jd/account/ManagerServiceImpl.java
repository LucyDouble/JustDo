package com.kh.jd.account;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("mService")
public class ManagerServiceImpl implements ManagerService {
@Autowired
ManagerDAO dao;
	@Override
	public int idCheck(String manager_id) {
		int result = dao.idCheck(manager_id);
		return result;
	}

	@Override
	public boolean loginCheck(Manager dto, HttpSession session) {
		boolean result = dao.loginCheck(dto);
		if(result == true) {
			session.setAttribute("manager_id", dto.getId());
		}
		return result;
	}

	@Override
	public Manager infoManager(Manager dto) {
		return dao.infoManager(dto);
	}

	@Override
	public void logout(HttpSession session) {
		dao.logout(session);
	}

	@Override
	public List<Teacher> teacherList() {
		return dao.teacherList();
	}

	@Override
	public void acceptTeacher(String teacher_id) {
		dao.acceptTeacher(teacher_id);
		
	}
	
	

}
