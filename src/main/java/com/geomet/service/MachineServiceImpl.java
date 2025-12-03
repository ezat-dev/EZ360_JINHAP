package com.geomet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geomet.dao.MachineDao;
import com.geomet.domain.Machine;
import com.geomet.domain.Temp_data;
import com.geomet.domain.Work;



@Service 
public class MachineServiceImpl implements MachineService {

	@Autowired
	private MachineDao machineDao;

	@Override
	public List<Machine> getMachineList(Machine machine) {
		return machineDao.getMachineList(machine); 	   
	}

	@Override
	public void updatecheckPlan(Machine machine) {
		machineDao.updatecheckPlan(machine);
	}

	@Override
	public List<Temp_data> getTempDataList(Temp_data temp) {
		return machineDao.getTempDataList(temp);
	}

	@Override
	public List<Machine> getAllDataList(Machine machine) {
		return machineDao.getAllDataList(machine); 	   
	}

	@Override
	public List<Machine> getNonTimeDataList(Machine machine) {
		return machineDao.getNonTimeDataList(machine); 	   
	}
	@Override
	public void saveNonTime(Machine machine) {
		machineDao.saveNonTime(machine); 	   
	}
	@Override
	public void updateNonTime(Machine machine) {
		machineDao.updateNonTime(machine); 	   
	}

	@Override
	public void deleteNonTime(String non_time_idx) {
		machineDao.deleteNonTime(non_time_idx); 	   
	}
	@Override
	public List<Machine> getNonTimeDataView(Machine machine) {
		return machineDao.getNonTimeDataView(machine); 	   
	}


	//설비 이력
	@Override
	public List<Machine> getRepairStatusList(Machine machine) {
		return machineDao.getRepairStatusList(machine); 	   
	}
	@Override
	public void insertRepairStatus(Machine machine) {
		machineDao.insertRepairStatus(machine); 	   
	}
	@Override
	public void delRepairStatus(Machine machine) {
		machineDao.delRepairStatus(machine); 	   
	}
	//설비 이력
	@Override
	public List<Machine> getRepairStatusList_info(Machine machine) {
		return machineDao.getRepairStatusList_info(machine); 	   
	}
	@Override
	public void insertRepairStatus_info(Machine machine) {
		machineDao.insertRepairStatus_info(machine); 	   
	}
	
	@Override
	public void updateRepairStatus_info(Machine machine) {
		machineDao.updateRepairStatus_info(machine); 	   
	}
	@Override
	public void delRepairStatus_info(Machine machine) {
		machineDao.delRepairStatus_info(machine); 	   
	}

	//부품 교체이력
	@Override
	public List<Machine> getPartStatusList(Machine machine) {
		return machineDao.getPartStatusList(machine); 	   
	}
	@Override
	public void insertPartStatus(Machine machine) {
		machineDao.insertPartStatus(machine); 	   
	}
	@Override
	public void delPartStatus(Machine machine) {
		machineDao.delPartStatus(machine); 	   
	}



	//스페어 부품
	@Override
	public List<Machine> getspareStatusList(Machine machine) {
		return machineDao.getspareStatusList(machine); 	   
	}
	@Override
	public void insertspareStatus(Machine machine) {
		machineDao.insertspareStatus(machine); 	   
	}
	@Override
	public void delspareStatus(Machine machine) {
		machineDao.delspareStatus(machine); 	   
	}




	//공무일지
	@Override
	public List<Machine> getlogStatusList(Machine machine) {
		return machineDao.getlogStatusList(machine); 	   
	}
	@Override
	public void insertlogStatus(Machine machine) {
		machineDao.insertlogStatus(machine); 	   
	}
	@Override
	public void dellogStatus(Machine machine) {
		machineDao.dellogStatus(machine); 	   
	}

	@Override
	public List<Machine> getErrDataList(Machine machine) {
		return machineDao.getErrDataList(machine); 	   
	}

	@Override
	public List<Machine> getErrAlarmRanking(Machine machine) {
		return machineDao.getErrAlarmRanking(machine); 	   
	}



	@Override
	public List<Machine> getFacilityList(Machine machine) {
		return machineDao.getFacilityList(machine); 	   
	}
	@Override
	public void insertFacility(Machine machine) {
		machineDao.insertFacility(machine); 	   
	}
	@Override
	public void deleteFacility(Machine machine) {
		machineDao.deleteFacility(machine); 	   
	}


	@Override
	public List<Machine> getdetailMonitoring(Machine machine) {
		return machineDao.getdetailMonitoring(machine); 	   
	}
	@Override
	public List<Work> workReport1(Machine machine) {
		return machineDao.workReport1(machine);
	}
	@Override
	public List<Work> workReport3(Machine machine) {
		return machineDao.workReport3(machine);
	}
	@Override
	public List<Work> workReport2(Machine machine) {
		return machineDao.workReport2(machine);
	}
	@Override
    public List<Machine> workReport4() {
        return machineDao.workReport4();  // ← 파라미터 없음
    }
	@Override
	public List<Work> workReport2_nonTime(Machine machine) {
		return machineDao.workReport2_nonTime(machine);
	}
}
