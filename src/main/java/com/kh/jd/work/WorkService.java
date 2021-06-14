package com.kh.jd.work;

import java.util.List;

public interface WorkService {
	public List<Work> listWork(int startPage, int limit);
	public int getListCount();
}
