package com.geomet.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.geomet.domain.Condition;

@Repository
public interface ConditionDao {
	List<Condition> getStandardInfoList(Condition params); 
	
	  void saveDivisionWeight(Condition condition);
	  
	  void delDivisionWeight(Condition condition);
}
