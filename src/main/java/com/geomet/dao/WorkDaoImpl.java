package com.geomet.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.geomet.domain.Work;

@Repository
public class WorkDaoImpl implements WorkDao {

    @Resource(name = "session")
    private SqlSession sqlSession;

    @Override
    public List<Work> getInventoryStatusList(Work work) {
        return sqlSession.selectList("work.getInventoryStatusList", work);
    }
}
