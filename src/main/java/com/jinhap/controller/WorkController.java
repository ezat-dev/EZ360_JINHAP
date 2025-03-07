package com.jinhap.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class WorkController {
	/*-----생산관리-----*/
	
	//설비별 생산실적 현황
    @RequestMapping(value= "/work/machinePerformStatus", method = RequestMethod.GET)
    public String machinePerformStatus(Model model) {
        return "/work/machinePerformStatus.jsp"; // 
    }

	//설비효율 관리
    @RequestMapping(value= "/work/machineEfficStatus", method = RequestMethod.GET)
    public String machineEfficStatus(Model model) {
        return "/work/machineEfficStatus.jsp"; // 
    }	
	
	//생산 모니터링 현황, 투입시간 준수율 포함
    @RequestMapping(value= "/work/monitoringStatus", method = RequestMethod.GET)
    public String monitoringStatus(Model model) {
        return "/work/monitoringStatus.jsp"; // 
    }		
	
	//재고관리(약품) - 발주현황 반영
    @RequestMapping(value= "/work/inventoryStatus", method = RequestMethod.GET)
    public String inventoryStatus(Model model) {
        return "/work/inventoryStatus.jsp"; // 
    }	
	
	/*-----투입 운전관리-----*/
	
	//투입제어 및 모니터링
    @RequestMapping(value= "/work/inputControlStatus", method = RequestMethod.GET)
    public String inputControlStatus(Model model) {
        return "/work/inputControlStatus.jsp"; // 
    }
	
	//생산설비 실시간 정보
    @RequestMapping(value= "/work/machineRealStatus", method = RequestMethod.GET)
    public String machineRealStatus(Model model) {
        return "/work/machineRealStatus.jsp"; // 
    }	
	
	/*-----취출 운전관리-----*/
	
	//LOT 보고서 (위치/정보확인)
    @RequestMapping(value= "/work/lotReportStatus", method = RequestMethod.GET)
    public String lotReportStatus(Model model) {
        return "/work/lotReportStatus.jsp"; // 
    }	
	
	//생산조건 모니터링
    @RequestMapping(value= "/work/workConditionStatus", method = RequestMethod.GET)
    public String workConditionStatus(Model model) {
        return "/work/workConditionStatus.jsp"; // 
    }	
}
