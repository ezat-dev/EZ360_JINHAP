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
}
