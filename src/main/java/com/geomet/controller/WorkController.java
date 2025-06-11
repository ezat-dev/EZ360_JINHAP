package com.geomet.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
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

    //작업일보 수정추가
    @RequestMapping(value = "/work/workDailyReport/insert", method = RequestMethod.POST)
    @ResponseBody
    public String insertReportInput(@ModelAttribute Work work) {

    	
//    	R
//		I U
//		D 전부   	
    	
	        System.out.println("===== 저장 요청 받은 데이터 =====");
	        System.out.println("mch_name: " + work.getMch_name());
	        System.out.println("mch_code: " + work.getMch_code());
	        System.out.println("input_date: " + work.getInput_date());
	        System.out.println("gb: " + work.getGb());
	        System.out.println("visc: " + work.getVisc());
	        System.out.println("pre_temp: " + work.getPre_temp());
	        System.out.println("heat_temp: " + work.getHeat_temp());
	        System.out.println("liq_temp: " + work.getLiq_temp());
	        System.out.println("sg: " + work.getSg());
	        System.out.println("idx: " + work.getIdx());
	
	        workService.insertReportInput(work);

        return "success";
    }

    @RequestMapping(value = "/work/workDailyReport/delete", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteReportInput(@RequestBody Work work) {
        Map<String, Object> rtnMap = new HashMap<>();
        System.out.println("삭제 요청 받은 데이터: " + work);

        if (work.getIdx() == null) {
            rtnMap.put("data", "행 선택하세요");
            return rtnMap;
        }

        workService.deleteReportInput(work);

        rtnMap.put("data", "success");
        return rtnMap;
    }
    
    @RequestMapping(value = "/work/workDailyReport/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getworkDailyReportList(@RequestBody Work work) {
        DateTimeFormatter fmt = DateTimeFormatter.ofPattern("yyyyMMdd");
        String sTimeWithOffset = work.getS_time() + "0800";

        LocalDate eDate = LocalDate.parse(work.getE_time(), fmt).plusDays(1);
        String eTimeWithOffset = eDate.format(fmt) + "0800";

        work.setS_time(sTimeWithOffset);
        work.setE_time(eTimeWithOffset);

        Map<String, Object> result = new HashMap<>();
        result.put("table1", workService.getReportInputLIst(work));
        
        List<Work> table2Data = workService.getWorkDailySum(work);
        for (Work w : table2Data) {
            if (w.getAvg_day() != null) {
                w.setAvg_day(w.getAvg_day() + "kg");
            }
            if (w.getAvg_sum() != null) {
                w.setAvg_sum(w.getAvg_sum() + "kg");
            }
            if (w.getWork_time() != null) {
                w.setWork_time(w.getWork_time() + "hr");
            }
            if (w.getSum_time() != null) {
                w.setSum_time(w.getSum_time() + "hr");
            }
            if (w.getSum_percent() != null) {
                w.setSum_percent(w.getSum_percent() + "%");
            }
            if (w.getWork_percent() != null) {
                w.setWork_percent(w.getWork_percent() + "%");
            }
        }
        result.put("table2", table2Data);

        List<Work> table3List = workService.getWorkDailyList(work);

        for (Work w : table3List) {
            if (w.getStart_time() != null && w.getStart_time().length() == 14) {
                w.setStart_time(w.getStart_time().substring(8, 10) + ":" +
                                w.getStart_time().substring(10, 12) + ":" +
                                w.getStart_time().substring(12, 14));
            }
            if (w.getEnd_time() != null && w.getEnd_time().length() == 14) {
                w.setEnd_time(w.getEnd_time().substring(8, 10) + ":" +
                              w.getEnd_time().substring(10, 12) + ":" +
                              w.getEnd_time().substring(12, 14));
            }
            if (w.getWeight_day() != null) {
                w.setWeight_day(w.getWeight_day() + "kg");
            }
        }

        result.put("table3", table3List);
        return result;
    }

    
    
    @RequestMapping(value = "/work/workDailyReport/excel", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> exportWorkDailyReportExcel(@RequestBody Work work) throws Exception {
        // 1) 날짜 오프셋 처리 (기존 로직 재사용)
        DateTimeFormatter fmt = DateTimeFormatter.ofPattern("yyyyMMdd");
        String sTimeWithOffset = work.getS_time() + "0800";
        LocalDate eDate = LocalDate.parse(work.getE_time(), fmt).plusDays(1);
        String eTimeWithOffset = eDate.format(fmt) + "0800";
        work.setS_time(sTimeWithOffset);
        work.setE_time(eTimeWithOffset);

        // 2) 데이터 조회
        List<Work> table1 = workService.getReportInputLIst(work);
        List<Work> table2 = workService.getWorkDailySum(work);
        List<Work> table3 = workService.getWorkDailyList(work);

        // 3) 템플릿 로드
        String templatePath = "D:/GEOMET양식/작업일보_양식/작업일보G600.xlsx";
        try (FileInputStream fis = new FileInputStream(templatePath);
             Workbook wb = WorkbookFactory.create(fis)) {

            Sheet sheet = wb.getSheetAt(0);

            
            LocalDate parsed = LocalDate.parse(work.getS_time(), DateTimeFormatter.ofPattern("yyyyMMdd"));
            String formatted = parsed.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));

            Row row3 = sheet.getRow(2);
            if (row3 == null) row3 = sheet.createRow(2);
            Cell cellF3 = row3.getCell(5);
            if (cellF3 == null) cellF3 = row3.createCell(5);
            cellF3.setCellValue(formatted);
            
            
            // 4) table1 쓰기 (6행, B열부터)
            int rowIdx = 5;
            for (Work w : table1) {
                Row row = sheet.getRow(rowIdx);
                if (row == null) row = sheet.createRow(rowIdx);
                int colIdx = 1; // B열
                row.getCell(colIdx++).setCellValue(w.getVisc());
                row.getCell(colIdx++).setCellValue(w.getPre_temp());
                row.getCell(colIdx++).setCellValue(w.getHeat_temp());
                row.getCell(colIdx++).setCellValue(w.getLiq_temp());
                row.getCell(colIdx++).setCellValue(w.getSg());

                rowIdx++;
            }

            // 5) table2 쓰기 (10행, A열부터)
            rowIdx = 9;
            for (Work w : table2) {
                // 단위 붙이기
                if (w.getAvg_day() != null)      w.setAvg_day(w.getAvg_day() + "kg");
                if (w.getAvg_sum() != null)      w.setAvg_sum(w.getAvg_sum() + "kg");
                if (w.getWork_time() != null)    w.setWork_time(w.getWork_time() + "hr");
                if (w.getSum_time() != null)     w.setSum_time(w.getSum_time() + "hr");
                if (w.getWork_percent() != null) w.setWork_percent(w.getWork_percent() + "%");
                if (w.getSum_percent() != null)  w.setSum_percent(w.getSum_percent() + "%");

                Row row = sheet.getRow(rowIdx);
                if (row == null) row = sheet.createRow(rowIdx);
                int colIdx = 0; // A열부터 순서대로 기록

                row.getCell(colIdx++).setCellValue(w.getTong_day());
                row.getCell(colIdx++).setCellValue(w.getWeight_day());
                row.getCell(colIdx++).setCellValue(w.getAvg_day());
                row.getCell(colIdx++).setCellValue(w.getTong_sum());
                row.getCell(colIdx++).setCellValue(w.getWeight_sum());
                row.getCell(colIdx++).setCellValue(w.getAvg_sum());
                row.getCell(colIdx++).setCellValue(w.getWork_time());
                row.getCell(colIdx++).setCellValue(w.getWork_percent());
                row.getCell(colIdx++).setCellValue(w.getSum_time());
                row.getCell(colIdx++).setCellValue(w.getSum_percent());
                row.getCell(colIdx++).setCellValue(w.getUph());
                row.getCell(colIdx++).setCellValue(w.getUph_sum());

                rowIdx++;
            }

            // 6) table3 쓰기 (13행, A열부터)
            rowIdx = 12;
            for (Work w : table3) {
                // 시간 포맷팅
                if (w.getStart_time() != null && w.getStart_time().length() == 14) {
                    w.setStart_time(
                        w.getStart_time().substring(8, 10) + ":" +
                        w.getStart_time().substring(10, 12) + ":" +
                        w.getStart_time().substring(12, 14)
                    );
                }
                if (w.getEnd_time() != null && w.getEnd_time().length() == 14) {
                    w.setEnd_time(
                        w.getEnd_time().substring(8, 10) + ":" +
                        w.getEnd_time().substring(10, 12) + ":" +
                        w.getEnd_time().substring(12, 14)
                    );
                }
                if (w.getWeight_day() != null) {
                    w.setWeight_day(w.getWeight_day() + "kg");
                }

                Row row = sheet.getRow(rowIdx);
                if (row == null) row = sheet.createRow(rowIdx);
                int colIdx = 0;

                row.getCell(colIdx++).setCellValue(w.getR_num());
                row.getCell(colIdx++).setCellValue(w.getStart_time());
                row.getCell(colIdx++).setCellValue(w.getEnd_time());
                row.getCell(colIdx++).setCellValue(w.getTong_day());
                row.getCell(colIdx++).setCellValue(w.getWeight_day());
                row.getCell(colIdx++).setCellValue(w.getA());  // 분할횟수
                row.getCell(colIdx++).setCellValue(w.getItem_nm());
                row.getCell(colIdx++).setCellValue(w.getItem_cd());
                row.getCell(colIdx++).setCellValue(w.getNext_facility());
                row.getCell(colIdx++).setCellValue(w.getE());  // 구분
                row.getCell(colIdx++).setCellValue(w.getF());  // 비고

                rowIdx++;
            }

            // 7) 파일 저장 경로에 쓰기
            String saveDir = "D:/GEOMET양식/작업일보";
            // 예: "작업일보_20250610.xlsx" 같이 날짜 붙여서
            String outFileName = String.format("작업일보_%s.xlsx", LocalDate.now().format(fmt));
            File outFile = new File(saveDir, outFileName);
            try (FileOutputStream fos = new FileOutputStream(outFile)) {
                wb.write(fos);
            }

            // 8) 클라이언트에 다운로드용 상대경로 리턴
            Map<String, Object> result = new HashMap<>();
            result.put("downloadPath", "/geomet/downloads/" + outFileName);
            return result;
        }
    }
    
    
    
    
    @RequestMapping(value = "/download_workDailyReport", method = RequestMethod.GET)
    public void downloadExcel(@RequestParam String filename, HttpServletResponse response) throws IOException {
        // 고정된 파일명과 경로
        String baseDir = "D:/GEOMET양식/작업일보/";
		/* String fileName = "기준정보.xlsx"; */
        System.out.println("▶ 다운로드 요청 filename: " + filename);
        File file = new File(baseDir + filename);

        if (!file.exists()) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        String mimeType = Files.probeContentType(file.toPath());
        if (mimeType == null) {
            mimeType = "application/octet-stream";
        }
        response.setContentType(mimeType);
        response.setContentLengthLong(file.length());

        String encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");

        response.setHeader("Content-Disposition", "attachment; filename*=UTF-8''" + encodedFilename);

        try (FileInputStream fis = new FileInputStream(file);
             OutputStream os = response.getOutputStream()) {
            byte[] buffer = new byte[1024];
            int len;
            while ((len = fis.read(buffer)) != -1) {
                os.write(buffer, 0, len);
            }
            os.flush();
        }
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @RequestMapping(value = "/work/machinePerformStatus/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getmachinePerformStatusList(@RequestBody Work work) {
        System.out.println("==[ 모니터링 현황 시간 변경 전 ]==");
        System.out.println("raw s_time: " + work.getS_time());
        System.out.println("raw e_time: " + work.getE_time());

        DateTimeFormatter fmt = DateTimeFormatter.ofPattern("yyyyMMdd");

         String sTimeWithOffset = work.getS_time() + "080000";

        LocalDate eDate = LocalDate.parse(work.getE_time(), fmt).plusDays(1);
        String eTimeWithOffset = eDate.format(fmt) + "080000";


        work.setS_time(sTimeWithOffset);
        work.setE_time(eTimeWithOffset);

        System.out.println("==[ 변환 모니터링 현황 ]==");
        System.out.println("s_time: " + work.getS_time());
        System.out.println("e_time: " + work.getE_time());
       

      
        Map<String, Object> result = new HashMap<>();
       
        result.put("table2", workService.MonitoringStatusList(work));
        result.put("table3", workService.MonitoringStatusList2(work));
        return result;
    }
}
