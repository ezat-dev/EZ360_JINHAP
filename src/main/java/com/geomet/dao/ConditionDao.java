package com.geomet.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.geomet.domain.Condition;


@Repository
public interface ConditionDao {
	  
	  //기준정보
	  List<Condition> getStandardInfoList(Condition params); 
	
	  void saveDivisionWeight(Condition condition);
	  
	  void delDivisionWeight(Condition condition);
	  
	  //TC조절
	  List<Condition> getCorrStatusList(Condition params);
	  
	  void delCorrStatus(Condition condition);
	  
	  void saveCorrStatus(Condition condition);
}
