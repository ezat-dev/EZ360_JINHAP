package com.geomet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geomet.dao.UserDao;
import com.geomet.domain.Facility;
import com.geomet.domain.Permission;
import com.geomet.domain.UserLog;
import com.geomet.domain.UserMenu;
import com.geomet.domain.Users;


@Service
public class UserServiceImpl implements UserService {

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
    public List<Users> userInsertSelect(Users users) {
        return userDao.userInsertSelect(users);
    }

    @Override
    public void userInsertDel(Users users) {
        userDao.userInsertInsert(users);
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

    @Override
    public List<Users> getUserInfo() {
        return userDao.getUserInfo();
    }

    @Override
    public List<Users> getWork_team_select(Users users) {
        return userDao.getWork_team_select(users);
    }

    @Override
    public List<Users> getWork_schedule_select(Users users) {
        return userDao.getWork_schedule_select(users);
    }

    @Override
    public void work_handover_update(Users users) {
        userDao.work_handover_update(users);
    }

    @Override
    public List<Users> work_handover_select(Users users) {
        return userDao.work_handover_select(users);
    }

    @Override
    public void work_team_update(Users users) {
        userDao.work_team_update(users);
    }

    @Override
    public void work_schedule_update(Users users) {
        userDao.work_schedule_update(users);
    }

    @Override
    public List<Users> getCleanCar(Users users) {
        return userDao.getCleanCar(users);
    }

    @Override
    public List<Users> getForkCar(Users users) {
        return userDao.getForkCar(users);
    }

    @Override
    public void insertForkCar(Users users) {
        userDao.insertForkCar(users);
    }

    @Override
    public void insertCleanCar(Users users) {
        userDao.insertCleanCar(users);
    }

    @Override
    public List<Users> standardDocList(Users users) {
        return userDao.standardDocList(users);
    }

    @Override
    public void standardDocSaves(Users users) {
        userDao.standardDocSaves(users);
    }

    @Override
    public void standardDocDel(Users users) {
        userDao.standardDocDel(users);
    }

    @Override
    public List<Users> getCheckManageList(Users users) {
        return userDao.getCheckManageList(users);
    }

    @Override
    public void updateCheckManage(Users users) {
        userDao.updateCheckManage(users);
    }
    
    
    @Override
    public void insertUserLog(UserLog userLog) {
        userDao.insertUserLog(userLog);
    }
    
	@Override
	public boolean allNo(Users users) {
		return userDao.allNo(users);
	}
	
	@Override
	public boolean allNull(Users users) {
		return userDao.allNull(users);
	}

	@Override
	public boolean deleteUser(Users users) {
		return userDao.deleteUser(users);
	}
	
	@Override
	public boolean allR(Users users) {
		return userDao.allR(users);
	}
}
