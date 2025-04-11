package com.geomet.dao;

import com.geomet.domain.Temp_data;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StartProcessorDaoImpl implements StartProcessorDao {

    // MyBatis SqlSession을 직접 사용할 수도 있으나,
    // 여기서는 TempMapper를 통한 호출로 구현합니다.
    
    @Autowired
    private SqlSession sqlSession;
    
    @Override
    public List<Map<String, Object>> getLatestTempSamples(Temp_data temp_data) {
     
        return sqlSession.selectList("temp.getMachineList", temp_data);
    }

    @Override
    public void insertTempData(Temp_data tempData) {
    	

        sqlSession.insert("temp.insertTempData", tempData);
    }
}
