package com.geomet.service;

import java.util.List;

import com.geomet.domain.Work;

public interface WorkService {

	//재고관리
	List<Work> getInventoryStatusList(Work work);
	
	void insertinventoryStatus(Work work);
}
