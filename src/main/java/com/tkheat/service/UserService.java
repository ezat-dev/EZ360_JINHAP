package com.tkheat.service;

import java.util.List;

import com.tkheat.domain.Users;

public interface UserService {

	Users userMenuSelectCount(Users users);

	List<Users> usersMenuOkSelect(Users users);

	void userMenuDelete(Users users);

	void userMenuClick(Users users);

	Users getLoginUser(Users users);

	//메뉴를 선택했을 때 사용자가 선택한 메뉴를 이름, 링크로 분리해서 보여주는 메서드
	public List<Users> menuList(Users users);	
	
}
