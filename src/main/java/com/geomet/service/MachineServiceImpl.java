package com.geomet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geomet.dao.MachineDao;
import com.geomet.domain.Machine;
import com.geomet.domain.Temp_data;



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
	    
	
}
