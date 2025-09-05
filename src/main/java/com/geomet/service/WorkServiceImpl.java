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
    
    
    @Override
    public boolean deleteInventoryStatus(List<Integer> ids) {
        return workDao.deleteInventoryStatus(ids) > 0;
    }

	//생산관리
	@Override
	public List<Work> getMachineEfficStatusList(Work work){
		return workDao.getMachineEfficStatusList(work);
	}
	
    //약품정보
	@Override
	public List<Work> getMedicineInfoList(Work work) {
		return workDao.getMedicineInfoList(work);
	}
	//약품정보 업데이트
	@Override
	public boolean medicineInfoUpdate(Work work) {
		// TODO Auto-generated method stub
		return workDao.medicineInfoUpdate(work);
	}	
	//약품정보 삭제
	@Override
	public boolean medicineInfoDelete(Work work) {
		// TODO Auto-generated method stub
		return workDao.medicineInfoDelete(work);
	}
	//약품정보 추가
	@Override
	public boolean medicineInfoInsert(Work work) {
		// TODO Auto-generated method stub
		return workDao.medicineInfoInsert(work);
	}
	
    //약품정보
	@Override
	public List<Work> getMedicineInfo_main(Work work) {
		return workDao.getMedicineInfo_main(work);
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
	    @Override
	    public List<Work> monitoringStatusList(Work work) {
	        return workDao.monitoringStatusList(work);
	    }	    
}
