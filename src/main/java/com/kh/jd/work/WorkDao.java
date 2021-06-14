package com.kh.jd.work;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("workDao")
public class WorkDao {

	@Autowired
	private SqlSession sqlSession;

	public List<Work> listWork(int startPage, int limit) {

		int startRow = (startPage - 1) * limit;
		RowBounds row = new RowBounds(startRow, limit);
		return sqlSession.selectList("work.listWork", null, row);
	}

	public int getListCount() {
		return sqlSession.selectOne("work.getlistCount");
	}
}
