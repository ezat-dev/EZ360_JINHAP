package com.jinhap.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jinhap.domain.Permission;
import com.jinhap.domain.Users;

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
	public List<Users> userPermissionUserSelect() {
		return sqlSession.selectList("users.userPermissionUserSelect");
	}

	@Override
	public List<Users> userInsertSelect() {
		return sqlSession.selectList("users.userInsertSelect");
	}

	@Override
	public Users userDuplicateCheck(Users users) {
		return sqlSession.selectOne("users.userDuplicateCheck",users);
	}


}
