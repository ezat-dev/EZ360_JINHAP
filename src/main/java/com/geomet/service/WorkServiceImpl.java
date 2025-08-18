package com.geomet.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geomet.dao.WorkDao;
import com.geomet.domain.Machine;
import com.geomet.domain.Work;

@Service
public class WorkServiceImpl implements WorkService {
	
	@Autowired
	private WorkDao workDao;
	
	//재고관리
	@Override
	public List<Work> getInventoryStatusList(Work work){
		return workDao.getInventoryStatusList(work);
	}
	@Override
    public void insertinventoryStatus(Work work) {
		workDao.insertinventoryStatus(work); 	   
    }
	
    @Override
    public boolean inventoryStatusUpdate(Work work) {
       return workDao.inventoryStatusUpdate(work);
    }
	//생산관리
	@Override
	public List<Work> getMachineEfficStatusList(Work work){
		return workDao.getMachineEfficStatusList(work);
	}

	
	 	@Override
	    public List<Work> getWorkDailyList(Work work) {
	        return workDao.getWorkDailyList(work);
	    }
	 	@Override
	    public List<Work> list_condition(Work work) {
	        return workDao.list_condition(work);
	    }
	 	

	    @Override
	    public List<Work> getWorkDailySum(Work work) {
	        return workDao.getWorkDailySum(work);
	    }

	    @Override
	    public List<Work> getReportInputLIst(Work work) {
	        return workDao.getReportInputLIst(work);
	    }
	    
	    
	    @Override
	    public void insertReportInput(Work work) {
	    	workDao.insertReportInput(work); 	   
	    }
	    @Override
	    public void deleteReportInput(Work work) {
	    	workDao.deleteReportInput(work); 	   
	    }
	    
	    @Override
	    public List<Work> MonitoringStatusList(Work work) {
	        return workDao.MonitoringStatusList(work);
	    }

	    @Override
	    public List<Work> MonitoringStatusList2(Work work) {
	        return workDao.MonitoringStatusList2(work);
	    }
	    
	    @Override
	    public List<Work> getInputControlStatusUp(Work work) {
	        return workDao.getInputControlStatusUp(work);
	    }
	    @Override
	    public List<Work> getInputControlStatusDown(Work work) {
	        return workDao.getInputControlStatusDown(work);
	    }
	    @Override
	    public List<Work> machineRealStatusDown(Work work) {
	        return workDao.machineRealStatusDown(work);
	    }
	    @Override
	    public List<Work> machineRealStatusUp(Work work) {
	        return workDao.machineRealStatusUp(work);
	    }
	    @Override
	    public List<Work> lotReportStatusList(Work work) {
	        return workDao.lotReportStatusList(work);
	    }
	    
}
