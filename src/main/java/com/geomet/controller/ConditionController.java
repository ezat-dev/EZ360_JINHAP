package com.geomet.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.geomet.domain.CorrStatus;
import com.geomet.service.CorrStatusService;

@Controller
public class ConditionController {

    @Autowired
    private CorrStatusService CorrStatusService;
	
	/*-----조건관리-----*/
	
	//TC 교체이력, 각종 조절계 교정이력
    @RequestMapping(value= "/condition/corrStatus", method = RequestMethod.GET)
    public String corrStatus(Model model) {
        return "/condition/corrStatus.jsp"; // 
    }
    
    
    @RequestMapping(value = "/condition/corrStatus/insert", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> saveCorrStatus(@ModelAttribute CorrStatus corrStatus) {
        
        Map<String, Object> rtnMap = new HashMap<String, Object>();
        
        if(corrStatus.getLocation() == null) {
        	rtnMap.put("data", "존 구분을 입력하시오!");
        	return rtnMap;
        }
        
        // CorrStatusService의 saveCorrStatus 메서드 호출
        CorrStatusService.saveCorrStatus(corrStatus); 
        
        return rtnMap;
    }


	
	//설비별 액 온도, 점도, 비중 관리, 칠러온도
    @RequestMapping(value= "/condition/machinePartTemp", method = RequestMethod.GET)
    public String machinePartTemp(Model model) {
        return "/condition/machinePartTemp.jsp"; // 
    }		
	
	//신액 교반일지, 탱크액 관리일지 - 설비별 구분
    @RequestMapping(value= "/condition/machineLiquidManage", method = RequestMethod.GET)
    public String machineLiquidManage(Model model) {
        return "/condition/machineLiquidManage.jsp"; // 
    }		
	
	//일상점검일지(설비+조건), 액고임 발생개소 포함
    @RequestMapping(value= "/condition/dailyCheck", method = RequestMethod.GET)
    public String dailyCheck(Model model) {
        return "/condition/dailyCheck.jsp"; // 
    }		
	
	//지오메트 분할기준중량 입력, 관리
    @RequestMapping(value= "/condition/divisionWeight", method = RequestMethod.GET)
    public String divisionWeight(Model model) {
        return "/condition/divisionWeight.jsp"; // 
    }		
	
}
