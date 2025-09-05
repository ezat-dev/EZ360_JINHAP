package com.geomet.service;

import java.util.List;


import com.geomet.domain.Work;

public interface WorkService {

	//재고관리
	List<Work> getInventoryStatusList(Work work);
	
	void insertinventoryStatus(Work work);	

    boolean inventoryStatusUpdate(Work work);
   
    boolean deleteInventoryStatus(List<Integer> ids);
    
	//생산현황
	List<Work> getMachineEfficStatusList(Work work);
	
	
	 	List<Work> getWorkDailyList(Work work);
	 	List<Work> list_condition(Work work);
	 	
	    List<Work> getWorkDailySum(Work work);
	    List<Work> getReportInputLIst(Work work);
	    
	//작업일보
		void insertReportInput(Work work); 
		void deleteReportInput(Work work); 
		
	//모니터링 현황
		List<Work> MonitoringStatusList(Work work);
	    List<Work> MonitoringStatusList2(Work work);
	    
	    
	    List<Work> getInputControlStatusUp(Work work);
	    List<Work> getInputControlStatusDown(Work work);
	    
	    List<Work> machineRealStatusDown(Work work);
	    List<Work> machineRealStatusUp(Work work);

	    List<Work> lotReportStatusList(Work work);
	    
	    List<Work> monitoringStatusList(Work work);
	    
	    //약품정보
	    List<Work> getMedicineInfoList(Work work);
	    boolean medicineInfoUpdate(Work work);
	    boolean medicineInfoDelete(Work work);
	    boolean medicineInfoInsert(Work work);
	    
	    List<Work> getMedicineInfo_main(Work work);
	}

