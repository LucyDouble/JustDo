package com.kh.jd.progress;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("PService")
public class ProgressServiceImpl implements ProgressService{
	@Autowired
	private ProgressDao Pdao;
	@Override
	public int updateProgress(Progress progress) {
		return Pdao.updateProgress(progress);
	}
	@Override
	public Progress vidwProgress(Progress progress) {
		return Pdao.vidwProgress(progress);
	}
	@Override
	public int addProgress(Progress progress) {
		return Pdao.addProgress(progress);
	}
	@Override
	public List<Integer> avgProgress(int lecture_no) {
		return Pdao.avgProgress(lecture_no);
	}
	@Override
	public List<Integer> avgProgress1(int lecture_no) {
		return Pdao.avgProgress1(lecture_no);
	}
	@Override
	public List<Integer> myProgress(Progress progress) {
		return Pdao.myProgress(progress);
	}
	@Override
	public List<Integer> myProgress1(Progress progress) {
		return Pdao.myProgress1(progress);
	}
	@Override
	public List<Integer> classProgress(int lecture_no) {
		return Pdao.classProgress(lecture_no);
	}
	@Override
	public List<Integer> classProgress1(int lecture_no) {
		return Pdao.classProgress1(lecture_no);
	}
	@Override
	public List<Integer> class2Progress(int lecture_no) {
		return Pdao.class2Progress(lecture_no);
	}
	@Override
	public List<Integer> class2Progress1(int lecture_no) {
		return Pdao.class2Progress1(lecture_no);
	}
	
}
