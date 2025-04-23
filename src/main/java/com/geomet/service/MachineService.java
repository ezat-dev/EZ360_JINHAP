package com.geomet.service;

import java.util.List;
import com.geomet.domain.Machine;
import com.geomet.domain.Temp_data;

	

public interface MachineService {
	

	//정기점검 계획/실적
	List<Machine> getMachineList(Machine machine); 
	
	void updatecheckPlan(Machine machine);
	
	//온도 트랜드
	List<Temp_data> getTempDataList(Temp_data temp);
	
	
	//통합 모니터링
	List<Machine> getAllDataList(Machine machine); 
	
	
	//비가동 현황
	List<Machine> getNonTimeDataList(Machine machine);
	void saveNonTime(Machine machine); 
	void updateNonTime(Machine machine); 
	void deleteNonTime(String non_time_idx); 
	//비가동 뷰
	List<Machine> getNonTimeDataView(Machine machine);
	
	
	//설비카드
	List<Machine> getRepairStatusList(Machine machine);
	void insertRepairStatus(Machine machine); 
	void delRepairStatus(Machine machine); 
	
	//부품 교체이력
	List<Machine> getPartStatusList(Machine machine);
	void insertPartStatus(Machine machine); 
	void delPartStatus(Machine machine); 
	
	
	//스페어 부품	
	List<Machine> getspareStatusList(Machine machine);
	void insertspareStatus(Machine machine); 
	void delspareStatus(Machine machine); 
	
	
	//공무일지
	List<Machine> getlogStatusList(Machine machine);
	void insertlogStatus(Machine machine); 
	void dellogStatus(Machine machine);

}
