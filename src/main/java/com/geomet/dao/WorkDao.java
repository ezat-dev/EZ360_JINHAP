package com.geomet.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.geomet.domain.Work;

@Repository
public interface WorkDao {
	List<Work> getInventoryStatusList(Work work);
	void insertinventoryStatus(Work work);
    boolean inventoryStatusUpdate(Work work);
    int deleteInventoryStatus(List<Integer> ids);

	//생산현황
	List<Work> getMachineEfficStatusList(Work work);
	

    // 작업일보 리스트 (테이블 3)
    List<Work> getWorkDailyList(Work work);
    List<Work> list_condition(Work work);
    // 작업일보 요약 (테이블 2)
    List<Work> getWorkDailySum(Work work);

    // 작업일보 투입 정보 (테이블 1)
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
