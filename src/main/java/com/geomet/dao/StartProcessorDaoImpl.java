package com.geomet.dao;

import com.geomet.domain.Temp_data;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StartProcessorDaoImpl implements StartProcessorDao {

    
    
	@Resource(name = "session")
    private SqlSession sqlSession;
    

    @Resource(name = "sessionMssql")
    private SqlSession mssqlSqlSession;

    
    @Override
    public List<Map<String, Object>> getLatestTempSamples(Temp_data temp_data) {
        return mssqlSqlSession.selectList("temp.getMachineList", temp_data);
    }

    @Override
    public void insertTempData(Temp_data tempData) {
    	

        sqlSession.insert("temp.insertTempData", tempData);
    }
}
