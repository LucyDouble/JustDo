package com.kh.jd.work;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.jd.lecture.Lecture;

@Repository("workDao")
public class WorkDao {

	@Autowired
	private SqlSession sqlSession;

	public List<Work> listWork(int startPage, int limit,Map<String, Object> map) {

		int startRow = (startPage - 1) * limit;
		RowBounds row = new RowBounds(startRow, limit);
		return sqlSession.selectList("work.listWork", map, row);
	}

	public int getListCount(Map<String, Object> map) {
		return sqlSession.selectOne("work.getlistCount",map);
	}
	public int addWork(Work vo) {
		return sqlSession.insert("work.addWork",vo);
	}
	public Work viewWork(int work_no) {
		return sqlSession.selectOne("work.viewWork", work_no);
	}
	public List<Lecture> lecturechk(int teacher_number){
		return sqlSession.selectList("work.lecturechk",teacher_number);
	}
	public List<Work> classCheck(int lecture_no) {
		return sqlSession.selectOne("work.classCheck", lecture_no);
	}
	public void removeWork(int work_no) {
		sqlSession.delete("work.removeWork", work_no);
	}
	public void editWork(Work vo) {
		sqlSession.update("work.editWork",vo);
	}
	public List<Work> listWorkResult(int startPage, int limit,Map<String, Object> map) {

		int startRow = (startPage - 1) * limit;
		RowBounds row = new RowBounds(startRow, limit);
		return sqlSession.selectList("work.listWorkResult", map, row);
	}
	public int getlistWorkResultCount(Map<String, Object> map) {
		return sqlSession.selectOne("work.getlistWorkResultCount",map);
	}
	public List<Work> registrationNo(int lecture_no) {
		return sqlSession.selectList("work.registrationNo", lecture_no);
	}
	public int addWorkResult(int regstration_no) {
		return sqlSession.insert("work.addWorkResult",regstration_no);
	}
	public int getCountClass1(int work_no) {
		return sqlSession.selectOne("work.getCountClass1",work_no);
	}
	public int getCountWorkSubmit1(int work_no) {
		return sqlSession.selectOne("work.getCountWorkSubmit1",work_no);
	}
	public int getCountClass2(int work_no) {
		return sqlSession.selectOne("work.getCountClass2",work_no);
	}
	public int getCountWorkSubmit2(int work_no) {
		return sqlSession.selectOne("work.getCountWorkSubmit2",work_no);
	}
}
