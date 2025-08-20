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
	//수입검사 조회
	@Override
	public List<Quality> getIncomingTestList(Quality quality) {

		return sqlSession.selectList("quality.getIncomingTestList", quality);
	}
	//수입검사 추가
	@Override
	public boolean insertIncomingTest(Quality quality) {
		int result = sqlSession.insert("quality.insertIncoming", quality);
		if(result <= 0) {
			return false;
		}
		return true;
	}
	//수입검사 삭제
	@Override
	public boolean deleteIncoming(Quality quality) {
		int result = sqlSession.delete("quality.deleteIncoming", quality);
		if(result <= 0) {
			return false;
		}
		return true;
	}
	//수입삭제 수정
	@Override
	public boolean updateIncoming(Quality quality) {
		int result = sqlSession.update("quality.updateIncoming", quality);
		if(result <= 0) {
			return false;
		}
		return true;
	}
	
	//수입검사 하나 조회
	public Quality getIncomingTest(Quality quality) {
		return sqlSession.selectOne("quality.getIncomingTest", quality);
	}
	
	
    //기준정보
    @Override
    public List<Quality> getTest_infoList(Quality params) {
      
        return sqlSession.selectList("quality.getTest_infoList", params);
    }
    
    @Override
    public void saveTest_infoList(Quality quality) {
    	sqlSession.insert("quality.saveTest_infoList",quality);
    }
    
    @Override
    public void delTest_infoList(Quality quality) {
    	sqlSession.delete("quality.delTest_infoList",quality);
    }
    
    //약품투입 기준자료
	@Override
	public List<Quality> getMedicineList1(Quality quality) {
		return sqlSession.selectList("quality.getMedicineList1", quality);
	}
	@Override
	public List<Quality> getMedicineList2(Quality quality) {
		return sqlSession.selectList("quality.getMedicineList2", quality);
	}
	@Override
	public boolean updateMedicineStandard(Quality quality) {
		int result = sqlSession.insert("quality.updateMedicineStandard", quality);
		if(result <= 0) {
			return false;
		}
		return true;
	}
}

