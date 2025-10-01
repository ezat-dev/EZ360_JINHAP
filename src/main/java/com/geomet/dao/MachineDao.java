package com.geomet.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.geomet.domain.Machine;
import com.geomet.domain.Temp_data;
import com.geomet.domain.Work;



@Repository
public interface MachineDao {

	  //정기점검 계획/실적
	  List<Machine> getMachineList(Machine machine); 
	  
	  void updatecheckPlan(Machine machine);
	  
	  List<Temp_data> getTempDataList(Temp_data temp);
	
	  //통합모니터링
	  List<Machine> getAllDataList(Machine machine);
	  
	//비가동현황
	  List<Machine> getNonTimeDataList(Machine machine);
	  void saveNonTime(Machine machine);
	  void updateNonTime(Machine machine);
	  void deleteNonTime(String non_time_idx);
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
		
		List<Machine> getErrDataList(Machine machine);
		List<Machine> getErrAlarmRanking(Machine machine);
		
		List<Machine> getFacilityList(Machine machine);
		void insertFacility(Machine machine); 
		void deleteFacility(Machine machine);
		
		//설비별 모니터링
		List<Machine> getdetailMonitoring(Machine machine);
		
	    List<Work> workReport1(Machine machine);
		 List<Work> workReport2(Machine machine);
	    List<Work> workReport3(Machine machine);
}
