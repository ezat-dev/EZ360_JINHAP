package com.geomet.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.geomet.domain.Machine;
@Repository
public class MachineDaoImpl implements MachineDao{

    @Autowired 
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
    
}
