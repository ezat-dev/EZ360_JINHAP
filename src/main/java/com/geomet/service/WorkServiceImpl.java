package com.geomet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geomet.dao.WorkDao;
import com.geomet.domain.Work;

@Service
public class WorkServiceImpl implements WorkService {
	
	@Autowired
	private WorkDao workDao;
	
	//재고관리
	@Override
	public List<Work> getInventoryStatusList(Work work){
		return workDao.getInventoryStatusList(work);
	}

}
