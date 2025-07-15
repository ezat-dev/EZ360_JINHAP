package com.geomet.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.DecimalFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.BiFunction;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.geomet.domain.Work;
import com.geomet.service.WorkService;


import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.BorderStyle;



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
        System.out.println("work.getStartDate(): " + work.getStartDate());
        return workService.getInventoryStatusList(work);
    }
    
    //재고관리 업데이트
    @RequestMapping(value = "/work/inventoryStatus/update", method = RequestMethod.POST)
    @ResponseBody
    public boolean inventoryStatusUpdate(@RequestBody Work work) {
       System.out.println("inventoryStatusUpdate 컨트롤러 도착 ");
       System.out.println("work.getId: " + work.getId());
       System.out.println("work.getNext_month: " + work.getNext_month());
        return workService.inventoryStatusUpdate(work);
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
    public Map<String, Object> getWorkDailyReportList(@RequestBody Work work) {
        DateTimeFormatter fmt = DateTimeFormatter.ofPattern("yyyyMMdd");
        DateTimeFormatter fmt2 = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        // ★ 받은 원본 파라미터 로그 출력
        System.out.println("▶ Received Work:");
        System.out.println("   s_time  = " + work.getS_time());
        System.out.println("   e_time  = " + work.getE_time());
        System.out.println("   s_time2  = " + work.getS_time2());
        System.out.println("   m_code  = " + work.getM_code());

        String rawStart = work.getS_time();  // 예: "20250711"
        String rawEnd   = work.getE_time();

        // ▶ s_time2는 yyyy-MM-dd 형식으로 저장 (0800 없이)
        String sTime2 = LocalDate.parse(rawStart, fmt).format(fmt2);
        work.setS_time2(sTime2);

        // ▶ s_time은 0800 붙여서 DB용으로
        work.setS_time(rawStart + "0800");

        // ▶ e_time도 +1일 후 0800 붙이기
        LocalDate eDate = LocalDate.parse(rawEnd, fmt).plusDays(1);
        work.setE_time(eDate.format(fmt) + "0800");

      
        String code = work.getM_code();
        String code2 = "";
        if ("G03-GG01".equals(code)) {
            code2 = "'G03-GG01','G04-GG05','G04-GG07'";
        } else if ("G03-GG03".equals(code)) {
            code2 = "'G03-GG03','G04-GG05','G04-GG07'";
        }
        work.setM_code2(code2);

        // ★ 보낼 m_code2 로그 출력
        System.out.println("▶ Computed m_code2 = " + code2);

    
        Map<String, Object> result = new HashMap<>();

        List<Work> table1 = workService.getReportInputLIst(work);
        result.put("table1", table1);
        DecimalFormat df = new DecimalFormat("#,###");
        List<Work> table2Data = workService.getWorkDailySum(work);
        for (Work w : table2Data) {
            if (w.getAvg_day()    != null) w.setAvg_day(w.getAvg_day() + "kg");
            if (w.getAvg_sum()    != null) w.setAvg_sum(w.getAvg_sum() + "kg");
            if (w.getWork_time()  != null) w.setWork_time(w.getWork_time() + "");
            if (w.getSum_time()   != null) w.setSum_time(w.getSum_time() + "hr");
            if (w.getSum_percent()!= null) w.setSum_percent(w.getSum_percent() + "%");
            if (w.getWork_percent()!=null) w.setWork_percent(w.getWork_percent() + "%");
       
        
            if (w.getWeight_day() != null && !w.getWeight_day().isEmpty()) {
                w.setWeight_day(df.format(Double.parseDouble(w.getWeight_day())));
            }

            if (w.getTong_sum() != null && !w.getTong_sum().isEmpty()) {
                w.setTong_sum(df.format(Double.parseDouble(w.getTong_sum())));
            }

            if (w.getWeight_sum() != null && !w.getWeight_sum().isEmpty()) {
                w.setWeight_sum(df.format(Double.parseDouble(w.getWeight_sum())));
            }
        }
        result.put("table2", table2Data);

        List<Work> table3List = workService.getWorkDailyList(work);
        for (Work w : table3List) {
            if (w.getStart_time() != null && w.getStart_time().length() == 14) {
                w.setStart_time(
                    w.getStart_time().substring(8,10) + ":" +
                    w.getStart_time().substring(10,12) + ":" +
                    w.getStart_time().substring(12,14)
                );
            }
            if (w.getEnd_time() != null && w.getEnd_time().length() == 14) {
                w.setEnd_time(
                    w.getEnd_time().substring(8,10) + ":" +
                    w.getEnd_time().substring(10,12) + ":" +
                    w.getEnd_time().substring(12,14)
                );
            }
            if (w.getWeight_day() != null) {
                w.setWeight_day(w.getWeight_day() + "kg");
            }
        }
        result.put("table3", table3List);

        // 4) 원본과 추가 문자열도 함께 리턴
        result.put("m_code", code);
        result.put("m_code2", code2);

       
        System.out.println("▶ Returning Map keys:");
        result.forEach((k, v) -> {
            if (v instanceof List) {
                System.out.println("   " + k + " -> List size = " + ((List<?>) v).size());
            } else {
                System.out.println("   " + k + " -> " + v);
            }
        });

        return result;
    }

    
    
    @RequestMapping(value = "/work/workDailyReport/excel", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> exportWorkDailyReportExcel(@RequestBody Work work) throws Exception {
    	 DateTimeFormatter fmt = DateTimeFormatter.ofPattern("yyyyMMdd");
         DateTimeFormatter fmt2 = DateTimeFormatter.ofPattern("yyyy-MM-dd");
         // ★ 받은 원본 파라미터 로그 출력
         System.out.println("▶ Received Work:");
         System.out.println("   s_time  = " + work.getS_time());
         System.out.println("   e_time  = " + work.getE_time());
         System.out.println("   s_time2  = " + work.getM_code2());
         System.out.println("   m_code  = " + work.getM_code());

         String rawStart = work.getS_time();  // 예: "20250711"
         String rawEnd   = work.getE_time();

         // ▶ s_time2는 yyyy-MM-dd 형식으로 저장 (0800 없이)
         String sTime2 = LocalDate.parse(rawStart, fmt).format(fmt2);
         work.setS_time2(sTime2);

         // ▶ s_time은 0800 붙여서 DB용으로
         work.setS_time(rawStart + "0800");

         // ▶ e_time도 +1일 후 0800 붙이기
         LocalDate eDate = LocalDate.parse(rawEnd, fmt).plusDays(1);
         work.setE_time(eDate.format(fmt) + "0800");
        // 3) 데이터 조회
        List<Work> table1 = workService.getReportInputLIst(work);
        List<Work> table2 = workService.getWorkDailySum(work);
        List<Work> table3 = workService.getWorkDailyList(work);

        
        // 4) 템플릿 로드
        String templatePath = "D:/GEOMET양식/작업일보_양식/작업일보G600.xlsx";
        try (FileInputStream fis = new FileInputStream(templatePath);
             Workbook wb = WorkbookFactory.create(fis)) {

            Sheet sheet = wb.getSheetAt(0);

            // 헬퍼: cell 생성 보장
            BiFunction<Row, Integer, Cell> getOrCreateCell = (r, c) -> {
                Cell cell = r.getCell(c);
                return (cell != null) ? cell : r.createCell(c);
            };

            // ▶ 테두리 스타일 선언: for문 전에 한 번만 생성
            CellStyle borderStyle = wb.createCellStyle();
            borderStyle.setBorderTop(BorderStyle.THIN);
            borderStyle.setBorderBottom(BorderStyle.THIN);
            borderStyle.setBorderLeft(BorderStyle.THIN);
            borderStyle.setBorderRight(BorderStyle.THIN);

            // 5) B2 셀에 ex_mch_name 쓰기
            String exMch = work.getEx_mch_name();
            Row row1 = sheet.getRow(1);
            if (row1 == null) row1 = sheet.createRow(1);
            getOrCreateCell.apply(row1, 1).setCellValue(exMch);

            // 6) 7행(L열)에 yyyy-MM-dd 시작일자 쓰기
            LocalDate startDate = LocalDate.parse(rawStart, fmt);
            String formattedDate = startDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
            Row row7 = sheet.getRow(6);
            if (row7 == null) row7 = sheet.createRow(6);
            getOrCreateCell.apply(row7, 11).setCellValue(formattedDate);

            // 7) table1 쓰기 (6행, B열부터)
            int rowIdx = 5;
            for (Work w : table1) {
                Row r = sheet.getRow(rowIdx);
                if (r == null) r = sheet.createRow(rowIdx);
                int col = 1;
                getOrCreateCell.apply(r, col++).setCellValue(w.getVisc());
                getOrCreateCell.apply(r, col++).setCellValue(w.getPre_temp());
                getOrCreateCell.apply(r, col++).setCellValue(w.getHeat_temp());
                getOrCreateCell.apply(r, col++).setCellValue(w.getLiq_temp());
                getOrCreateCell.apply(r, col++).setCellValue(w.getSg());
                // 테두리 스타일 적용
                for (int c = 1; c <= 5; c++) {
                    getOrCreateCell.apply(r, c).setCellStyle(borderStyle);
                }
                rowIdx++;
            }

            rowIdx = 10;
            for (Work w : table2) {
                if (w.getAvg_day() != null)      w.setAvg_day(w.getAvg_day() + "kg");
                if (w.getWork_time() != null)    w.setWork_time(w.getWork_time() + "");
                if (w.getSum_time() != null)     w.setSum_time(w.getSum_time() + "hr");
                if (w.getWork_percent() != null) w.setWork_percent(w.getWork_percent() + "%");
                if (w.getSum_percent() != null)  w.setSum_percent(w.getSum_percent() + "%");

                Row r = sheet.getRow(rowIdx);
                if (r == null) r = sheet.createRow(rowIdx);
                int col = 0;
                DecimalFormat commaFormat = new DecimalFormat("#,##0");
                // ✅ Tabulator 컬럼 순서에 맞춘 셀 입력
                getOrCreateCell.apply(r, col++).setCellValue(w.getTong_day());      // 일 작업통수
                // 작업중량(kg)
                getOrCreateCell.apply(r, col++).setCellValue(
                    w.getWeight_day() != null ? commaFormat.format(w.getWeight_day()) + "kg" : ""
                );
			   // 생산량
                getOrCreateCell.apply(r, col++).setCellValue(w.getAvg_day());       // 표준중량
                getOrCreateCell.apply(r, col++).setCellValue(w.getWork_time());     // 가동시간
                getOrCreateCell.apply(r, col++).setCellValue(w.getWork_percent());  // 가동률
                getOrCreateCell.apply(r, col++).setCellValue(w.getUph());           // UPH
                // 누적 생산통수
                getOrCreateCell.apply(r, col++).setCellValue(
                    w.getTong_sum() != null ? commaFormat.format(w.getTong_sum()) : ""
                );

                // 누적 생산량
                getOrCreateCell.apply(r, col++).setCellValue(
                    w.getWeight_sum() != null ? commaFormat.format(w.getWeight_sum()) : ""
                );    // 누적 생산량
                getOrCreateCell.apply(r, col++).setCellValue(w.getSum_time());      // 누적 가동시간
                getOrCreateCell.apply(r, col++).setCellValue(w.getSum_percent());   // 누적 가동률
                getOrCreateCell.apply(r, col++).setCellValue(w.getUph_sum());       // 누적 UPH

                // ✅ 테두리 스타일 11칸만 적용
                for (int c = 0; c < 11; c++) {
                    getOrCreateCell.apply(r, c).setCellStyle(borderStyle);
                }

                rowIdx++;
            }


            // 9) table3 쓰기 (13행, A열부터)
            int rowIdx2 = 13;
            for (Work w : table3) {
                if (w.getStart_time() != null && w.getStart_time().length() == 14) {
                    w.setStart_time(
                        w.getStart_time().substring(8,10) + ":" +
                        w.getStart_time().substring(10,12) + ":" +
                        w.getStart_time().substring(12,14));
                }
                if (w.getEnd_time() != null && w.getEnd_time().length() == 14) {
                    w.setEnd_time(
                        w.getEnd_time().substring(8,10) + ":" +
                        w.getEnd_time().substring(10,12) + ":" +
                        w.getEnd_time().substring(12,14));
                }
                if (w.getWeight_day() != null) {
                    w.setWeight_day(w.getWeight_day() + "kg");
                }

                boolean hasValue =
                    w.getR_num()          != null ||
                    w.getStart_time()     != null ||
                    w.getEnd_time()       != null ||
                    w.getTong_day()       != null ||
                    w.getWeight_day()     != null ||
                    w.getA()              != null ||
                    w.getItem_nm()        != null ||
                    w.getItem_cd()        != null ||
                    w.getNext_facility()  != null ||
                    w.getE()              != null ||
                    w.getF()              != null;

                if (!hasValue) {
                    rowIdx2++;
                    continue;
                }

                Row r = sheet.getRow(rowIdx2);
                if (r == null) r = sheet.createRow(rowIdx2);
                int col = 0;
                getOrCreateCell.apply(r, col++).setCellValue(w.getR_num());           // 순서
                getOrCreateCell.apply(r, col++).setCellValue(w.getStart_time());      // 투입시간
                getOrCreateCell.apply(r, col++).setCellValue(w.getEnd_time());        // 완료시간
                getOrCreateCell.apply(r, col++).setCellValue(w.getTong_day());        // 투입통수
                getOrCreateCell.apply(r, col++).setCellValue(w.getWeight_day());      // 작업중량(kg)
                getOrCreateCell.apply(r, col++).setCellValue(w.getA());               // 분할횟수
                getOrCreateCell.apply(r, col++).setCellValue(w.getItem_nm());         // 품명
                getOrCreateCell.apply(r, col++).setCellValue(w.getItem_cd());         // 품번
                getOrCreateCell.apply(r, col++).setCellValue(w.getGroup_id());        // 그룹ID
                getOrCreateCell.apply(r, col++).setCellValue(w.getNext_facility());   // 후처리 사양
                getOrCreateCell.apply(r, col++).setCellValue(w.getE());               // 구분(신규/재작업)
                col++;
                getOrCreateCell.apply(r, col++).setCellValue(w.getF());               // 비고

                for (int c = 0; c < 12; c++) {
                    getOrCreateCell.apply(r, c).setCellStyle(borderStyle);
                }

                rowIdx2++;
            }

            // 10) 비고란 추가
            int remarkRowIdx = rowIdx2; // table3 끝난 다음 행에 바로
            Row remarkRow = sheet.getRow(remarkRowIdx);
            if (remarkRow == null) remarkRow = sheet.createRow(remarkRowIdx);

            // A열(0)에 "비고:"와 테두리 스타일
            Cell lbl = getOrCreateCell.apply(remarkRow, 0);
            lbl.setCellValue("비고:");
            lbl.setCellStyle(borderStyle);

            // B~F(1~5) 셀 생성 및 테두리 스타일 적용
            for (int col = 1; col <= 5; col++) {
                Cell cell = getOrCreateCell.apply(remarkRow, col);
                cell.setCellStyle(borderStyle);
            }

         // 1. B~L(1~11) 범위의 기존 병합 영역 모두 해제
            for (int i = sheet.getNumMergedRegions() - 1; i >= 0; i--) {
                CellRangeAddress region = sheet.getMergedRegion(i);
                if (region.getFirstRow() == remarkRowIdx &&
                    region.getFirstColumn() >= 1 && region.getLastColumn() <= 11) {
                    sheet.removeMergedRegion(i);
                }
            }

            // 2. B~F(1~5)로 병합
            sheet.addMergedRegion(new CellRangeAddress(remarkRowIdx, remarkRowIdx, 1, 5));
            
            // 11) 파일 저장
            String saveDir     = "D:/GEOMET양식/작업일보";
            String safeName    = rawStart;
            String mchNamePart = exMch.replaceAll("[^a-zA-Z0-9가-힣]", "");
            String outFileName = String.format("작업일보_%s_%s.xlsx", safeName, mchNamePart);
            File outFile       = new File(saveDir, outFileName);
            try (FileOutputStream fos = new FileOutputStream(outFile)) {
                wb.write(fos);
            }

            // 12) 결과 리턴
            Map<String, Object> result = new HashMap<>();
            result.put("filename", outFileName);
            result.put("downloadPath",
                "/geomet/download_workDailyReport?filename=" + URLEncoder.encode(outFileName, "UTF-8"));
            return result;
        }
    }
    //공용설비 엑셀
    
    @RequestMapping(value = "/work/workDailyReport_common/excel", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> exportWorkDaily_common_ReportExcel(@RequestBody Work work) throws Exception {
    	 DateTimeFormatter fmt = DateTimeFormatter.ofPattern("yyyyMMdd");
         DateTimeFormatter fmt2 = DateTimeFormatter.ofPattern("yyyy-MM-dd");
         // ★ 받은 원본 파라미터 로그 출력
         System.out.println("▶ Received Work:");
         System.out.println("   s_time  = " + work.getS_time());
         System.out.println("   e_time  = " + work.getE_time());
         System.out.println("   s_time2  = " + work.getM_code2());
         System.out.println("   m_code  = " + work.getM_code());

         String rawStart = work.getS_time();  // 예: "20250711"
         String rawEnd   = work.getE_time();

         // ▶ s_time2는 yyyy-MM-dd 형식으로 저장 (0800 없이)
         String sTime2 = LocalDate.parse(rawStart, fmt).format(fmt2);
         work.setS_time2(sTime2);

         // ▶ s_time은 0800 붙여서 DB용으로
         work.setS_time(rawStart + "0800");

         // ▶ e_time도 +1일 후 0800 붙이기
         LocalDate eDate = LocalDate.parse(rawEnd, fmt).plusDays(1);
         work.setE_time(eDate.format(fmt) + "0800");

        // 3) 데이터 조회
        List<Work> table1 = workService.getReportInputLIst(work);
        List<Work> table2 = workService.getWorkDailySum(work);
        List<Work> table3 = workService.getWorkDailyList(work);

        // 4) 템플릿 로드
        String templatePath = "D:/GEOMET양식/작업일보_양식/작업일보공용설비.xlsx";
        try (FileInputStream fis = new FileInputStream(templatePath);
             Workbook wb = WorkbookFactory.create(fis)) {

            Sheet sheet = wb.getSheetAt(0);

            // 헬퍼: cell 생성 보장
            BiFunction<Row, Integer, Cell> getOrCreateCell = (r, c) -> {
                Cell cell = r.getCell(c);
                return (cell != null) ? cell : r.createCell(c);
            };

            // ▶ 테두리 스타일 선언: for문 전에 한 번만 생성
            CellStyle borderStyle = wb.createCellStyle();
            borderStyle.setBorderTop(BorderStyle.THIN);
            borderStyle.setBorderBottom(BorderStyle.THIN);
            borderStyle.setBorderLeft(BorderStyle.THIN);
            borderStyle.setBorderRight(BorderStyle.THIN);

            // 5) B2 셀에 ex_mch_name 쓰기
            String exMch = work.getEx_mch_name();
            Row row1 = sheet.getRow(1);
            if (row1 == null) row1 = sheet.createRow(1);
            getOrCreateCell.apply(row1, 1).setCellValue(exMch);

            // 6) 7행(L열)에 yyyy-MM-dd 시작일자 쓰기
            LocalDate startDate = LocalDate.parse(rawStart, fmt);
            String formattedDate = startDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
            Row row7 = sheet.getRow(6);
            if (row7 == null) row7 = sheet.createRow(6);
            getOrCreateCell.apply(row7, 11).setCellValue(formattedDate);

            // 7) table1 쓰기 (6행, B열부터)
            int rowIdx = 5;
            for (Work w : table1) {
                Row r = sheet.getRow(rowIdx);
                if (r == null) r = sheet.createRow(rowIdx);
                int col = 1;
                getOrCreateCell.apply(r, col++).setCellValue(w.getVisc());
                getOrCreateCell.apply(r, col++).setCellValue(w.getPre_temp());
                getOrCreateCell.apply(r, col++).setCellValue(w.getHeat_temp());
				/*
				 * getOrCreateCell.apply(r, col++).setCellValue(w.getLiq_temp());
				 * getOrCreateCell.apply(r, col++).setCellValue(w.getSg());
				 */
                // 테두리 스타일 적용
                for (int c = 1; c <= 5; c++) {
                    getOrCreateCell.apply(r, c).setCellStyle(borderStyle);
                }
                rowIdx++;
            }

            rowIdx = 10;
            for (Work w : table2) {
                if (w.getAvg_day() != null)      w.setAvg_day(w.getAvg_day() + "kg");
                if (w.getWork_time() != null)    w.setWork_time(w.getWork_time() + "");
                if (w.getSum_time() != null)     w.setSum_time(w.getSum_time() + "hr");
                if (w.getWork_percent() != null) w.setWork_percent(w.getWork_percent() + "%");
                if (w.getSum_percent() != null)  w.setSum_percent(w.getSum_percent() + "%");

                Row r = sheet.getRow(rowIdx);
                if (r == null) r = sheet.createRow(rowIdx);
                int col = 0;
                DecimalFormat commaFormat = new DecimalFormat("#,##0");
                // ✅ Tabulator 컬럼 순서에 맞춘 셀 입력
                getOrCreateCell.apply(r, col++).setCellValue(w.getTong_day());      // 일 작업통수
             // 작업중량(kg)
                getOrCreateCell.apply(r, col++).setCellValue(
                    w.getWeight_day() != null ? commaFormat.format(w.getWeight_day()) + "kg" : ""
                );
                // 생산량
                getOrCreateCell.apply(r, col++).setCellValue(w.getAvg_day());       // 표준중량
                getOrCreateCell.apply(r, col++).setCellValue(w.getWork_time());     // 가동시간
                getOrCreateCell.apply(r, col++).setCellValue(w.getWork_percent());  // 가동률
                getOrCreateCell.apply(r, col++).setCellValue(w.getUph());           // UPH
                // 누적 생산통수
                getOrCreateCell.apply(r, col++).setCellValue(
                    w.getTong_sum() != null ? commaFormat.format(w.getTong_sum()) : ""
                );

                // 누적 생산량
                getOrCreateCell.apply(r, col++).setCellValue(
                    w.getWeight_sum() != null ? commaFormat.format(w.getWeight_sum()) : ""
                );    // 누적 생산량
                getOrCreateCell.apply(r, col++).setCellValue(w.getSum_time());      // 누적 가동시간
                getOrCreateCell.apply(r, col++).setCellValue(w.getSum_percent());   // 누적 가동률
                col++;
                getOrCreateCell.apply(r, col++).setCellValue(w.getUph_sum());       // 누적 UPH

                // ✅ 테두리 스타일 11칸만 적용
                for (int c = 0; c < 11; c++) {
                    getOrCreateCell.apply(r, c).setCellStyle(borderStyle);
                }

                rowIdx++;
            }


            // 9) table3 쓰기 (13행, A열부터)
            int rowIdx2 = 13;
            for (Work w : table3) {
                if (w.getStart_time() != null && w.getStart_time().length() == 14) {
                    w.setStart_time(
                        w.getStart_time().substring(8,10) + ":" +
                        w.getStart_time().substring(10,12) + ":" +
                        w.getStart_time().substring(12,14));
                }
                if (w.getEnd_time() != null && w.getEnd_time().length() == 14) {
                    w.setEnd_time(
                        w.getEnd_time().substring(8,10) + ":" +
                        w.getEnd_time().substring(10,12) + ":" +
                        w.getEnd_time().substring(12,14));
                }
                if (w.getWeight_day() != null) {
                    w.setWeight_day(w.getWeight_day() + "kg");
                }

                boolean hasValue =
                    w.getR_num()          != null ||
                    w.getStart_time()     != null ||
                    w.getEnd_time()       != null ||
                    w.getTong_day()       != null ||
                    w.getWeight_day()     != null ||
                    w.getA()              != null ||
                    w.getItem_nm()        != null ||
                    w.getItem_cd()        != null ||
                    w.getNext_facility()  != null ||
                    w.getE()              != null ||
                    w.getF()              != null;

                if (!hasValue) {
                    rowIdx2++;
                    continue;
                }

                Row r = sheet.getRow(rowIdx2);
                if (r == null) r = sheet.createRow(rowIdx2);
                int col = 0;
                getOrCreateCell.apply(r, col++).setCellValue(w.getR_num());           // 순서
                getOrCreateCell.apply(r, col++).setCellValue(w.getStart_time());      // 투입시간
                getOrCreateCell.apply(r, col++).setCellValue(w.getEnd_time());        // 완료시간
                getOrCreateCell.apply(r, col++).setCellValue(w.getTong_day());        // 투입통수
                getOrCreateCell.apply(r, col++).setCellValue(w.getWeight_day());      // 작업중량(kg)
                getOrCreateCell.apply(r, col++).setCellValue(w.getA());               // 분할횟수
                getOrCreateCell.apply(r, col++).setCellValue(w.getItem_nm());         // 품명
                getOrCreateCell.apply(r, col++).setCellValue(w.getItem_cd());         // 품번
                getOrCreateCell.apply(r, col++).setCellValue(w.getGroup_id());        // 그룹ID
                getOrCreateCell.apply(r, col++).setCellValue(w.getNext_facility());   // 후처리 사양
                getOrCreateCell.apply(r, col++).setCellValue(w.getE());               // 구분(신규/재작업)
                col++;
                getOrCreateCell.apply(r, col++).setCellValue(w.getF());               // 비고

                for (int c = 0; c < 12; c++) {
                    getOrCreateCell.apply(r, c).setCellStyle(borderStyle);
                }

                rowIdx2++;
            }


            // 10) 비고란 추가
            int remarkRowIdx = rowIdx2; // table3 끝난 다음 행에 바로
            Row remarkRow = sheet.getRow(remarkRowIdx);
            if (remarkRow == null) remarkRow = sheet.createRow(remarkRowIdx);

            // A열(0)에 "비고:"와 테두리 스타일
            Cell lbl = getOrCreateCell.apply(remarkRow, 0);
            lbl.setCellValue("비고:");
            lbl.setCellStyle(borderStyle);

            // B~F(1~5) 셀 생성 및 테두리 스타일 적용
            for (int col = 1; col <= 5; col++) {
                Cell cell = getOrCreateCell.apply(remarkRow, col);
                cell.setCellStyle(borderStyle);
            }

         // 1. B~L(1~11) 범위의 기존 병합 영역 모두 해제
            for (int i = sheet.getNumMergedRegions() - 1; i >= 0; i--) {
                CellRangeAddress region = sheet.getMergedRegion(i);
                if (region.getFirstRow() == remarkRowIdx &&
                    region.getFirstColumn() >= 1 && region.getLastColumn() <= 11) {
                    sheet.removeMergedRegion(i);
                }
            }

            // 2. B~F(1~5)로 병합
            sheet.addMergedRegion(new CellRangeAddress(remarkRowIdx, remarkRowIdx, 1, 5));
            
            // 11) 파일 저장
            String saveDir     = "D:/GEOMET양식/작업일보";
            String safeName    = rawStart;
            String mchNamePart = exMch.replaceAll("[^a-zA-Z0-9가-힣]", "");
            String outFileName = String.format("작업일보_%s_%s.xlsx", safeName, mchNamePart);
            File outFile       = new File(saveDir, outFileName);
            try (FileOutputStream fos = new FileOutputStream(outFile)) {
                wb.write(fos);
            }

            // 12) 결과 리턴
            Map<String, Object> result = new HashMap<>();
            result.put("filename", outFileName);
            result.put("downloadPath",
                "/geomet/download_workDailyReport?filename=" + URLEncoder.encode(outFileName, "UTF-8"));
            return result;
        }
    }

    
    
    
    
  //세척설비 엑셀
    
    @RequestMapping(value = "/work/workDailyReport_oil/excel", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> exportWorkDaily_oil_ReportExcel(@RequestBody Work work) throws Exception {
    	 DateTimeFormatter fmt = DateTimeFormatter.ofPattern("yyyyMMdd");
         DateTimeFormatter fmt2 = DateTimeFormatter.ofPattern("yyyy-MM-dd");
         // ★ 받은 원본 파라미터 로그 출력
         System.out.println("▶ Received Work:");
         System.out.println("   s_time  = " + work.getS_time());
         System.out.println("   e_time  = " + work.getE_time());
         System.out.println("   s_time2  = " + work.getM_code2());
         System.out.println("   m_code  = " + work.getM_code());

         String rawStart = work.getS_time();  // 예: "20250711"
         String rawEnd   = work.getE_time();

         // ▶ s_time2는 yyyy-MM-dd 형식으로 저장 (0800 없이)
         String sTime2 = LocalDate.parse(rawStart, fmt).format(fmt2);
         work.setS_time2(sTime2);

         // ▶ s_time은 0800 붙여서 DB용으로
         work.setS_time(rawStart + "0800");

         // ▶ e_time도 +1일 후 0800 붙이기
         LocalDate eDate = LocalDate.parse(rawEnd, fmt).plusDays(1);
         work.setE_time(eDate.format(fmt) + "0800");
        // 3) 데이터 조회
        List<Work> table1 = workService.getReportInputLIst(work);
        List<Work> table2 = workService.getWorkDailySum(work);
        List<Work> table3 = workService.getWorkDailyList(work);

        // 4) 템플릿 로드
        String templatePath = "D:/GEOMET양식/작업일보_양식/작업일보세척설비.xlsx";
        try (FileInputStream fis = new FileInputStream(templatePath);
             Workbook wb = WorkbookFactory.create(fis)) {

            Sheet sheet = wb.getSheetAt(0);

            // 헬퍼: cell 생성 보장
            BiFunction<Row, Integer, Cell> getOrCreateCell = (r, c) -> {
                Cell cell = r.getCell(c);
                return (cell != null) ? cell : r.createCell(c);
            };

            // ▶ 테두리 스타일 선언: for문 전에 한 번만 생성
            CellStyle borderStyle = wb.createCellStyle();
            borderStyle.setBorderTop(BorderStyle.THIN);
            borderStyle.setBorderBottom(BorderStyle.THIN);
            borderStyle.setBorderLeft(BorderStyle.THIN);
            borderStyle.setBorderRight(BorderStyle.THIN);

            // 5) B2 셀에 ex_mch_name 쓰기
            String exMch = work.getEx_mch_name();
            Row row1 = sheet.getRow(1);
            if (row1 == null) row1 = sheet.createRow(1);
            getOrCreateCell.apply(row1, 1).setCellValue(exMch);

            // 6) 7행(L열)에 yyyy-MM-dd 시작일자 쓰기
            LocalDate startDate = LocalDate.parse(rawStart, fmt);
            String formattedDate = startDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
            Row row7 = sheet.getRow(6);
            if (row7 == null) row7 = sheet.createRow(6);
            getOrCreateCell.apply(row7, 11).setCellValue(formattedDate);

            // 7) table1 쓰기 (6행, B열부터)
            int rowIdx = 5;
            for (Work w : table1) {
                Row r = sheet.getRow(rowIdx);
                if (r == null) r = sheet.createRow(rowIdx);
                int col = 1;
                getOrCreateCell.apply(r, col++).setCellValue(w.getVisc());
                getOrCreateCell.apply(r, col++).setCellValue(w.getPre_temp());
                getOrCreateCell.apply(r, col++).setCellValue(w.getHeat_temp());
				/*
				 * getOrCreateCell.apply(r, col++).setCellValue(w.getLiq_temp());
				 * getOrCreateCell.apply(r, col++).setCellValue(w.getSg());
				 */
                // 테두리 스타일 적용
                for (int c = 1; c <= 5; c++) {
                    getOrCreateCell.apply(r, c).setCellStyle(borderStyle);
                }
                rowIdx++;
            }

            rowIdx = 10;
            for (Work w : table2) {
                if (w.getAvg_day() != null)      w.setAvg_day(w.getAvg_day() + "kg");
                if (w.getWork_time() != null)    w.setWork_time(w.getWork_time() + "");
                if (w.getSum_time() != null)     w.setSum_time(w.getSum_time() + "hr");
                if (w.getWork_percent() != null) w.setWork_percent(w.getWork_percent() + "%");
                if (w.getSum_percent() != null)  w.setSum_percent(w.getSum_percent() + "%");

                Row r = sheet.getRow(rowIdx);
                if (r == null) r = sheet.createRow(rowIdx);
                int col = 0;
                DecimalFormat commaFormat = new DecimalFormat("#,##0");
                // ✅ Tabulator 컬럼 순서에 맞춘 셀 입력
                getOrCreateCell.apply(r, col++).setCellValue(w.getTong_day());      // 일 작업통수
                // 작업중량(kg)
                getOrCreateCell.apply(r, col++).setCellValue(
                    w.getWeight_day() != null ? commaFormat.format(w.getWeight_day()) + "kg" : ""
                );   // 생산량
                getOrCreateCell.apply(r, col++).setCellValue(w.getAvg_day());       // 표준중량
                getOrCreateCell.apply(r, col++).setCellValue(w.getWork_time());     // 가동시간
                getOrCreateCell.apply(r, col++).setCellValue(w.getWork_percent());  // 가동률
                getOrCreateCell.apply(r, col++).setCellValue(w.getUph());           // UPH
                // 누적 생산통수
                getOrCreateCell.apply(r, col++).setCellValue(
                    w.getTong_sum() != null ? commaFormat.format(w.getTong_sum()) : ""
                );

                // 누적 생산량
                getOrCreateCell.apply(r, col++).setCellValue(
                    w.getWeight_sum() != null ? commaFormat.format(w.getWeight_sum()) : ""
                );   // 누적 생산량
                getOrCreateCell.apply(r, col++).setCellValue(w.getSum_time());      // 누적 가동시간
                getOrCreateCell.apply(r, col++).setCellValue(w.getSum_percent());   // 누적 가동률
                getOrCreateCell.apply(r, col++).setCellValue(w.getUph_sum());       // 누적 UPH
                

                // ✅ 테두리 스타일 11칸만 적용
                for (int c = 0; c < 11; c++) {
                    getOrCreateCell.apply(r, c).setCellStyle(borderStyle);
                }

                rowIdx++;
            }


            // 9) table3 쓰기 (13행, A열부터)
            int rowIdx2 = 13;
            for (Work w : table3) {
                if (w.getStart_time() != null && w.getStart_time().length() == 14) {
                    w.setStart_time(
                        w.getStart_time().substring(8,10) + ":" +
                        w.getStart_time().substring(10,12) + ":" +
                        w.getStart_time().substring(12,14));
                }
                if (w.getEnd_time() != null && w.getEnd_time().length() == 14) {
                    w.setEnd_time(
                        w.getEnd_time().substring(8,10) + ":" +
                        w.getEnd_time().substring(10,12) + ":" +
                        w.getEnd_time().substring(12,14));
                }
                if (w.getWeight_day() != null) {
                    w.setWeight_day(w.getWeight_day() + "kg");
                }

                boolean hasValue =
                    w.getR_num()          != null ||
                    w.getStart_time()     != null ||
                    w.getEnd_time()       != null ||
                    w.getTong_day()       != null ||
                    w.getWeight_day()     != null ||
                    w.getA()              != null ||
                    w.getItem_nm()        != null ||
                    w.getItem_cd()        != null ||
                    w.getNext_facility()  != null ||
                    w.getE()              != null ||
                    w.getF()              != null;

                if (!hasValue) {
                    rowIdx2++;
                    continue;
                }

                Row r = sheet.getRow(rowIdx2);
                if (r == null) r = sheet.createRow(rowIdx2);
                int col = 0;
                getOrCreateCell.apply(r, col++).setCellValue(w.getR_num());           // 순서
                getOrCreateCell.apply(r, col++).setCellValue(w.getStart_time());      // 투입시간
                getOrCreateCell.apply(r, col++).setCellValue(w.getEnd_time());        // 완료시간
                getOrCreateCell.apply(r, col++).setCellValue(w.getTong_day());        // 투입통수
                getOrCreateCell.apply(r, col++).setCellValue(w.getWeight_day());      // 작업중량(kg)
                getOrCreateCell.apply(r, col++).setCellValue(w.getA());               // 분할횟수
                getOrCreateCell.apply(r, col++).setCellValue(w.getItem_nm());         // 품명
                getOrCreateCell.apply(r, col++).setCellValue(w.getItem_cd());         // 품번
                getOrCreateCell.apply(r, col++).setCellValue(w.getGroup_id());        // 그룹ID
                getOrCreateCell.apply(r, col++).setCellValue(w.getNext_facility());   // 후처리 사양
                getOrCreateCell.apply(r, col++).setCellValue(w.getE());               // 구분(신규/재작업)
                col++;
                getOrCreateCell.apply(r, col++).setCellValue(w.getF());               // 비고

                for (int c = 0; c < 12; c++) {
                    getOrCreateCell.apply(r, c).setCellStyle(borderStyle);
                }

                rowIdx2++;
            }


            // 10) 비고란 추가
            int remarkRowIdx = rowIdx2; // table3 끝난 다음 행에 바로
            Row remarkRow = sheet.getRow(remarkRowIdx);
            if (remarkRow == null) remarkRow = sheet.createRow(remarkRowIdx);

            // A열(0)에 "비고:"와 테두리 스타일
            Cell lbl = getOrCreateCell.apply(remarkRow, 0);
            lbl.setCellValue("비고:");
            lbl.setCellStyle(borderStyle);

            // B~F(1~5) 셀 생성 및 테두리 스타일 적용
            for (int col = 1; col <= 5; col++) {
                Cell cell = getOrCreateCell.apply(remarkRow, col);
                cell.setCellStyle(borderStyle);
            }

         // 1. B~L(1~11) 범위의 기존 병합 영역 모두 해제
            for (int i = sheet.getNumMergedRegions() - 1; i >= 0; i--) {
                CellRangeAddress region = sheet.getMergedRegion(i);
                if (region.getFirstRow() == remarkRowIdx &&
                    region.getFirstColumn() >= 1 && region.getLastColumn() <= 11) {
                    sheet.removeMergedRegion(i);
                }
            }

            // 2. B~F(1~5)로 병합
            sheet.addMergedRegion(new CellRangeAddress(remarkRowIdx, remarkRowIdx, 1, 5));
            
            // 11) 파일 저장
            String saveDir     = "D:/GEOMET양식/작업일보";
            String safeName    = rawStart;
            String mchNamePart = exMch.replaceAll("[^a-zA-Z0-9가-힣]", "");
            String outFileName = String.format("작업일보_%s_%s.xlsx", safeName, mchNamePart);
            File outFile       = new File(saveDir, outFileName);
            try (FileOutputStream fos = new FileOutputStream(outFile)) {
                wb.write(fos);
            }

            // 12) 결과 리턴
            Map<String, Object> result = new HashMap<>();
            result.put("filename", outFileName);
            result.put("downloadPath",
                "/geomet/download_workDailyReport?filename=" + URLEncoder.encode(outFileName, "UTF-8"));
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

     // 시작일 08시
     String sTimeWithOffset = work.getS_time() + " 08:00:00";

     // 시작일 기준 하루 뒤 08시 → 하루 간격
     LocalDate eDate = LocalDate.parse(work.getS_time(), fmt).plusDays(1);
     String eTimeWithOffset = eDate.format(fmt) + " 08:00:00";

     // yyyyMM
     String yyyyMM = work.getS_time().substring(0, 6);
     String startMonth = yyyyMM;

     // 설정
     work.setS_time(sTimeWithOffset);
     work.setE_time(eTimeWithOffset);
     work.setStart_month(startMonth);

        System.out.println("==[ 변환 모니터링 현황 ]==");
        System.out.println("s_time: " + work.getS_time());
        System.out.println("e_time: " + work.getE_time());
        System.out.println("getStart_month: " + work.getStart_month());
        

      
        Map<String, Object> result = new HashMap<>();
       
        result.put("table2", workService.MonitoringStatusList(work));
        result.put("table3", workService.MonitoringStatusList2(work));
        return result;
    }
}
