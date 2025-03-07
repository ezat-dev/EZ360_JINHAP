package com.jinhap.service;

import java.util.List;

import com.jinhap.domain.Permission;
import com.jinhap.domain.Users;

public interface ManagementService {
	List<Users> getUserList(); 
	
	List<Users> getBigPageList(); 
	
	List<Users> getSmallPageList(String page_big);

	Permission authorityUserSelect(Permission permission);

	void authorityUserSelectSave(Permission permission);
}
