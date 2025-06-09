package com.geomet.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.sl.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import com.geomet.domain.Condition;
import com.geomet.domain.Users;
import com.geomet.domain.Work;
import com.geomet.service.ConditionService;

import com.geomet.service.ExcelService;

@Controller
public class ConditionController {


	
    @Autowired
    private ExcelService excelService; 
    
    @Autowired
    private ConditionService conditionService; 
    
	/*-----조건관리-----*/
	
	//TC 교체이력, 각종 조절계 교정이력
    @RequestMapping(value= "/condition/corrStatus", method = RequestMethod.GET)
    public String corrStatus(Model model) {
        return "/condition/corrStatus.jsp"; // 
    }
   
    @RequestMapping(value = "/condition/corrStatus/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> corrStatusList(
            @RequestParam String equipment_name,
            @RequestParam String startDate,
            @RequestParam String endDate
    ) {
        // 요청 파라미터 로그 출력
        //system.out.println("Received request:");
        //system.out.println("equipment_name: " + equipment_name);
        //system.out.println("startDate: " + startDate);
        //system.out.println("endDate: " + endDate);

        // 반환할 Map 생성
        Map<String, Object> rtnMap = new HashMap<>();

        // 서비스 계층을 통해 데이터를 가져옴
        try {
           
        	Condition condition = new Condition();
        	condition.setEquipment_name(equipment_name.isEmpty() ? null : equipment_name); 
        	condition.setStartDate(startDate.isEmpty() ? null : startDate);        
        	condition.setEndDate(endDate.isEmpty() ? null : endDate); 

            List<Condition> getCorrStatusList = conditionService.getCorrStatusList(condition);

            //system.out.println("getStandardInfoList Size: " + getCorrStatusList.size());
            // 성공 시 데이터 반환
            rtnMap.put("status", "success");
            rtnMap.put("last_page", 1);
            rtnMap.put("data", getCorrStatusList);
        } catch (Exception e) {
            // 에러 발생 시 에러 메시지 반환
            //system.out.println("Error occurred: " + e.getMessage());
            rtnMap.put("status", "error");
            rtnMap.put("message", e.getMessage());
        }

        return rtnMap;
    }
    
    // T/C추가
    @RequestMapping(value = "/condition/corrStatus/insert", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> saveCorrStatus(@ModelAttribute Condition condition) {

        Map<String, Object> rtnMap = new HashMap<>();

        try {
            if (condition.getNo() == null || condition.getNo().trim().isEmpty()) {
                rtnMap.put("result", "fail");
                rtnMap.put("message", "존 구분을 입력하시오!");
                return rtnMap;
            }

            // 실제 저장 로직 실행
            conditionService.saveCorrStatus(condition);

            rtnMap.put("result", "success");
        } catch (Exception e) {
            rtnMap.put("result", "fail");
            rtnMap.put("message", "저장 중 오류가 발생했습니다: " + e.getMessage());
        }

        return rtnMap;
    }

    // T/C삭제
    @RequestMapping(value = "/condition/corrStatus/del", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> delCorrStatus(@RequestBody Condition condition) {
        Map<String, Object> rtnMap = new HashMap<>();

        if (condition.getNo() == null) {
            rtnMap.put("data", "행 선택하세요");
            return rtnMap;
        }

        conditionService.delCorrStatus(condition);

        rtnMap.put("data", "success"); 
        return rtnMap;
    }
    

    //T/C 엑섹 저장
    @RequestMapping(value = "/condition/corrStatus/excel", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> corrStatusExcel(
    		  @RequestParam String equipment_name,
              @RequestParam String startDate,
              @RequestParam String endDate
    		
    ) {
    	//system.out.println("엑셀 다운로드 요청 params:");
        //system.out.println("equipment_name = " + equipment_name);
        //system.out.println("startDate = " + startDate);
        //system.out.println("endDate = " + endDate);
        
        Map<String, Object> rtnMap = new HashMap<>();

        // 날짜 및 파일명 생성
        SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd'_GEOMET양식_'HHmmss");
        Date time = new Date();
        String fileName = format.format(time) + ".xls";

        FileOutputStream fos = null;
        FileInputStream fis = null;
        String openPath = "D:/GEOMET양식/";
        String savePath = "D:/GEOMET양식/TC교체이력/";


        Condition condition = new Condition();
        condition.setEquipment_name(equipment_name);
        condition.setStartDate(startDate);
        condition.setEndDate(endDate);

        // 필터링된 데이터만 조회
        List<Condition> getCorrStatusList = conditionService.getCorrStatusList(condition);

        //system.out.println("TC조회된 건수: " + (getCorrStatusList != null ? getCorrStatusList.size() : 0));

        if (getCorrStatusList == null || getCorrStatusList.isEmpty()) {
            rtnMap.put("error", "데이터 없음");
            return rtnMap;
        }

        try {
            fis = new FileInputStream(openPath + "03_01.조건관리_TC교체이력.xlsx");
            XSSFWorkbook workbook = new XSSFWorkbook(fis);
            XSSFSheet sheet = workbook.getSheetAt(0);

            XSSFCellStyle styleCenterBorder = workbook.createCellStyle();
            styleCenterBorder.setAlignment(HorizontalAlignment.CENTER);
            styleCenterBorder.setBorderTop(BorderStyle.THIN);
            styleCenterBorder.setBorderBottom(BorderStyle.THIN);
            styleCenterBorder.setBorderLeft(BorderStyle.THIN);
            styleCenterBorder.setBorderRight(BorderStyle.THIN);

            String[] fields = {
                "no", "equipment_name", "location", "serial_number", "replacement_date", "next_date",
                "replacement_cycle", "remarks"
            };

            int startRow = 6; // 7
            int startCol = 0; // A

            for (int i = 0; i < getCorrStatusList.size(); i++) {
            	Condition item = getCorrStatusList.get(i);
                XSSFRow row = sheet.createRow(startRow + i);

                for (int j = 0; j < fields.length; j++) {
                    XSSFCell cell = row.createCell(startCol + j);
                    String value = "";

                    try {
                        Field field = Condition.class.getDeclaredField(fields[j]);
                        field.setAccessible(true);
                        Object fieldValue = field.get(item);
                        value = (fieldValue != null) ? fieldValue.toString() : "";
                    } catch (NoSuchFieldException | IllegalAccessException e) {
                        value = "";
                    }

                    cell.setCellValue(value);
                    cell.setCellStyle(styleCenterBorder);
                }
            }

            workbook.setForceFormulaRecalculation(true);
            fos = new FileOutputStream(savePath + fileName);
            workbook.write(fos);
            workbook.close();
            fos.flush();

            rtnMap.put("data", savePath + fileName);

        } catch (Exception e) {
            e.printStackTrace();
            rtnMap.put("error", "엑셀 파일 생성 중 오류 발생");
        } finally {
            try {
                if (fis != null) fis.close();
                if (fos != null) fos.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        return rtnMap;
    }



	
	//조건관리
    @RequestMapping(value= "/condition/machinePartTemp", method = RequestMethod.GET)
    public String machinePartTemp(Model model) {
        return "/condition/machinePartTemp.jsp"; // 
    }
    
    
    @RequestMapping(value = "/condition/machinePartTemp/update", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> machinePartTempUpdate(@RequestParam Map<String, String> params) {
        Map<String, Object> rtnMap = new HashMap<String, Object>();

        //system.out.println("넘어온 파라미터:");
        for (Map.Entry<String, String> entry : params.entrySet()) {
            //system.out.println(entry.getKey() + ": " + entry.getValue());
        }
        String idStr = params.get("id");
        String date = params.get("date");
        String filed = params.get("filed");
        String value = params.get("value");

        if (idStr == null || date == null || filed == null || value == null) {
            rtnMap.put("data", "모든 필드를 입력하세요!");
            return rtnMap;
        }

        int idInt;
        try {
            idInt = Integer.parseInt(idStr);
        } catch (NumberFormatException e) {
            rtnMap.put("data", "ID는 숫자여야 합니다.");
            return rtnMap;
        }

        Condition condition = new Condition();
        condition.setId(idInt);
        condition.setDate(date);
        condition.setFiled(filed);
        condition.setValue(value);

        conditionService.machinePartTempUpdate(condition);

        rtnMap.put("data", "성공적으로 업데이트되었습니다!");
        return rtnMap;

    }

    
    
    
    
    
    
    // 재고관리(약품) 조절 리스트
    @RequestMapping(value = "/condition/machinePartTemp/list", method = RequestMethod.POST)
    @ResponseBody
    public List<Condition> getconditionList(Condition condition) {
        //system.out.println(">>> startDate: " + condition.getStartDate());
        //system.out.println(">>> mch_code: " + condition.getMch_code());
        return conditionService.getconditionList(condition);
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
    
    //기준정보 리스트
    @RequestMapping(value = "/condition/divisionWeight/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> workDetailList(
            @RequestParam String group_id,
            @RequestParam String item_cd,
            @RequestParam String item_nm
    ) {
        // 요청 파라미터 로그 출력
/*    	
        //system.out.println("Received request:");
        //system.out.println("plating_no: " + plating_no);
        //system.out.println("pum_name: " + pum_name);
        //system.out.println("surface_spec_in: " + surface_spec);
*/
        // 반환할 Map 생성
        Map<String, Object> rtnMap = new HashMap<>();

        // 서비스 계층을 통해 데이터를 가져옴
        try {
           
        	Condition standardInfo = new Condition();
        	standardInfo.setGroup_id(group_id.isEmpty() ? null : group_id); 
            standardInfo.setItem_cd(item_cd.isEmpty() ? null : item_cd);        
            standardInfo.setItem_nm(item_nm.isEmpty() ? null : item_nm); 

            List<Condition> standardInfoList = conditionService.getStandardInfoList(standardInfo);

     //       //system.out.println("getStandardInfoList Size: " + standardInfoList.size());
            // 성공 시 데이터 반환
            rtnMap.put("status", "success");
            rtnMap.put("last_page", 1);
            rtnMap.put("data", standardInfoList);
        } catch (Exception e) {
            // 에러 발생 시 에러 메시지 반환
       //     //system.out.println("Error occurred: " + e.getMessage());
            rtnMap.put("status", "error");
            rtnMap.put("message", e.getMessage());
        }

        return rtnMap;
    }
    
    //기준정보 추가
    @RequestMapping(value = "/condition/divisionWeight/insert", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> saveDivisionWeight(@ModelAttribute Condition condition) {
        
        Map<String, Object> rtnMap = new HashMap<String, Object>();
        
        if(condition == null) {
        	rtnMap.put("data", "기준정보가 없습니다.");
        }else {
	        if(condition.getItem_cd() == null) {
	        	rtnMap.put("data", "도금 푼번을 입력하시오!");
	        }
	       conditionService.saveDivisionWeight(condition);         	
        }
        return rtnMap;
    }
    
    @RequestMapping(value = "/condition/divisionWeight/del", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> delDivisionWeight(@RequestBody Condition condition) {
        Map<String, Object> rtnMap = new HashMap<>();

        if (condition.getItem_cd() == null) {
            rtnMap.put("data", "행 선택하세요");
            return rtnMap;
        }

        conditionService.delDivisionWeight(condition);

        rtnMap.put("data", "success"); // 응답도 명확히
        return rtnMap;
    }
    //기준정보 엑섹 저장
    @RequestMapping(value = "/condition/divisionWeight/excel", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> divisionWeightExcel(HttpServletRequest request) {
        Map<String, Object> rtnMap = new HashMap<>();
        Condition standardInfo = new Condition();

		/*
		 * SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd'_GEOMET양식_'HHmmss");
		 * Date time = new Date(); String fileName = format.format(time) + ".xlsx";
		 */
   	 
        String fileName = "기준정보.xlsx";

        
        
        FileOutputStream fos = null;
        FileInputStream fis = null;
        String openPath = "D:/GEOMET양식/";
        String savePath = "D:/GEOMET양식/기준정보/";

        List<Condition> standardInfoList = conditionService.getStandardInfoList(standardInfo);
		/*
		 * // 받아온 데이터 개수 출력 //system.out.println("getStandardInfoList Size: " +
		 * (standardInfoList != null ? standardInfoList.size() : 0));
		 */
        if (standardInfoList == null || standardInfoList.isEmpty()) {
            rtnMap.put("error", "데이터 없음");
            return rtnMap;
        }

        try {
            fis = new FileInputStream(openPath + "03_05.조건관리_지오메트 분할기준중량.xlsx");
            XSSFWorkbook workbook = new XSSFWorkbook(fis);
            XSSFSheet sheet = workbook.getSheetAt(0);

            XSSFCellStyle styleCenterBorder = workbook.createCellStyle();
            styleCenterBorder.setAlignment(HorizontalAlignment.CENTER);
            styleCenterBorder.setBorderTop(BorderStyle.THIN);
            styleCenterBorder.setBorderBottom(BorderStyle.THIN);
            styleCenterBorder.setBorderLeft(BorderStyle.THIN);
            styleCenterBorder.setBorderRight(BorderStyle.THIN);



            String[] fields = {
            	    "group_id",
            	    "item_cd",
            	    "item_nm",
            	    "mach_main",
            	    "mach_main_weight",
            	    "mach_sub",
            	    "mach_sub_weight",
            	    "mlpl_weight",
            	    "kblack_weight"
            	};


            int startRow = 6;

            for (int i = 0; i < standardInfoList.size(); i++) {
                Condition item = standardInfoList.get(i);
                XSSFRow row = sheet.createRow(startRow + i);

                XSSFCell indexCell = row.createCell(0);
                indexCell.setCellValue(i + 1);
                indexCell.setCellStyle(styleCenterBorder);

                StringBuilder logOutput = new StringBuilder("Row " + (i + 1) + " | ");

                for (int j = 0; j < fields.length; j++) {
                    XSSFCell cell = row.createCell(j + 1);

                    String value = "";
                    try {
                        Field field = Condition.class.getDeclaredField(fields[j]);
                        field.setAccessible(true);
                        Object fieldValue = field.get(item);
                        value = (fieldValue != null) ? fieldValue.toString() : "";
                    } catch (NoSuchFieldException | IllegalAccessException e) {
                        value = "";
                    }

                    cell.setCellValue(value);
                    cell.setCellStyle(styleCenterBorder);

                    // 로그 출력용 문자열 추가
                    logOutput.append(fields[j]).append(": ").append(value).append(", ");
                }
                
                // 각 행별 데이터 출력
              //  //system.out.println(logOutput.toString());
            }

            workbook.setForceFormulaRecalculation(true);
            fos = new FileOutputStream(savePath + fileName);
            workbook.write(fos);
            workbook.close();
            fos.flush();

            rtnMap.put("data", savePath + fileName);

        } catch (Exception e) {
            e.printStackTrace();
            rtnMap.put("error", "엑셀 파일 생성 중 오류 발생");
        } finally {
            try {
                if (fis != null) fis.close();
                if (fos != null) fos.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        return rtnMap;
    }
    
    
    
    
    
    
    
    
    
    @RequestMapping(value = "/download_divisionWeight", method = RequestMethod.GET)
    public void downloadExcel(HttpServletResponse response) throws IOException {
        // 고정된 파일명과 경로
        String baseDir = "D:/GEOMET양식/기준정보/";
        String fileName = "기준정보.xlsx";

        File file = new File(baseDir + fileName);

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

        String encodedFilename = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");

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

    
    
    

 // 기준정보 엑셀 인풋
    @RequestMapping(value = "/condition/divisionWeight/excelFileInput", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> importExcel(@RequestParam("file") MultipartFile file) {
        Map<String, Object> rtnMap = new HashMap<>();

        if (file.isEmpty()) {
            rtnMap.put("success", false);
            rtnMap.put("error", "파일이 비어 있습니다.");
            return rtnMap;
        }

        try {
            // 엑셀 파싱
            List<Condition> importedData = excelService.parseExcelFile(file);

            for (Condition condition : importedData) {
                condition.setPlac_cd("JH_KR_01");
                condition.setPlnt_cd("02");

                conditionService.saveDivisionWeight(condition);
            }

            rtnMap.put("success", true);
            rtnMap.put("message", "엑셀 데이터가 성공적으로 업로드되었습니다.");
        } catch (IllegalArgumentException e) {
            // ITEM_CD 누락 등 사용자 입력 관련 오류
            e.printStackTrace();
            rtnMap.put("success", false);
            rtnMap.put("error", e.getMessage());
        } catch (Exception e) {
            // 기타 시스템 오류
            e.printStackTrace();
            rtnMap.put("success", false);
            rtnMap.put("error", "엑셀 파일 처리 중 오류가 발생했습니다.");
        }

        return rtnMap;
    }

   
    // 액교반탱크일지
    @RequestMapping(value = "/condition/machineliquidmanage/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getworkDailyReportList(@RequestBody Condition condition) {
       // //system.out.println("받은 getIn_date 값: " + condition.getIn_date());
     //   //system.out.println("mch_name: " + condition.getMch_name());
        Map<String, Object> result = new HashMap<>();
        List<?> table1 = conditionService.getMachineliquidmanage(condition);
        List<?> table2 = conditionService.getMachineliquidmanage2(condition);

     //   //system.out.println("table1 리턴값: " + table1);
     //   //system.out.println("table2 리턴값: " + table2);

        result.put("table1", table1);
        result.put("table2", table2);
        return result;
    }
    // 액교반탱크일지2
    @RequestMapping(value = "/condition/machineliquidmanage2/list", method = RequestMethod.POST)
    @ResponseBody
    public List<Condition> getMachineliquidmanage2(Condition condition) {
   //     //system.out.println(">>> in_date2: " + condition.getIn_date());
   //     //system.out.println(">>> mch_name2: " + condition.getMch_nname());
        return conditionService.getMachineliquidmanage2(condition);
    }
    
    //액교반탱크일지 추가
    @RequestMapping(value = "/condition/machineliquidmanage/insert", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> insertMachineliquidmanage(@ModelAttribute Condition condition) {
        
        Map<String, Object> rtnMap = new HashMap<String, Object>();
        
   //     //system.out.println("받은 ID: " + condition.getId());
       conditionService.insertMachineliquidmanage(condition); 
        
        return rtnMap;
    }
    //액교반탱크일지 추가
    @RequestMapping(value = "/condition/machineliquidmanage2/insert", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> insertMachineliquidmanage2(@ModelAttribute Condition condition) {
        
        Map<String, Object> rtnMap = new HashMap<String, Object>();
        
      //  //system.out.println("받은 ID: " + condition.getId());
       conditionService.insertMachineliquidmanage2(condition); 
        
        return rtnMap;
    }
    @RequestMapping(value = "/condition/machineliquidmanage/del", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteMachineliquidmanage(@RequestBody Condition condition) {
        Map<String, Object> rtnMap = new HashMap<>();
        
    //    //system.out.println("삭제 요청 ID: " + condition.getId());
        conditionService.deleteMachineliquidmanage(condition);
        
        return rtnMap;
    }

    @RequestMapping(value = "/condition/machineliquidmanage2/del", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteMachineliquidmanage2(@RequestBody Condition condition) {
        Map<String, Object> rtnMap = new HashMap<>();
        
    //    //system.out.println("삭제 요청 ID: " + condition.getId());
        conditionService.deleteMachineliquidmanage2(condition);
        
        return rtnMap;
    }


    
    
}
