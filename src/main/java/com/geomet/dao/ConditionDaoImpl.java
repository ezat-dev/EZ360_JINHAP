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
	 
	 
	 @Resource(name="orcleSession")
		private SqlSession sessionOrcle;
	 
	 @Resource(name = "sessionMssqlJinhap")
	    private SqlSession sqlSessionMssqlJinhap;
	    
	    
    
    //기준정보
    @Override
    public List<Condition> getStandardInfoList(Condition params) {
      
        return sessionOrcle.selectList("condition.getStandardInfoList", params);
    }
    
    @Override
    public void saveDivisionWeight(Condition condition) {
    	sessionOrcle.insert("condition.saveDivisionWeight",condition);
    }
    
    @Override
    public void delDivisionWeight(Condition condition) {
    	sessionOrcle.delete("condition.delDivisionWeight",condition);
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
	@Override
	public void machinePartTempUpdate(Condition condition) {
		sqlSession.update("condition.machinePartTempUpdate",condition);
	}
	
	
	//액교반
	@Override
	public List<Condition> getMachineliquidmanage(Condition condition) {
		return sqlSession.selectList("condition.getMachineliquidmanage",condition);
	}
	@Override
	public void insertMachineliquidmanage(Condition condition) {
		sqlSession.update("condition.insertMachineliquidmanage",condition);
	}
	//액교반
		@Override
		public List<Condition> getMachineliquidmanage2(Condition condition) {
			return sqlSession.selectList("condition.getMachineliquidmanage2",condition);
		}
		@Override
		public void insertMachineliquidmanage2(Condition condition) {
			sqlSession.update("condition.insertMachineliquidmanage2",condition);
		}
		
		@Override
		public void deleteMachineliquidmanage(Condition condition) {
			sqlSession.update("condition.deleteMachineliquidmanage",condition);
		}
		@Override
		public void deleteMachineliquidmanage2(Condition condition) {
			sqlSession.update("condition.deleteMachineliquidmanage2",condition);
		}
		
		
		//조건관리
		@Override
		public List<Condition> divisionWashingList(Condition condition) {
			return sessionOrcle.selectList("condition.divisionWashingList",condition);
		}
		@Override
		public void divisionWashingUpdate(Condition condition) {
			sessionOrcle.update("condition.divisionWashingUpdate",condition);
		}
		
		@Override
		public void divisionWashingLog(Condition condition) {
			sqlSession.insert("users.divisionWashingLog",condition);
		}
		@Override
		public List<Condition> divisionWashingLogList(Condition condition) {
			return sqlSession.selectList("condition.divisionWashingLogList",condition);
		}
		
		
		@Override
		public List<Condition> dailyCheckList(Condition condition) {
			return sqlSessionMssqlJinhap.selectList("condition.dailyCheckList",condition);
		}
}
