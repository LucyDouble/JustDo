package com.kh.jd.progress;

import java.util.List;

public interface ProgressService {
	public int updateProgress(Progress progress);
	public Progress vidwProgress(Progress progress);
	public int addProgress(Progress progress);
	public List<Integer> avgProgress(int lecture_no);
	public List<Integer> avgProgress1(int lecture_no);
	public List<Integer> myProgress(Progress progress);
	public List<Integer> myProgress1(Progress progress);
	public List<Integer> classProgress(int lecture_no);
	public List<Integer> classProgress1(int lecture_no);
	public List<Integer> class2Progress(int lecture_no);
	public List<Integer> class2Progress1(int lecture_no);
}
