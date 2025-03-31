package com.geomet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geomet.dao.ConditionDao;
import com.geomet.domain.Condition;



@Service 
public class ConditionServiceImpl implements ConditionService {

@Autowired  
private ConditionDao conditionDao;

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
 
}
