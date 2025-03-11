package com.jinhap.dao;

import java.util.List;

import com.jinhap.domain.Permission;
import com.jinhap.domain.Users;

public interface UserDao {

	Users userLoginCheck(Users users);

	Permission userLoginPermission(Users loginUser);

	void userInsertInsert(Users users);

	void userPermissionUpdate(Permission permission);

	List<Users> userPermissionUserSelect();

	List<Users> userInsertSelect();

	Users userDuplicateCheck(Users users);


}
