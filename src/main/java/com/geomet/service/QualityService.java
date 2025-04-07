package com.geomet.service;

import java.util.List;


import com.geomet.domain.Quality;

public interface QualityService {
	//부적합품 관리
    List<Quality> getNonProductManageList(Quality params); 
    
    void saveNonProductManage(Quality quality);
}
