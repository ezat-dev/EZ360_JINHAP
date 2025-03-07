package com.jinhap.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jinhap.dao.ManagementDao;
import com.jinhap.domain.Permission;
import com.jinhap.domain.Users;

@Service
public class ManagementServiceImpl implements ManagementService {
	@Autowired
	private ManagementDao managementDao;
	
	@Override
	public List<Users> getUserList(){
		return managementDao.getUserList();
	}
	@Override
	public List<Users> getBigPageList(){
		return managementDao.getBigPageList();
	}
	
	@Override
	public List<Users> getSmallPageList(String page_big) {  
		return managementDao.getSmallPageList(page_big);  
	}
	
	@Override
	public Permission authorityUserSelect(Permission permission) {
		return managementDao.authorityUserSelect(permission);
	}
	@Override
	public void authorityUserSelectSave(Permission permission) {
		managementDao.authorityUserSelectSave(permission);
	}
	
}
