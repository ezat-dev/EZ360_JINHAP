package com.geomet.dao;

import java.util.List;


import com.geomet.domain.Quality;

public interface QualityDao {
	
	  //부적합품 관리
	  List<Quality> getNonProductManageList(Quality params);

	  void saveNonProductManage(Quality quality);
	  
	  void delNonProductManage(Quality quality);
	  
	  
	    
	    
	    List<Quality> getqualityList(Quality quality); 
	    
	    void savetusTest(Quality quality);
	    
	    void deltusTest(Quality quality);
}
