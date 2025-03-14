package com.geomet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AGVWashController {

	/*-----AGV-----*/
	
	//AGV 미션 수행 횟수(호기별)
    @RequestMapping(value= "/agvwash/missionCount", method = RequestMethod.GET)
    public String agvwashMissionCount(Model model) {
        return "/agvwash/missionCount.jsp"; // 
    }
	//AGV 오류 발생 횟수
    @RequestMapping(value= "/agvwash/errorCount", method = RequestMethod.GET)
    public String agvwashErrorCount(Model model) {
        return "/agvwash/errorCount.jsp"; // 
    }
	
	//AGV 배터리 소모 이력
    @RequestMapping(value= "/agvwash/batteryStatus", method = RequestMethod.GET)
    public String agvwashBatteryStatus(Model model) {
        return "/agvwash/batteryStatus.jsp"; // 
    }	
	//AGV 작업지시 조회(지시 송신부터 미션 종료까지 이력 표시)
    @RequestMapping(value= "/agvwash/workOrderStatus", method = RequestMethod.GET)
    public String agvwashWorkOrderStatus(Model model) {
        return "/agvwash/workOrderStatus.jsp"; // 
    }	
	
	/*-----세척-----*/
	
	//세척투입 리스트
    @RequestMapping(value= "/agvwash/washList", method = RequestMethod.GET)
    public String agvwashWashList(Model model) {
        return "/agvwash/washList.jsp"; // 
    }	
	
	//세척투입 -> 후처리까지 구간별 통 수량 표현
    @RequestMapping(value= "/agvwash/washInput", method = RequestMethod.GET)
    public String agvwashWashInput(Model model) {
        return "/agvwash/washInput.jsp"; // 
    }	
	
	//세척, 쇼트 일 생산량 표현
    @RequestMapping(value= "/agvwash/washShotWorkPerform", method = RequestMethod.GET)
    public String agvwashWashShotWorkPerform(Model model) {
        return "/agvwash/washShotWorkPerform.jsp"; // 
    }	
	
	//세쳑, 쇼트 라인별 현재 예약상태(IN, OUT) 표현 및 예약 해제
    @RequestMapping(value= "/agvwash/washShotWaitList", method = RequestMethod.GET)
    public String agvwashWashShotWaitList(Model model) {
        return "/agvwash/washShotWaitList.jsp"; // 
    }	
	
	//작업지시 조회(바코드로 조회시) 해당 바코드로 진행이력 표현
    @RequestMapping(value= "/agvwash/workOrderList", method = RequestMethod.GET)
    public String agvwashWorkOrderList(Model model) {
        return "/agvwash/workOrderList.jsp"; // 
    }	
	
	//라인별 입출고이력
    @RequestMapping(value= "/agvwash/lineInOutList", method = RequestMethod.GET)
    public String agvwashLineInOutList(Model model) {
        return "/agvwash/lineInOutList.jsp"; // 
    }	
	
	//설비별 작업실적
    @RequestMapping(value= "/agvwash/machineWorkPerform", method = RequestMethod.GET)
    public String agvwashMachineWorkPerform(Model model) {
        return "/agvwash/machineWorkPerform.jsp"; // 
    }	
	
	//라인별 사용유무 관리
    @RequestMapping(value= "/agvwash/lineUseManage", method = RequestMethod.GET)
    public String agvwashLineUserManage(Model model) {
        return "/agvwash/lineUseManage.jsp"; // 
    }	
	
}
