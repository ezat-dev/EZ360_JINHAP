package com.geomet.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.geomet.domain.Machine;
import com.geomet.domain.Work;

@Repository
public class WorkDaoImpl implements WorkDao {

    @Resource(name = "session")
    private SqlSession sqlSession;


    @Resource(name = "sessionMssqlJinhap")
    private SqlSession sqlSessionMssqlJinhap;
    
    
	 @Resource(name="orcleSession")
		private SqlSession sessionOrcle;
    
    
    @Override
    public List<Work> getInventoryStatusList(Work work) {
        return sqlSession.selectList("work.getInventoryStatusList", work);
    }
    @Override
    public void insertinventoryStatus(Work work) {
           sqlSession.insert("work.insertinventoryStatus", work);
    }
    @Override
    public boolean inventoryStatusUpdate(Work work) {
       int result = sqlSession.update("work.inventoryStatusUpdate", work);
       if(result <= 0) {
          return false;
       }
       return true;
    }
    
    @Override
    public List<Work> getMachineEfficStatusList(Work work) {
        return sqlSession.selectList("work.getMachineEfficStatusList", work);
    }
    
    
    // 작업일보
    @Override
    public List<Work> getWorkDailyList(Work work) {
        return sqlSession.selectList("work.getWorkDailyList", work);
    }
    
    
    
    @Override
    public List<Work> list_condition(Work work) {
        return sqlSession.selectList("work.list_condition", work);
    }


    // 작업일보 
    @Override
    public List<Work> getWorkDailySum(Work work) {
        return sqlSession.selectList("work.getWorkDailySum", work);
    }

    // 작업일보 
    @Override
    public List<Work> getReportInputLIst(Work work) {
        return sqlSession.selectList("work.getReportInputLIst", work);
    }
    
    @Override
    public void insertReportInput(Work work) {
           sqlSession.insert("work.insertReportInput", work);
    }
    
    @Override
    public void deleteReportInput(Work work) {
           sqlSession.insert("work.deleteReportInput", work);
    }
    
    // 작업일보 
    @Override
    public List<Work> MonitoringStatusList(Work work) {
        return sqlSession.selectList("work.MonitoringStatusList", work);
    }

    // 작업일보 
    @Override
    public List<Work> MonitoringStatusList2(Work work) {
        return sqlSession.selectList("work.MonitoringStatusList2", work);
    }
    
    
    // 생산조건 모니터링
    @Override
    public List<Work> getInputControlStatusUp(Work work) {
        return sqlSession.selectList("work.getInputControlStatusUp", work);
    }
    
    
  
    @Override
    public List<Work> getInputControlStatusDown(Work work) {
    	 return sqlSessionMssqlJinhap.selectList("work.getInputControlStatusDown", work);
    }
    
    @Override
    public List<Work> machineRealStatusDown(Work work) {
    	 return sessionOrcle.selectList("work.machineRealStatusDown", work);
    }
    
    @Override
    public List<Work> machineRealStatusUp(Work work) {
    	 return sessionOrcle.selectList("work.machineRealStatusUp", work);
    }
    
    
    @Override
    public List<Work> lotReportStatusList(Work work) {
    	 return sqlSession.selectList("work.lotReportStatusList", work);
    }
    
    @Override
    public List<Work> monitoringStatusList(Work work) {
    	 return sqlSession.selectList("work.monitoringStatusList", work);
    }
}
