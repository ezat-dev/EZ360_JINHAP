package com.geomet.service;

import java.util.List;

import com.geomet.domain.Quality;

public interface QualityService {
	//부적합품 관리
    List<Quality> getNonProductManageList(Quality params); 
    
    void saveNonProductManage(Quality quality);
    
    void delNonProductManage(Quality quality);
    
    
    
    
    List<Quality> getqualityList(Quality quality); 
    
    void savetusTest(Quality quality);
    
    void deltusTest(Quality quality);
    
    //수입검사 조회
    List<Quality> getIncomingTestList(Quality quality);
    
    //수입검사 추가
    boolean insertIncoming(Quality quality);
    
    //수입검사 삭제
    boolean deleteIncoming(Quality quality);
    
    //수입검사 수정
    boolean updateIncoming(Quality quality);

    //수입검사 하나 조회
    Quality getIncomingTest(Quality quality);
}
