package com.geomet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geomet.dao.QualityDao;

import com.geomet.domain.Quality;

@Service 
public class QualityServiceImpl implements QualityService {
	
	@Autowired  
	private QualityDao qualityDao;
	
	
	//부적합품 관리
	@Override
	public List<Quality> getNonProductManageList(Quality params) {
	    return qualityDao.getNonProductManageList(params); 	   
	}
	@Override
    public void saveNonProductManage(Quality quality) {
		qualityDao.saveNonProductManage(quality);
    }
	@Override
    public void delNonProductManage(Quality quality) {
		qualityDao.delNonProductManage(quality);
    }
	@Override
	public void updateNonProductManage(Quality quality) {
		qualityDao.updateNonProductManage(quality);
	}
	//부적합품 관리
	@Override
	public List<Quality> getqualityList(Quality quality) {
	    return qualityDao.getqualityList(quality); 	   
	}
	@Override
    public void savetusTest(Quality quality) {
		qualityDao.savetusTest(quality);
    }
	@Override
    public void deltusTest(Quality quality) {
		qualityDao.deltusTest(quality);
    }
	//수입검사 조회
	@Override
	public List<Quality> getIncomingTestList(Quality quality) {
		return qualityDao.getIncomingTestList(quality);
	}
	//수입검사 추가
	@Override
	public boolean insertIncoming(Quality quality) {
		return qualityDao.insertIncomingTest(quality);
	}
	//수입검사 삭제
	@Override
	public boolean deleteIncoming(Quality quality) {
		return qualityDao.deleteIncoming(quality);
	}
	//수입삭제 수정
	@Override
	public boolean updateIncoming(Quality quality) {
		return qualityDao.updateIncoming(quality);
	}
	@Override
	public Quality getIncomingTest(Quality quality) {
		return qualityDao.getIncomingTest(quality);
	}
	// 양상품
	@Override
	public List<Quality> getTest_infoList(Quality params) {
		return qualityDao.getTest_infoList(params);
	}

	@Override
	public void saveTest_infoList(Quality quality) {
		qualityDao.saveTest_infoList(quality);
	}

	@Override
	public void delTest_infoList(Quality quality) {
	     qualityDao.delTest_infoList(quality); 
	}
	
	//약품투입 기준자료
	@Override
	public List<Quality> getMedicineList1(Quality quality) {
		return qualityDao.getMedicineList1(quality);
	}
	@Override
	public List<Quality> getMedicineList2(Quality quality) {
		return qualityDao.getMedicineList2(quality);
	}
	@Override
	public boolean updateMedicineStandard(Quality quality) {
		return qualityDao.updateMedicineStandard(quality);
	}
	//테스트 관리대장
	@Override
	public List<Quality> getTestManageList(Quality quality) {
		return qualityDao.getTestManageList(quality);
	}
	@Override
	public boolean updateTestManage(Quality quality) {
		return qualityDao.updateTestManage(quality);
	}
	
	@Override
	public Boolean testTankInsert(Quality quality) {
		return qualityDao.testTankInsert(quality);
	}
	@Override
	public List<Quality> getTestTankList(Quality quality) {
		return qualityDao.getTestTankList(quality);
	}
	@Override
	public boolean testTankDelete(Quality quality) {
		return qualityDao.testTankDelete(quality);
	}
	@Override
	public List<Quality> getDataList1(Quality quality) {
		return qualityDao.getDataList1(quality);
	}
	@Override
	public boolean data1Insert(Quality quality) {
		return qualityDao.data1Insert(quality);
	}
	@Override
	public boolean data1Delete(Quality quality) {
		return qualityDao.data1Delete(quality);
	}

	@Override
	public List<Quality> getLiquidAnalyze(Quality quality) {
		return qualityDao.getLiquidAnalyze(quality);
	}
	@Override
	public boolean liquidAnalyzeInsert(Quality quality) {
		return qualityDao.liquidAnalyzeInsert(quality);
	}
	@Override
	public boolean deleteLiquidAnalyze(Quality quality) {
		return qualityDao.deleteLiquidAnalyze(quality);
	}
	@Override
	public boolean liquidAnalyzeInsertNv(Quality quality) {
		return qualityDao.liquidAnalyzeInsertNv(quality);
	}
	@Override
	public boolean liquidAnalyzeInsertAsh(Quality quality) {
		return qualityDao.liquidAnalyzeInsertAsh(quality);
	}
	@Override
	public List<Quality> getKccList(Quality quality) {
		return qualityDao.getKccList(quality);
	}
	@Override
	public boolean updateKcc(Quality quality) {
		return qualityDao.updateKcc(quality);
	}
	@Override
	public boolean insertCct(Quality quality) {
		return qualityDao.insertCct(quality);
	}
	@Override
	public List<Quality> getCctList(Quality quality) {
		return qualityDao.getCctList(quality);
	}
	@Override
	public boolean deleteCct(Quality quality) {
		return qualityDao.deleteCct(quality);
	}
	@Override
	public List<Quality> getSstList(Quality quality) {
		return qualityDao.getSstList(quality);
	}
	@Override
	public boolean insertSst(Quality quality) {
		return qualityDao.insertSst(quality);
	}
	@Override
	public boolean deleteSst(Quality quality) {
		return qualityDao.deleteSst(quality);
	}
	@Override
	public boolean insertAttachment(Quality quality) {
		return qualityDao.insertAttachment(quality);
	}
	@Override
	public List<Quality> attachmentList(Quality quality) {
		return qualityDao.attachmentList(quality);
	}
	@Override
	public List<Quality> turbidityList(Quality quality) {
		return qualityDao.turbidityList(quality);
	}
	@Override
	public boolean deleteAttachment(Quality quality) {
		return qualityDao.deleteAttachment(quality);
	}
	@Override
	public List<Quality> getTestTankListGraph(Quality quality) {
		return qualityDao.getTestTankListGraph(quality);
	}
	@Override
	public List<Quality> attachmentListGraph(Quality quality) {
		return qualityDao.attachmentListGraph(quality);
	}
	@Override
	public List<Quality> turbidityListGraph(Quality quality) {
		return qualityDao.turbidityListGraph(quality);
	}
	@Override
	public List<Quality> getKccChart(Quality quality) {
		return qualityDao.getKccChart(quality);
	}
	@Override
	public List<Quality> liquidKccChart(Quality quality) {
		return qualityDao.liquidKccChart(quality);
	}
	@Override
	public List<Quality> getStandardList(Quality quality) {
		return qualityDao.getStandardList(quality);
	}
}
