package com.geomet.service;

import java.util.List;


import com.geomet.domain.Condition;
import com.geomet.domain.CorrStatus;

public interface ConditionService {
    
	//기준정보
	List<Condition> getStandardInfoList(Condition params); 
    
    void saveDivisionWeight(Condition condition);
    
    void delDivisionWeight(Condition condition);
    
    //TC조절 이력
    List<Condition> getCorrStatusList(Condition params); 
    
    void delCorrStatus(Condition params); 
   
    void saveCorrStatus(Condition condition);
}
