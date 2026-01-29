package com.geomet.dao;

import java.util.List;


import com.geomet.domain.Quality;

public interface QualityDao {
	
	  //부적합품 관리
	  List<Quality> getNonProductManageList(Quality params);

	  void saveNonProductManage(Quality quality);
	  
	  void delNonProductManage(Quality quality);
	  
	  
	// 부적합품 관리 수정
	  public void updateNonProductManage(Quality quality);
	    
	    List<Quality> getqualityList(Quality quality); 
	    
	    void savetusTest(Quality quality);
	    
	    void deltusTest(Quality quality);
	    
	    //수입검사 조회
	    List<Quality> getIncomingTestList(Quality quality);
	    
	    //수입검사 추가
	    boolean insertIncomingTest(Quality quality);
	    
	    //수입검사 삭제
	    boolean deleteIncoming(Quality quality);
	    
	    //수입검사 수정
	    boolean updateIncoming(Quality quality);
	    
	    //수입검사 하나 조회
	    Quality getIncomingTest(Quality quality);
	    
	    
		//양산품기준정보
		List<Quality> getTest_infoList(Quality params); 
	    
	    void saveTest_infoList(Quality quality);
	    
	    void delTest_infoList(Quality quality);
	    
	    //약품투입 기준자료
	    List<Quality> getMedicineList1(Quality quality);
	    List<Quality> getMedicineList2(Quality quality);
	    boolean updateMedicineStandard(Quality quality);
	    
	    //테스트 관리대장
	    List<Quality> getTestManageList(Quality quality);
	    boolean updateTestManage(Quality quality);
	    
	    //테스트/시험정보
	    Boolean testTankInsert(Quality quality);
	    List<Quality> getTestTankList(Quality quality);
	    boolean testTankDelete(Quality quality);
	    List<Quality> getDataList1(Quality quality);
	    boolean data1Insert(Quality quality);
	    boolean data1Delete(Quality quality);
	    
	    //액분석관리
	    List<Quality> getLiquidAnalyze(Quality quality);
	    boolean liquidAnalyzeInsert(Quality quality);
	    boolean deleteLiquidAnalyze(Quality quality);
	    boolean liquidAnalyzeInsertNv(Quality quality);
	    boolean liquidAnalyzeInsertAsh(Quality quality);
	    List<Quality> getKccList(Quality quality);
	    boolean updateKcc(Quality quality);
	    boolean insertCct(Quality quality);
	    List<Quality> getCctList(Quality quality);
	    boolean deleteCct(Quality quality);
	    List<Quality> getSstList(Quality quality);
	    boolean insertSst(Quality quality);
	    boolean deleteSst(Quality quality);
	    boolean insertAttachment(Quality quality);
	    List<Quality> attachmentList(Quality quality);
	    List<Quality> turbidityList(Quality quality);
	    boolean deleteAttachment(Quality quality);
	    List<Quality> getTestTankListGraph(Quality quality);
	    List<Quality> attachmentListGraph(Quality quality);
	    List<Quality> turbidityListGraph(Quality quality);
	    List<Quality> getKccChart(Quality quality);
	    List<Quality> liquidKccChart(Quality quality);
	    
	    List<Quality> getStandardList(Quality quality);
}
