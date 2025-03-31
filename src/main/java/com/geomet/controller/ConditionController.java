package com.geomet.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.geomet.domain.CorrStatus;
import com.geomet.domain.Condition;
import com.geomet.service.ConditionService;
import com.geomet.service.CorrStatusService;

@Controller
public class ConditionController {

    @Autowired
    private CorrStatusService CorrStatusService;
	
    @Autowired
    private ConditionService conditionService; 
    
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
    
    @RequestMapping(value = "/condition/divisionWeight/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> workDetailList(
            @RequestParam String plating_no,
            @RequestParam String pum_name,
            @RequestParam String surface_spec
    ) {
        // 요청 파라미터 로그 출력
        System.out.println("Received request:");
        System.out.println("plating_no: " + plating_no);
        System.out.println("pum_name: " + pum_name);
        System.out.println("surface_spec_in: " + surface_spec);

        // 반환할 Map 생성
        Map<String, Object> rtnMap = new HashMap<>();

        // 서비스 계층을 통해 데이터를 가져옴
        try {
           
        	Condition standardInfo = new Condition();
        	standardInfo.setPlating_no(plating_no.isEmpty() ? null : plating_no); 
            standardInfo.setPum_name(pum_name.isEmpty() ? null : pum_name);        
            standardInfo.setSurface_spec(surface_spec.isEmpty() ? null : surface_spec); 

            List<Condition> standardInfoList = conditionService.getStandardInfoList(standardInfo);

            System.out.println("getStandardInfoList Size: " + standardInfoList.size());
            // 성공 시 데이터 반환
            rtnMap.put("status", "success");
            rtnMap.put("last_page", 1);
            rtnMap.put("data", standardInfoList);
        } catch (Exception e) {
            // 에러 발생 시 에러 메시지 반환
            System.out.println("Error occurred: " + e.getMessage());
            rtnMap.put("status", "error");
            rtnMap.put("message", e.getMessage());
        }

        return rtnMap;
    }
    
    
    
    
    

    @RequestMapping(value = "/condition/divisionWeight/insert", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> saveDivisionWeight(@ModelAttribute Condition condition) {
        
        Map<String, Object> rtnMap = new HashMap<String, Object>();
        
        if(condition.getPlating_no() == null) {
        	rtnMap.put("data", "도금 푼번을 입력하시오!");
        	return rtnMap;
        }
        
        
     
        conditionService.saveDivisionWeight(condition); 
        
        return rtnMap;
    }
    
    @RequestMapping(value = "/condition/divisionWeight/del", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> delDivisionWeight(@RequestBody Map<String, Object> requestBody) {
        Map<String, Object> rtnMap = new HashMap<String, Object>();

        String platingNo = (String) requestBody.get("plating_no");

        System.out.println("서버에서 받은 plating_no: " + platingNo);

        if (platingNo == null) {
            rtnMap.put("data", "행 선택하세요");
            return rtnMap;
        }

     
        Condition condition = new Condition();
        condition.setPlating_no(platingNo);

    
        conditionService.delDivisionWeight(condition); 
        return rtnMap;
    }

    
}
