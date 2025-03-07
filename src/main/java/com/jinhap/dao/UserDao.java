package com.jinhap.dao;

import java.util.List;

import com.jinhap.domain.Users;

public interface UserDao {

	Users userMenuSelectCount(Users users);

	List<Users> usersMenuOkSelect(Users users);

	void userMenuDelete(Users users);

	void userMenuClick(Users users);

	Users getLoginUser(Users users);

}
