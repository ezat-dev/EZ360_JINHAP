package com.jinhap.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jinhap.domain.Permission;
import com.jinhap.domain.Users;
@Repository
public class ManagementDaoImpl implements ManagementDao {
	 @Autowired
	 private SqlSession sqlSession;

	 @Override
	 public List<Users> getUserList() {
		 return sqlSession.selectList("users.getUserList");
	 }
	 
	 @Override
	 public List<Users> getBigPageList() {
		 return sqlSession.selectList("users.getBigPageList");
	 }
	 
	 @Override
	 public List<Users> getSmallPageList(String page_big) {  
		 return sqlSession.selectList("users.getSmallPageList", page_big);  
	 }
	 
	 @Override
	 public Permission authorityUserSelect(Permission permission) {
		 return sqlSession.selectOne("users.authorityUserSelect",permission);
	 }

	@Override
	public void authorityUserSelectSave(Permission permission) {
		sqlSession.update("users.authorityUserSelectSave", permission);
	}

}

