package com.geomet.service;

import java.util.List;

import com.geomet.domain.Facility;
import com.geomet.domain.Permission;
import com.geomet.domain.UserLog;
import com.geomet.domain.UserMenu;
import com.geomet.domain.Users;

public interface UserService {

	Users userLoginCheck(Users users);

	Permission userLoginPermission(Users loginUser);

	void userInsertInsert(Users users);

	void userPermissionUpdate(Permission permission);

	List<Users> userPermissionUserSelect();

	List<Users> userInsertSelect(Users users);
	void userInsertDel(Users users);
	Users userDuplicateCheck(Users users);

	List<UserMenu> userLoginMenuList(UserMenu userMenu);

	void userLoginMenuSave(UserMenu userMenu);

	
	List<Facility> equipment_name_select(Facility facility);

	void userLoginMenuRemove(UserMenu userMenu);
	
	//자격인증관리
	List<Users> getplanManageList(Users users);
	void insertplanManage(Users users); 
	void delplanManage(Users users);
	
	
	
	List<Users> getWork_team_select(Users users);
	List<Users> getWork_schedule_select(Users users);

	void work_handover_update(Users users); 
	List<Users> work_handover_select(Users users);
	
	void work_team_update(Users users); 
	
	void work_schedule_update(Users users); 
	
	List<Users> getUserInfo(); 
	
	
	List<Users> getCleanCar(Users users);
	List<Users> getForkCar(Users users);
	void insertForkCar(Users users); 
	void insertCleanCar(Users users); 
	
	  
	

	List<Users> standardDocList(Users users); 
    
    void standardDocSaves(Users users);
    
    void standardDocDel(Users users);
    
    
    List<Users> getCheckManageList(Users users); 
    
    void updateCheckManage(Users users);
    
    
    
    void insertUserLog(UserLog userLog);
    
    boolean allNo(Users users);
    
    boolean allNull(Users users);
    
    boolean deleteUser(Users users);
}
