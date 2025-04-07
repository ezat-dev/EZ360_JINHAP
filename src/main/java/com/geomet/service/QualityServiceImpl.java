package com.geomet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geomet.dao.QualityDao;

import com.geomet.domain.Quality;

@Service 
public class QualityServiceImpl implements QualityService {
	
	@Autowired  
	private QualityDao qualityDao;
	
	
	//부적합품 관리
	@Override
	public List<Quality> getNonProductManageList(Quality params) {
	    return qualityDao.getNonProductManageList(params); 	   
	}
	@Override
    public void saveNonProductManage(Quality quality) {
		qualityDao.saveNonProductManage(quality);
    }

}
