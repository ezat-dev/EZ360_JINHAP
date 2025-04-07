package com.geomet.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.geomet.domain.Condition;
import com.geomet.domain.Quality;

import com.geomet.service.QualityService;


@Controller
public class QualityController {
	
	 @Autowired
	    private QualityService qualityService; 

	/*-----품질관리-----*/
	
	//온도균일성 테스트
    @RequestMapping(value= "/quality/tusTest", method = RequestMethod.GET)
    public String tusTest(Model model) {
        return "/quality/tusTest.jsp"; // 
    }
    
    //온도균일성 테스트 - 조회
	 @RequestMapping(value = "/quality/tustest/selectList", method = RequestMethod.POST) 
	 @ResponseBody 
	 public Map<String, Object> tusTestSelect() {
		 Map<String, Object> rtnMap = new HashMap<String, Object>();
		 
		 rtnMap.put("last_page",1);
		 rtnMap.put("data","");
		 
		 return rtnMap; 
	 }
	
	//내식성 테스트 - SST, CCT, 부착량 시험, 내수 밀착성, 설비별 가열잔분, 탈지액 분석
    @RequestMapping(value= "/quality/resistTest", method = RequestMethod.GET)
    public String resistTest(Model model) {
        return "/quality/resistTest.jsp"; // 
    }
	
	//수입검사 - 쇼트볼, 신액입고분
    @RequestMapping(value= "/quality/inTest", method = RequestMethod.GET)
    public String inTest(Model model) {
        return "/quality/inTest.jsp"; // 
    }	
	
	//욕액분석, 사용액 분석, 이코팅, 방청
    @RequestMapping(value= "/quality/liquidAnalyze", method = RequestMethod.GET)
    public String liquidAnalyze(Model model) {
        return "/quality/liquidAnalyze.jsp"; // 
    }	
	
	//부적합품 관리
    @RequestMapping(value= "/quality/nonProductManage", method = RequestMethod.GET)
    public String nonProductManage(Model model) {
        return "/quality/nonProductManage.jsp"; // 
    }	
    
    // 부적합품 관리 리스트
    @RequestMapping(value = "/quality/nonProductManage/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> corrStatusList(
            @RequestParam String equipment_name,
            @RequestParam String startDate,
            @RequestParam String endDate
    ) {      
		/*
		 * System.out.println("Received request:");
		 * System.out.println("부적합equipment_name: " + equipment_name);
		 * System.out.println("부적합startDate: " + startDate);
		 * System.out.println("부적합endDate: " + endDate);
		 */

        Map<String, Object> rtnMap = new HashMap<>();
        try {
           
        	Quality quality = new Quality();
        	quality.setEquipment_name(equipment_name.isEmpty() ? null : equipment_name); 
        	quality.setStartDate(startDate.isEmpty() ? null : startDate);        
        	quality.setEndDate(endDate.isEmpty() ? null : endDate); 

            List<Quality> getNonProductManageList = qualityService.getNonProductManageList(quality);

           // System.out.println("getStandardInfoList Size: " + getNonProductManageList.size());     
            rtnMap.put("status", "success");
            rtnMap.put("last_page", 1);
            rtnMap.put("data", getNonProductManageList);
        } catch (Exception e) {
            System.out.println("Error occurred: " + e.getMessage());
            rtnMap.put("status", "error");
            rtnMap.put("message", e.getMessage());
        }

        return rtnMap;
    }
    
    // 부적합품 관리
    @RequestMapping(value = "/quality/nonProductManage/insert", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> saveNonProductManage(@ModelAttribute Quality quality) {
        Map<String, Object> rtnMap = new HashMap<>();

        qualityService.saveNonProductManage(quality);

        rtnMap.put("result", "success");
        return rtnMap;
    }


}
