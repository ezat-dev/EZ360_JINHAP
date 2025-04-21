package com.geomet.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.geomet.domain.Condition;
import com.geomet.domain.CorrStatus;

import java.util.List;

import javax.annotation.Resource;

@Repository 
public class ConditionDaoImpl implements ConditionDao {

	 @Resource(name="session")
	    private SqlSession sqlSession;
    
    
    //기준정보
    @Override
    public List<Condition> getStandardInfoList(Condition params) {
      
        return sqlSession.selectList("condition.getStandardInfoList", params);
    }
    
    @Override
    public void saveDivisionWeight(Condition condition) {
    	sqlSession.insert("condition.saveDivisionWeight",condition);
    }
    
    @Override
    public void delDivisionWeight(Condition condition) {
    	sqlSession.delete("condition.delDivisionWeight",condition);
    }
    
    //TC조절
    @Override
    public List<Condition> getCorrStatusList(Condition params) {
      
        return sqlSession.selectList("condition.getCorrStatusList", params);
    }
    
    @Override
    public void delCorrStatus(Condition condition) {
    	sqlSession.delete("condition.delCorrStatus",condition);
    }
    
	@Override
	public void saveCorrStatus(Condition condition) {
		sqlSession.update("condition.saveCorrStatus",condition);
	}
	
	//조건관리
	@Override
	public List<Condition> getconditionList(Condition condition) {
		return sqlSession.selectList("condition.getconditionList",condition);
	}
}
