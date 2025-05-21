package com.geomet.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.geomet.domain.Facility;
import com.geomet.domain.Permission;
import com.geomet.domain.UserMenu;
import com.geomet.domain.Users;

@Repository
public class UserDaoImpl implements UserDao{

	 @Resource(name="session")
	    private SqlSession sqlSession;
	
	@Override
	public Users userLoginCheck(Users users) {
		return sqlSession.selectOne("users.userLoginCheck", users);
	}

	@Override
	public Permission userLoginPermission(Users loginUser) {
		return sqlSession.selectOne("users.userLoginPermission", loginUser);
	}

	@Override
	public void userInsertInsert(Users users) {
		sqlSession.insert("users.userInsertInsert",users);
	}

	@Override
	public void userPermissionUpdate(Permission permission) {
		sqlSession.update("users.userPermissionUpdate",permission);
	}
    @Override
    public void userInsertDel(Users users) {
        sqlSession.update("users.userInsertDel", users);
    }
	@Override
	public List<Users> userPermissionUserSelect() {
		return sqlSession.selectList("users.userPermissionUserSelect");
	}

	@Override
	public List<Users> userInsertSelect(Users users) {
		return sqlSession.selectList("users.userInsertSelect",users);
	}

	@Override
	public Users userDuplicateCheck(Users users) {
		return sqlSession.selectOne("users.userDuplicateCheck",users);
	}

	@Override
	public List<UserMenu> userLoginMenuList(UserMenu userMenu) {
		
		//4. 해당 유저의 메뉴리스트 조회		
		List<UserMenu> userMenuList = sqlSession.selectList("users.userMenuList",userMenu);
		
		return userMenuList;
	}

	@Override
	public void userLoginMenuSave(UserMenu userMenu) {

		int menuValue = 0;
		String checkValue = "";
		
		//1. 해당 유저의 메뉴카운트가 10개인지		
		menuValue = sqlSession.selectOne("users.userMenuCount",userMenu);
		//2. 해당 유저에 선택한 메뉴가 Y이면서 있는지
		checkValue = sqlSession.selectOne("users.userMenuCheck",userMenu);
		//3. 1,2번 둘다 해당안될경우 저장
		if(menuValue < 10) {
			if(checkValue == null) {
				sqlSession.insert("users.userLoginMenuSave",userMenu);				
			}else if("N".equals(checkValue)) {
				sqlSession.update("users.userLoginMenuUpdate",userMenu);
			}
		}
	}


	@Override
	public List<Facility> equipment_name_select(Facility facility) {
		return sqlSession.selectList("users.equipment_name_select",facility);
	}
	
	
	@Override
	public void userLoginMenuRemove(UserMenu userMenu) {
		sqlSession.update("users.userLoginMenuRemove",userMenu);
	}
	
	
	
	
	
	
	
	
	
	  //공무일지
	  @Override
	  public List<Users> getplanManageList(Users users) {
	    
	      return sqlSession.selectList("users.getplanManageList", users);
	  }
	  @Override
	  public void insertplanManage(Users users) {
	         sqlSession.insert("users.insertplanManage", users);
	  }
	  
	  @Override
	  public void delplanManage(Users users) {
	         sqlSession.insert("users.delplanManage", users);
	  }
	  
	  
	  
	  
	  @Override
	    public List<Users> getUserInfo() {
	        return sqlSession.selectList("users.getUserInfo");
	    }
	  
		@Override
		public List<Users> getWork_team_select(Users users) {
			return sqlSession.selectList("users.getWork_team_select", users);
		}
		
		@Override
		public List<Users> getWork_schedule_select(Users users) {
			return sqlSession.selectList("users.getWork_schedule_select", users);
		}
		
		  @Override
		  public void work_handover_update(Users users) {
		         sqlSession.insert("users.work_team_update", users);
		  }
		  @Override
		  public void work_team_update(Users users) {
		         sqlSession.insert("users.work_team_update", users);
		  }
}
