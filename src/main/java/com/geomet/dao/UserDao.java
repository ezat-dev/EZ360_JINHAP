package com.geomet.dao;

import java.util.List;

import com.geomet.domain.Facility;
import com.geomet.domain.Permission;
import com.geomet.domain.UserMenu;
import com.geomet.domain.Users;

public interface UserDao {

	Users userLoginCheck(Users users);

	Permission userLoginPermission(Users loginUser);

	void userInsertInsert(Users users);

	void userPermissionUpdate(Permission permission);

	List<Users> userPermissionUserSelect();

	List<Users> userInsertSelect();

	Users userDuplicateCheck(Users users);

	List<UserMenu> userLoginMenuList(UserMenu userMenu);

	void userLoginMenuSave(UserMenu userMenu);
	
	List<Facility> equipment_name_select(Facility facility);

	void userLoginMenuRemove(UserMenu userMenu);


}
