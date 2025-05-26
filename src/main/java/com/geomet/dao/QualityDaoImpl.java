package com.geomet.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.geomet.domain.Quality;

@Repository
public class QualityDaoImpl implements QualityDao {
   
	 @Resource(name="session")
	    private SqlSession sqlSession;
	
    //부적합품
    @Override
    public List<Quality> getNonProductManageList(Quality params) {
      
        return sqlSession.selectList("quality.getNonProductManageList", params);
    }
    @Override
    public void saveNonProductManage(Quality quality) {
    	sqlSession.insert("quality.saveNonProductManage",quality);
    }
    
    @Override
    public void delNonProductManage(Quality quality) {
    	sqlSession.delete("quality.delNonProductManage",quality);
    }
    
    
    
    @Override
    public List<Quality> getqualityList(Quality quality) {
      
        return sqlSession.selectList("quality.getqualityList", quality);
    }
    @Override
    public void savetusTest(Quality quality) {
    	sqlSession.insert("quality.savetusTest",quality);
    }
    
    @Override
    public void deltusTest(Quality quality) {
    	sqlSession.delete("quality.deltusTest",quality);
    }
}
