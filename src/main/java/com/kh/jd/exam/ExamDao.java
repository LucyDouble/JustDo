package com.kh.jd.exam;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.jd.work.Work;


@Repository("examDao")
public class ExamDao {
	@Autowired
	private SqlSession sqlSession;

	public List<Exam> listExam(int startPage, int limit,Map<String, Object> map) {
		int startRow = (startPage - 1) * limit;
		RowBounds row = new RowBounds(startRow, limit);
		return sqlSession.selectList("exam.listExam", map, row);
	}
	public int getListCount(Map<String, Object> map) {
		return sqlSession.selectOne("exam.getlistCount",map);
	}
	public Exam viewWork(int exam_no) {
		return sqlSession.selectOne("exam.viewExam", exam_no);
	}
	public int checkExamNo(Exam vo) {
		return sqlSession.selectOne("exam.checkClassNo", vo);
	}
	public void addExam(Exam vo) {
		sqlSession.insert("exam.addExam",vo);
	}
	public List<Exam> registrationNo(int lectureclass_no) {
		return sqlSession.selectList("exam.registrationNo", lectureclass_no);
	}
	public int addExamResult(int regstration_no) {
		return sqlSession.insert("exam.addExamResult",regstration_no);
	}
	public void editExam(Exam vo) {
		sqlSession.insert("exam.editExam",vo);
	}
	public void removeExam(int exam_no) {
		sqlSession.delete("exam.removeExam",exam_no);
	}
}
