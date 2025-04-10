package com.geomet.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.geomet.domain.Machine;
import com.geomet.domain.Temp_data;



@Repository
public interface MachineDao {

	  //정기점검 계획/실적
	  List<Machine> getMachineList(Machine machine); 
	  
	  void updatecheckPlan(Machine machine);
	  
	  List<Temp_data> getTempDataList(Temp_data temp);
	
}
