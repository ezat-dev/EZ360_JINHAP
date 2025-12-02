package com.geomet.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.geomet.domain.Machine;
import com.geomet.domain.Temp_data;
import com.geomet.domain.Work;
@Repository
public class MachineDaoImpl implements MachineDao{

	 @Resource(name="session")
	    private SqlSession sqlSession;
	 @Resource(name="orcleSession")
		private SqlSession sessionOrcle;
	 @Resource(name = "sessionMssqlJinhap")
	    private SqlSession sqlSessionMssqlJinhap;
	    
	 
	 
	 
    
	//정기점검 계획/실적
    @Override
    public List<Machine> getMachineList(Machine machine) {
      
        return sqlSession.selectList("machine.getMachineList", machine);
    }
    
    @Override
    public void updatecheckPlan(Machine machine) {
    	sqlSession.update("machine.updatecheckPlan",machine);
    }
    
	//통합모니터링
    @Override
    public List<Machine> getAllDataList(Machine machine) {
      
        return sqlSession.selectList("machine.getAllDataList", machine);
    }
    
	//비가동현황
    @Override
    public List<Machine> getNonTimeDataList(Machine machine) {
      
        return sqlSession.selectList("machine.getNonTimeDataList", machine);
    }
    
    @Override
    public void saveNonTime(Machine machine) {
           sqlSession.insert("machine.saveNonTime", machine);
    }
    @Override
    public void updateNonTime(Machine machine) {
           sqlSession.insert("machine.updateNonTime", machine);
    }
    @Override
    public void deleteNonTime(String non_time_idx) {
           sqlSession.delete("machine.deleteNonTime", non_time_idx);
    }
    @Override
    public List<Machine> getNonTimeDataView(Machine machine) {
      
        return sqlSession.selectList("machine.getNonTimeDataView", machine);
    }
    
    
    // 온도 데이터 조회
    @Override
    public List<Temp_data> getTempDataList(Temp_data temp) {
        return sqlSession.selectList("machine.getTempDataList", temp);
    }
    
    
    
    //설비카드
    @Override
    public List<Machine> getRepairStatusList(Machine machine) {
      
        return sqlSession.selectList("machine.getRepairStatusList", machine);
    }
    @Override
    public void insertRepairStatus(Machine machine) {
           sqlSession.insert("machine.insertRepairStatus", machine);
    }
    
    @Override
    public void delRepairStatus(Machine machine) {
           sqlSession.insert("machine.delRepairStatus", machine);
    }
    
    //설비카드
    @Override
    public List<Machine> getRepairStatusList_info(Machine machine) {
      
        return sqlSession.selectList("machine.getRepairStatusList_info", machine);
    }
    @Override
    public void insertRepairStatus_info(Machine machine) {
           sqlSession.insert("machine.insertRepairStatus_info", machine);
    }
    @Override
    public void updateRepairStatus_info(Machine machine) {
           sqlSession.insert("machine.updateRepairStatus_info", machine);
    }    
    @Override
    public void delRepairStatus_info(Machine machine) {
           sqlSession.insert("machine.delRepairStatus_info", machine);
    }
    
    
    
    
    
    //부품 교체 이력
    

    @Override
    public List<Machine> getPartStatusList(Machine machine) {
      
        return sqlSession.selectList("machine.getPartStatusList", machine);
    }
    @Override
    public void insertPartStatus(Machine machine) {
           sqlSession.insert("machine.insertPartStatus", machine);
    }
    
    @Override
    public void delPartStatus(Machine machine) {
           sqlSession.insert("machine.delPartStatus", machine);
    }
    
    //스페어 부품
    @Override
    public List<Machine> getspareStatusList(Machine machine) {
      
        return sqlSession.selectList("machine.getSpareStatusList", machine);
    }
    @Override
    public void insertspareStatus(Machine machine) {
           sqlSession.insert("machine.insertspareStatus", machine);
    }
    
    @Override
    public void delspareStatus(Machine machine) {
           sqlSession.insert("machine.delspareStatus", machine);
    }
    
    
    //공무일지
    @Override
    public List<Machine> getlogStatusList(Machine machine) {
      
        return sqlSession.selectList("machine.getlogStatusList", machine);
    }
    @Override
    public void insertlogStatus(Machine machine) {
           sqlSession.insert("machine.insertlogStatus", machine);
    }
    
    @Override
    public void dellogStatus(Machine machine) {
           sqlSession.insert("machine.dellogStatus", machine);
    }
    
    
    
    @Override
    public List<Machine> getErrDataList(Machine machine) {
      
        return sqlSession.selectList("machine.getErrDataList", machine);
    }
    
    
    
    @Override
    public List<Machine> getErrAlarmRanking(Machine machine) {
      
        return sqlSession.selectList("machine.getErrAlarmRanking", machine);
    }
    
    
    //설비 기준정보
    @Override
    public List<Machine> getFacilityList(Machine machine) {
      
        return sqlSession.selectList("machine.getFacilityList", machine);
    }
    @Override
    public void insertFacility(Machine machine) {
           sqlSession.insert("machine.insertFacility", machine);
    }
    
    @Override
    public void deleteFacility(Machine machine) {
           sqlSession.insert("machine.deleteFacility", machine);
    }
    
    
    
    //설비별 모니터링
    @Override
    public List<Machine> getdetailMonitoring(Machine machine) {
      
        return sqlSession.selectList("machine.getdetailMonitoring", machine);
    }
    
    
    @Override
    public List<Work> workReport1(Machine machine) {
        return sqlSession.selectList("machine.workReport1", machine);
    }
    @Override
    public List<Work> workReport2(Machine machine) {
        return sqlSessionMssqlJinhap.selectList("machine.workReport2_mmsql", machine);
    }
    
    @Override
    public List<Work> workReport3(Machine machine) {
        return sqlSession.selectList("machine.workReport3", machine);
    }
    
    
    @Override
    public List<Work> workReport2_nonTime(Machine machine) {
        return sqlSessionMssqlJinhap.selectList("machine.workReport2_nontime_mmsql", machine);
    }
}
