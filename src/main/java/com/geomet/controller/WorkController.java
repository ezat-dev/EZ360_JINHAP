package com.geomet.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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

import com.geomet.domain.Machine;
import com.geomet.domain.Work;
import com.geomet.service.WorkService;

@Controller
public class WorkController {
	
	
	@Autowired
	private WorkService workService;
	
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
    
 // 설비효율 관리 리스트

    @RequestMapping(value = "/work/machineEfficStatus/list", method = RequestMethod.POST)
    @ResponseBody
    public List<Work> getMachineEfficStatusList() {
        Work work = new Work(); 
        List<Work> list = workService.getMachineEfficStatusList(work);

       // System.out.println("=== 설비효율 리스트 출력 ===");
        if (list != null && !list.isEmpty()) {
            for (Work item : list) {
        //        System.out.println(item);
            }
        } else {
            System.out.println("데이터 없음.");
        }

        return list;
    }

    
    
    
	
	//생산 모니터링 현황, 투입시간 준수율 포함
    @RequestMapping(value= "/work/monitoringStatus", method = RequestMethod.GET)
    public String monitoringStatus(Model model) {
        return "/work/monitoringStatus.jsp"; // 
    }	
    
	//MTTR
    @RequestMapping(value= "/work/mttr", method = RequestMethod.GET)
    public String mttr(Model model) {
        return "/work/mttr.jsp"; // 
    }	
    
    
	//작업일보함
    @RequestMapping(value= "/work/workDailyReport", method = RequestMethod.GET)
    public String workDailyReport(Model model) {
        return "/work/workDailyReport.jsp"; // 
    }
    
    
    @RequestMapping(value = "/work/workDailyReport/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getworkDailyReportList(@RequestBody Work work) {
        System.out.println("==[ 원본 Work 객체 정보 ]==");
        System.out.println("raw s_time: " + work.getS_time());
        System.out.println("raw e_time: " + work.getE_time());

        DateTimeFormatter fmt = DateTimeFormatter.ofPattern("yyyyMMdd");

         String sTimeWithOffset = work.getS_time() + "0800";

        LocalDate eDate = LocalDate.parse(work.getE_time(), fmt).plusDays(1);
        String eTimeWithOffset = eDate.format(fmt) + "0800";


        work.setS_time(sTimeWithOffset);
        work.setE_time(eTimeWithOffset);

        System.out.println("==[ 변환된 Work 객체 정보 ]==");
        System.out.println("s_time: " + work.getS_time());
        System.out.println("e_time: " + work.getE_time());
        System.out.println("m_code: "  + work.getM_code());

      
        Map<String, Object> result = new HashMap<>();
        result.put("table1", workService.getReportInputLIst(work));
        result.put("table2", workService.getWorkDailySum(work));
        result.put("table3", workService.getWorkDailyList(work));
        return result;
    }


	
	//재고관리(약품) - 발주현황 반영
    @RequestMapping(value= "/work/inventoryStatus", method = RequestMethod.GET)
    public String inventoryStatus(Model model) {
        return "/work/inventoryStatus.jsp"; // 
    }	
    
 // 재고관리(약품) 조절 리스트
    @RequestMapping(value = "/work/inventoryStatus/list", method = RequestMethod.POST)
    @ResponseBody
    public List<Work> getInventoryStatusList(@RequestParam(required = false) String startDate) {
    	System.out.println(">>> startDate: " + startDate);
    	Work work = new Work();
        work.setStartDate(startDate == null || startDate.isEmpty() ? null : startDate);
        return workService.getInventoryStatusList(work);
    }
    
    
    
    
    @RequestMapping(value = "/work/inventoryStatus/insert", method = RequestMethod.POST)
    @ResponseBody
    public String insertinventoryStatus(@RequestBody Work work) {
        System.out.println("Received Work object: " + work);
        workService.insertinventoryStatus(work);
        return "success";
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
    
    
	/*
	 * //작업일보
	 * 
	 * @RequestMapping(value= "/work/report_g800", method = RequestMethod.GET)
	 * public String report_g800(Model model) { return "/work/report_g800.jsp"; // }
	 */
    
	//작업일보함
    @RequestMapping(value = "/work/report_g800", method = RequestMethod.GET)
    public String reportG800(Model model) {
        return "/work/report_g800.jsp";
    }

    @RequestMapping(value = "/work/report_g600", method = RequestMethod.GET)
    public String reportG600(Model model) {
        return "/work/report_g600.jsp";
    }

    @RequestMapping(value = "/work/report_common", method = RequestMethod.GET)
    public String reportCommon(Model model) {
        return "/work/report_common.jsp";
    }

    @RequestMapping(value = "/work/report_kblack", method = RequestMethod.GET)
    public String reportKBlack(Model model) {
        return "/work/report_kblack.jsp";
    }

    @RequestMapping(value = "/work/report_oil1", method = RequestMethod.GET)
    public String reportOil1(Model model) {
        return "/work/report_oil1.jsp";
    }

    @RequestMapping(value = "/work/report_oil2", method = RequestMethod.GET)
    public String reportOil2(Model model) {
        return "/work/report_oil2.jsp";
    }

    @RequestMapping(value = "/work/report_shot1", method = RequestMethod.GET)
    public String reportShot1(Model model) {
        return "/work/report_shot1.jsp";
    }

    @RequestMapping(value = "/work/report_shot2", method = RequestMethod.GET)
    public String reportShot2(Model model) {
        return "/work/report_shot2.jsp";
    }

    @RequestMapping(value = "/work/report_shot3", method = RequestMethod.GET)
    public String reportShot3(Model model) {
        return "/work/report_shot3.jsp";
    }

    @RequestMapping(value = "/work/report_shot4", method = RequestMethod.GET)
    public String reportShot4(Model model) {
        return "/work/report_shot4.jsp";
    }

    @RequestMapping(value = "/work/report_shot5", method = RequestMethod.GET)
    public String reportShot5(Model model) {
        return "/work/report_shot5.jsp";
    }

    @RequestMapping(value = "/work/report_shot6", method = RequestMethod.GET)
    public String reportShot6(Model model) {
        return "/work/report_shot6.jsp";
    }


    
}
