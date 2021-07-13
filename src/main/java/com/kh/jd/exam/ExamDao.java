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
	public int getlistExamResultCount(Map<String, Object> map) {
		return sqlSession.selectOne("exam.getlistExamResultCount",map);
	}
	public List<Exam> listExamResult(int startPage, int limit,Map<String, Object> map) {

		int startRow = (startPage - 1) * limit;
		RowBounds row = new RowBounds(startRow, limit);
		return sqlSession.selectList("exam.listExamResult", map, row);
	}
	public Exam viewExamResult(Exam vo) {
		return sqlSession.selectOne("exam.viewExamResult",vo);
	}
	public void editExamGrade(Exam vo) {
		sqlSession.update("exam.editExamGrade",vo);
	}
	public int getCountClass1(int exam_no) {
		return sqlSession.selectOne("exam.getCountClass1", exam_no);
	}
	public int getCountClass2(int exam_no) {
		return sqlSession.selectOne("exam.getCountClass2", exam_no);
	}
	public List<Integer> getGradeExam1(int exam_no) {
		return sqlSession.selectList("exam.getGradeExam1", exam_no);
	}
	public List<Integer> getGradeExam2(int exam_no) {
		return sqlSession.selectList("exam.getGradeExam2", exam_no);
	}
	public List<Exam> listSubmitExam(int startPage, int limit,Map<String, Object> map) {
		int startRow = (startPage - 1) * limit;
		RowBounds row = new RowBounds(startRow, limit);
		return sqlSession.selectList("exam.listSubmitExam", map, row);
	}
	public int getlistSubmitCount(Map<String, Object> map) {
		return sqlSession.selectOne("exam.getlistSubmitCount",map);
	}
	public Exam viewSubmitExam(Exam vo) {
		return sqlSession.selectOne("exam.viewSubmitExam", vo);
	}
	public Exam timeSubmitExam(Exam vo) {
		return sqlSession.selectOne("exam.timeSubmitExam", vo);
	}
	public void submitExam(Exam vo) {
		sqlSession.update("exam.submitExam",vo);
	}
	public void removeSubmitExam(Exam vo) {
		sqlSession.delete("exam.removeSubmitExam",vo);
	}
}
