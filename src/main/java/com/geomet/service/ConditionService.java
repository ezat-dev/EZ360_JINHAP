package com.geomet.service;

import java.util.List;


import com.geomet.domain.Condition;

public interface ConditionService {
    List<Condition> getStandardInfoList(Condition params); 
    
    void saveDivisionWeight(Condition condition);
    
}
