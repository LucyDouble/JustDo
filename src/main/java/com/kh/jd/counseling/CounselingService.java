package com.kh.jd.counseling;

import java.util.List;
import java.util.Map;

import com.kh.jd.notice.Notice;

public interface CounselingService {

	//목록조회
	public List<Counseling> listCS(int startPage, int limit,Map<String, Object> map);
	//페이징
	public int getListCount(Map<String, Object> map);
	//상세조회
	public Counseling viewCS(int counseling_no);
	//등록
	public int addCS(Counseling vo);
	//삭제
	public int removeCS(int counseling_no);
	//수정
	public int editCS(Map<String, Object> map);
}
