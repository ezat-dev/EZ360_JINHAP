package com.jinhap.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MachineController {

	
	/*-----모니터링-----*/
	
	//통합 모니터링
    @RequestMapping(value= "/machine/allMonitoring", method = RequestMethod.GET)
    public String allMonitoring(Model model) {
        return "/machine/allMonitoring.jsp"; // 
    }
    
	//설비별 모니터링
    @RequestMapping(value= "/machine/detailMonitoring", method = RequestMethod.GET)
    public String detailMonitoring(Model model) {
        return "/machine/detailMonitoring.jsp"; // 
    }
    
    //경보 모니터링
    @RequestMapping(value= "/machine/alarmMonitoring", method = RequestMethod.GET)
    public String alarmMonitoring(Model model) {
    	return "/machine/alarmMonitoring.jsp"; // 
    }
	
	//경보 발생빈도
    @RequestMapping(value= "/machine/alarmList", method = RequestMethod.GET)
    public String alarmList(Model model) {
        return "/machine/alarmList.jsp"; // 
    }
	
	//설비별 온도경향 모니터링
    @RequestMapping(value= "/machine/tempMonitoring", method = RequestMethod.GET)
    public String tempMonitoring(Model model) {
        return "/machine/tempMonitoring.jsp"; // 
    }
	
	/*-----설비관리-----*/
	
	//정기점검 계획/실적
    @RequestMapping(value= "/machine/checkPlan", method = RequestMethod.GET)
    public String checkPlan(Model model) {
        return "/machine/checkPlan.jsp"; // 
    }
	
	//설비 비가동현황(고장계획정지, 보수, 시간)
    @RequestMapping(value= "/machine/nonTime", method = RequestMethod.GET)
    public String nonTime(Model model) {
        return "/machine/nonTime.jsp"; // 
    }
	
	//설비이력카드(돌발고장, 정기점검, 정기교체), 부품교체 이력관리, 스페어부품(안전보호구 포함)
    @RequestMapping(value= "/machine/repairStatus", method = RequestMethod.GET)
    public String repairStatus(Model model) {
        return "/machine/repairStatus.jsp"; // 
    }

}
