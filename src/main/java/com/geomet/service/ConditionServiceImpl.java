package com.geomet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geomet.dao.ConditionDao;
import com.geomet.domain.Condition;
import com.geomet.domain.CorrStatus;
import com.geomet.domain.Work;



@Service 
public class ConditionServiceImpl implements ConditionService {

@Autowired  
private ConditionDao conditionDao;
	//기준정보
	@Override
	public List<Condition> getStandardInfoList(Condition params) {
	    return conditionDao.getStandardInfoList(params); 	   
	}

	@Override
    public void saveDivisionWeight(Condition condition) {
		conditionDao.saveDivisionWeight(condition);
    }
	
	@Override
    public void delDivisionWeight(Condition condition) {
		conditionDao.delDivisionWeight(condition);
    }
	
	//TC조절
	@Override
	public List<Condition> getCorrStatusList(Condition params) {
	    return conditionDao.getCorrStatusList(params); 	   
	}
	@Override
    public void delCorrStatus(Condition condition) {
		conditionDao.delCorrStatus(condition);
    }
	
	 @Override
	    public void saveCorrStatus(Condition condition) {
		 	conditionDao.saveCorrStatus(condition);
	    }
	 
	 
	 //조건관리
	 
		@Override
		public List<Condition> getconditionList(Condition condition){
			return conditionDao.getconditionList(condition);
		}
		
		 @Override
		    public void machinePartTempUpdate(Condition condition) {
			 	conditionDao.machinePartTempUpdate(condition);
		    }
 
}
