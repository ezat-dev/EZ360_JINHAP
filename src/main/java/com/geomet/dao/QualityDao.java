package com.geomet.dao;

import java.util.List;


import com.geomet.domain.Quality;

public interface QualityDao {
	
	  //부적합품 관리
	  List<Quality> getNonProductManageList(Quality params);

	  void saveNonProductManage(Quality quality);
}
