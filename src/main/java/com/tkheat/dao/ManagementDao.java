package com.tkheat.dao;

import java.util.List;

import com.tkheat.domain.Permission;
import com.tkheat.domain.Users;

public interface ManagementDao {
	List<Users> getUserList(); 
	
	List<Users> getBigPageList(); 
	
	List<Users> getSmallPageList(String page_big);

	Permission authorityUserSelect(Permission permission);

	void authorityUserSelectSave(Permission permission);
	

}
