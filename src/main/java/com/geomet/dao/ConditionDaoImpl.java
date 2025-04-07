package com.geomet.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.geomet.domain.Condition;


import java.util.List;

@Repository 
public class ConditionDaoImpl implements ConditionDao {

    @Autowired 
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
}
