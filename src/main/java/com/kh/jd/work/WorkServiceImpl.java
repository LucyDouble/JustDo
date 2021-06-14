package com.kh.jd.work;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("workService")
public class WorkServiceImpl implements WorkService{

	@Autowired
	private WorkDao workDao;
	
	@Override
	public List<Work> listWork(int startPage, int limit) {
		return workDao.listWork( startPage, limit);
	}

	@Override
	public int getListCount() {
		return workDao.getListCount();
	}

}
