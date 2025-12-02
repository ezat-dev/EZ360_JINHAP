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
	
	//테스트 관리대장
	@Override
	public List<Quality> getTestManageList(Quality quality) {
		return sqlSession.selectList("quality.getTestManageList", quality);
	}
	@Override
	public boolean updateTestManage(Quality quality) {
		int result = sqlSession.insert("quality.updateTestManage", quality);
		if(result <= 0) {
			return false;
		}
		return true;
	}
	
	//테스트/시험정보
	@Override
	public Boolean testTankInsert(Quality quality) {
		int result = sqlSession.insert("quality.testTankInsert", quality);
		if(result <= 0) {
			return false;
		}
		return true;
	}
	@Override
	public List<Quality> getTestTankList(Quality quality) {
		return sqlSession.selectList("quality.getTestTankList", quality);
	}
	@Override
	public boolean testTankDelete(Quality quality) {
		int result = sqlSession.delete("quality.testTankDelete", quality);
		if(result <= 0) {
			return false;
		}
		return true;
	}
	@Override
	public List<Quality> getDataList1(Quality quality) {
		return sqlSession.selectList("quality.getDataList1", quality);
	}
	@Override
	public boolean data1Insert(Quality quality) {
		int result = sqlSession.insert("quality.data1Insert", quality);
		if(result <= 0) {
			return false;
		}
		return true;
	}
	@Override
	public boolean data1Delete(Quality quality) {
		int result = sqlSession.delete("quality.data1Delete", quality);
		if(result <= 0) {
			return false;
		}
		return true;
	}
	
	//액분석관리
	@Override
	public List<Quality> getLiquidAnalyze(Quality quality) {
		return sqlSession.selectList("quality.getLiquidAnalyze", quality);
	}
	@Override
	public boolean liquidAnalyzeInsert(Quality quality) {
		int result = sqlSession.insert("quality.liquidAnalyzeInsert", quality);
		if(result <= 0) {
			return false;
		}
		return true;
	}
	@Override
	public boolean deleteLiquidAnalyze(Quality quality) {
		int result = sqlSession.insert("quality.deleteLiquidAnalyze", quality);
		if(result <= 0) {
			return false;
		}
		return true;
	}
	@Override
	public boolean liquidAnalyzeInsertNv(Quality quality) {
		int result = sqlSession.insert("quality.liquidAnalyzeInsertNv", quality);
		if(result <= 0) {
			return false;
		}
		return true;
	}
	@Override
	public boolean liquidAnalyzeInsertAsh(Quality quality) {
		int result = sqlSession.insert("quality.liquidAnalyzeInsertAsh", quality);
		if(result <= 0) {
			return false;
		}
		return true;
	}
	@Override
	public List<Quality> getKccList(Quality quality) {
		return sqlSession.selectList("quality.getKccList", quality);
	}
	@Override
	public boolean updateKcc(Quality quality) {
		int result = sqlSession.update("quality.updateKcc", quality);
		if(result <= 0) {
			return false;
		}
		return true;
	}
	@Override
	public boolean insertCct(Quality quality) {
		int result = sqlSession.insert("quality.insertCct", quality);
		if(result <= 0) {
			return false;
		}
		return true;
	}
	@Override
	public List<Quality> getCctList(Quality quality) {
		return sqlSession.selectList("quality.getCctList", quality);
	}
	@Override
	public boolean deleteCct(Quality quality) {
		int result = sqlSession.delete("quality.deleteCct", quality);
		if(result <= 0) {
			return false;
		}
		return true;
	}
	@Override
	public List<Quality> getSstList(Quality quality) {
		return sqlSession.selectList("quality.getSstList", quality);
	}
	@Override
	public boolean insertSst(Quality quality) {
		int result = sqlSession.insert("quality.insertSst", quality);
		if(result <= 0) {
			return false;
		}
		return true;
	}
	@Override
	public boolean deleteSst(Quality quality) {
		int result = sqlSession.delete("quality.deleteSst", quality);
		if(result <= 0) {
			return false;
		}
		return true;
	}
	@Override
	public boolean insertAttachment(Quality quality) {
		int result = sqlSession.insert("quality.insertAttachment", quality);
		if(result <= 0) {
			return false;
		}
		return true;
	}
	@Override
	public List<Quality> attachmentList(Quality quality) {
		return sqlSession.selectList("quality.attachmentList", quality);
	}
	@Override
	public List<Quality> turbidityList(Quality quality) {
		return sqlSession.selectList("quality.turbidityList", quality);
	}
	@Override
	public boolean deleteAttachment(Quality quality) {
		int result = sqlSession.delete("quality.deleteAttachment", quality);
		if(result <= 0) {
			return false;
		}
		return true;
	}
}

