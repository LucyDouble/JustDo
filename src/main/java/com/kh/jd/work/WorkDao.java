package com.kh.jd.work;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.jd.lecture.Lecture;

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
	public int addWork(Work vo) {
		System.out.println("다르면 안된다"+vo.getWork_start());
		System.out.println("다르면 안된다"+vo.getWork_end());
		return sqlSession.insert("work.addWork",vo);
	}
	public List<Lecture> lecturechk(int teacher_number){
		return sqlSession.selectList("work.lecturechk",teacher_number);
	}
	public List<Work> classCheck(int lecture_no) {
		return sqlSession.selectOne("work.classCheck", lecture_no);
	}
}
