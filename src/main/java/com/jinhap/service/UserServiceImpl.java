package com.jinhap.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jinhap.dao.UserDao;
import com.jinhap.domain.Permission;
import com.jinhap.domain.Users;

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

}
