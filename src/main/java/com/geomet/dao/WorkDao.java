package com.geomet.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.geomet.domain.Work;

@Repository
public interface WorkDao {
	List<Work> getInventoryStatusList(Work work);
	void insertinventoryStatus(Work work);
	
	//생산현황
	List<Work> getMachineEfficStatusList(Work work);
	

    // 작업일보 리스트 (테이블 3)
    List<Work> getWorkDailyList(Work work);

    // 작업일보 요약 (테이블 2)
    List<Work> getWorkDailySum(Work work);

    // 작업일보 투입 정보 (테이블 1)
    List<Work> getReportInputLIst(Work work);
}
