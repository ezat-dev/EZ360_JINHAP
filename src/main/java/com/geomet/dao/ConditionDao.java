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
	  
	  //조건관리
	  
	  List<Condition> getconditionList(Condition condition);
	  void machinePartTempUpdate(Condition condition);
	 
	  
	  
	  //액교반일지
	  
	    List<Condition> getMachineliquidmanage(Condition condition); 
	    void insertMachineliquidmanage(Condition condition); 
	    
	    List<Condition> getMachineliquidmanage2(Condition condition); 
	    void insertMachineliquidmanage2(Condition condition); 
	   
	    void deleteMachineliquidmanage(Condition condition); 
	    void deleteMachineliquidmanage2(Condition condition); 
	    

	    
	    //세척
	    List<Condition> divisionWashingList(Condition condition); 
	    void divisionWashingUpdate(Condition condition); 
	    
}
