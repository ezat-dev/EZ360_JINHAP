package com.geomet.service;

import java.util.List;

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
	    public List<Work> getWorkDailySum(Work work) {
	        return workDao.getWorkDailySum(work);
	    }

	    @Override
	    public List<Work> getReportInputLIst(Work work) {
	        return workDao.getReportInputLIst(work);
	    }

}
