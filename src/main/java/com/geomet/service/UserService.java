package com.geomet.service;

import java.util.List;

import com.geomet.domain.Permission;
import com.geomet.domain.UserMenu;
import com.geomet.domain.Users;

public interface UserService {

	Users userLoginCheck(Users users);

	Permission userLoginPermission(Users loginUser);

	void userInsertInsert(Users users);

	void userPermissionUpdate(Permission permission);

	List<Users> userPermissionUserSelect();

	List<Users> userInsertSelect();

	Users userDuplicateCheck(Users users);

	List<UserMenu> userLoginMenuList(UserMenu userMenu);

	void userLoginMenuSave(UserMenu userMenu);

	
}
