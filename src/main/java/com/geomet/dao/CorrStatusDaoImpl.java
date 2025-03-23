package com.geomet.dao;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.geomet.domain.CorrStatus;



@Repository
public class CorrStatusDaoImpl implements CorrStatusDao{
	@Resource(name="session")
	private SqlSession sqlSession;
	
	@Override
	public void saveCorrStatus(CorrStatus corrStatus) {
		sqlSession.insert("corrStatus.saveCorrStatus",corrStatus);
	}
}
