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


}
