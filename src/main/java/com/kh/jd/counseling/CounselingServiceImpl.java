package com.kh.jd.counseling;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jd.notice.Notice;

@Service("counselingService")
public class CounselingServiceImpl implements CounselingService{
	
	@Autowired
	private CounselingDao counselingDao;

	@Override
	//목록조회
	public List<Counseling> listCS(int startPage, int limit, Map<String, Object> map) {
		return counselingDao.listCS(startPage, limit, map);
	}
	@Override
	//페이징
	public int getListCount(Map<String, Object> map) {
		return counselingDao.getListCount(map);
	}
	@Override
	//상세조회
	public Counseling viewCS(int counseling_no) {
		return counselingDao.viewCS(counseling_no);
	}
	@Override
	//등록
	public int addCS(Counseling vo) {
		System.out.println("서비스 vo="+vo);
		return counselingDao.addCS(vo);
	}
	@Override
	//삭제
	public int removeCS(int counseling_no) {
		int result = 0;
		result = counselingDao.removeCS(counseling_no);
		return result;
	}
	@Override
	//수정
	public int editCS(Map<String,Object> map) {
		return counselingDao.editCS(map);
	}
}
