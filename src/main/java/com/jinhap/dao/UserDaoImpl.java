package com.jinhap.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jinhap.domain.Users;

@Repository
public class UserDaoImpl implements UserDao{

	@Resource(name="session")
	private SqlSession sqlSession;
	
	@Override
	public Users userMenuSelectCount(Users users) {
		return sqlSession.selectOne("users.userMenuSelectCount",users);
	}

	@Override
	public List<Users> usersMenuOkSelect(Users users) {
		return sqlSession.selectList("users.usersMenuOkSelect",users);
	}

	@Override
	public void userMenuDelete(Users users) {
		sqlSession.delete("users.userMenuDelete", users);
	}

	@Override
	public void userMenuClick(Users users) {
		sqlSession.insert("users.userMenuClick", users);
	}

	@Override
	public Users getLoginUser(Users users) {
		return sqlSession.selectOne("users.getLoginUser", users);
	}

}
