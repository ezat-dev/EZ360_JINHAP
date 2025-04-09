package com.geomet.service;

import java.util.List;
import com.geomet.domain.Machine;

	

public interface MachineService {
	

	//정기점검 계획/실적
	List<Machine> getMachineList(Machine machine); 
	

	void updatecheckPlan(Machine machine);
}
