package com.geomet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geomet.dao.UserDao;
import com.geomet.domain.Facility;
import com.geomet.domain.Permission;
import com.geomet.domain.UserMenu;
import com.geomet.domain.Users;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDao userDao;

	@Override
	public Users userLoginCheck(Users users) {
		return userDao.userLoginCheck(users);
	}

	@Override
	public Permission userLoginPermission(Users loginUser) {
		return userDao.userLoginPermission(loginUser);
	}

	@Override
	public void userInsertInsert(Users users) {
		userDao.userInsertInsert(users);
	}

	@Override
	public void userPermissionUpdate(Permission permission) {
		userDao.userPermissionUpdate(permission);
	}

	@Override
	public List<Users> userPermissionUserSelect() {
		return userDao.userPermissionUserSelect();
	}

	@Override
	public List<Users> userInsertSelect() {
		return userDao.userInsertSelect();
	}

	@Override
	public Users userDuplicateCheck(Users users) {
		return userDao.userDuplicateCheck(users);
	}

	@Override
	public List<UserMenu> userLoginMenuList(UserMenu userMenu) {
		return userDao.userLoginMenuList(userMenu);
	}

	@Override
	public void userLoginMenuSave(UserMenu userMenu) {
		userDao.userLoginMenuSave(userMenu);
	}
	@Override
	public List<Facility> equipment_name_select(Facility facility) {
		return userDao.equipment_name_select(facility);
	}
	
	@Override
	public void userLoginMenuRemove(UserMenu userMenu) {
		userDao.userLoginMenuRemove(userMenu);
	}
	
	
	
	
	
	@Override
	public List<Users> getplanManageList(Users users) {
	     return userDao.getplanManageList(users); 	   
	}
	@Override
	public void insertplanManage(Users users) {
		userDao.insertplanManage(users); 	   
	}
	@Override
	public void delplanManage(Users users) {
		userDao.delplanManage(users); 	   
	}
}
