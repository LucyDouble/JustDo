package com.kh.jd.counseling;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.jd.notice.Notice;

@Repository("counselingDao")
public class CounselingDao {

	@Autowired
	private SqlSession sqlSession;
	
	//목록 조회
	public List<Counseling> listCS(int startPage, int limit,Map<String, Object> map){
		
		int startRow = (startPage - 1) * limit;
		RowBounds row = new RowBounds(startRow, limit);
		return sqlSession.selectList("Counseling.listCS", map, row);
	}
	//페이징
	public int getListCount(Map<String, Object> map) {
		return sqlSession.selectOne("Counseling.getlistCount",map);
	}
	//상세조회
	public Counseling viewCS(int counseling_no) {
		return sqlSession.selectOne("Counseling.viewCS", counseling_no);
	}
	//등록
	public int addCS(Counseling vo) {
		System.out.println("다오 vo="+vo);
		return sqlSession.insert("Counseling.addCS", vo);
	}
	//삭제
	public int removeCS(int counseling_no) {
		return sqlSession.delete("Counseling.removeCS", counseling_no);
	}
}
