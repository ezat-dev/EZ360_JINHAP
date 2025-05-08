package com.geomet.service;

import java.util.List;

import com.geomet.domain.Work;

public interface WorkService {

	//재고관리
	List<Work> getInventoryStatusList(Work work);
	
	void insertinventoryStatus(Work work);
	
	//생산현황
	List<Work> getMachineEfficStatusList(Work work);
	
	
	 	List<Work> getWorkDailyList(Work work);
	    List<Work> getWorkDailySum(Work work);
	    List<Work> getReportInputLIst(Work work);
}
