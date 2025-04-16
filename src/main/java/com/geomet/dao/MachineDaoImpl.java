package com.geomet.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.geomet.domain.Machine;
import com.geomet.domain.Temp_data;
@Repository
public class MachineDaoImpl implements MachineDao{

	 @Resource(name="session")
	    private SqlSession sqlSession;
	
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
    
    // 온도 데이터 조회
    @Override
    public List<Temp_data> getTempDataList(Temp_data temp) {
        return sqlSession.selectList("machine.getTempDataList", temp);
    }
    
}
