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
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
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
import com.geomet.domain.UserLog;
import com.geomet.domain.Users;
import com.geomet.service.ConditionService;
import com.geomet.service.ExcelService;
import com.geomet.service.UserService;

@Controller
public class ConditionController {


	
    @Autowired
    private ExcelService excelService; 
    
    @Autowired
    private UserService UserService;
    
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
                        
//            UserController.USER_CODE;
            

            
            
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
            @RequestParam String coating_nm,
            @RequestParam String group_id,
            @RequestParam String item_cd,
            @RequestParam String item_nm
    ) {
        Map<String, Object> rtnMap = new HashMap<>();

        String now = java.time.LocalDateTime.now().format(java.time.format.DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        System.out.println("기준정보 조회시간"+ now );
        System.out.println("=================================");

        try {
            Condition standardInfo = new Condition();

            standardInfo.setCoating_nm(coating_nm.isEmpty() ? null : coating_nm); 
            standardInfo.setGroup_id(group_id.isEmpty() ? null : group_id); 
            standardInfo.setItem_cd(item_cd.isEmpty() ? null : item_cd);        
            standardInfo.setItem_nm(item_nm.isEmpty() ? null : item_nm); 

            List<Condition> standardInfoList = conditionService.getStandardInfoList(standardInfo);

            rtnMap.put("status", "success");
            rtnMap.put("last_page", 1);
            rtnMap.put("data", standardInfoList);
        } catch (Exception e) {
            System.out.println("Error occurred: " + e.getMessage());
            rtnMap.put("status", "error");
            rtnMap.put("message", e.getMessage());
        }

        return rtnMap;
    }

    
    //기준정보 추가
    @RequestMapping(value = "/condition/divisionWeight/insert", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> saveDivisionWeight(@ModelAttribute Condition condition) {

        Map<String, Object> rtnMap = new HashMap<>();
        condition.setPlac_cd("JH_KR_01");
        condition.setPlnt_cd("02");

        // USER_NAME을 USER_ID에 저장
        condition.setUser_id(UserController.USER_NAME);

        // 현재 시간 (yyyyMMddHHmm 포맷) → UPD_DT에 저장
        String nowTime = java.time.LocalDateTime.now().format(
            java.time.format.DateTimeFormatter.ofPattern("yyyyMMddHHmm")
        );
        condition.setUpd_dt(nowTime);

        // 유효성 검사
        if (condition.getItem_cd() == null || condition.getItem_cd().trim().isEmpty()) {
            rtnMap.put("success", false);
            rtnMap.put("message", "도금 품번을 입력하시오!");
            return rtnMap;
        }

        // 저장 수행
        conditionService.saveDivisionWeight(condition);

        // 로그 설정 및 저장
        UserLog userLog = new UserLog();
        userLog.setUserCode(UserController.USER_CODE);
        userLog.setPageCode("c05");
        userLog.setWorkDesc("추가");
        userLog.setWorkUrl("/condition/divisionWeight/insert");
        userLog.setFileName("없음");

        // 올바른 서비스 객체 사용
        UserService.insertUserLog(userLog);

        // 로그 출력
        String now = java.time.LocalDateTime.now().format(
            java.time.format.DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")
        );
        System.out.println("========== [기준정보 추가 요청 시간: " + now + "] ==========");
        System.out.println("USER_CODE  : " + UserController.USER_CODE);
        System.out.println("USER_NAME  : " + UserController.USER_NAME);
        System.out.println("WorkDesc   : " + userLog.getWorkDesc());

        // 저장된 객체를 그대로 반환 (Tabulator에 추가하기 위해)
        rtnMap.put("success", true);
        // rtnMap.put("data", condition); // 필요 시 주석 해제

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

        UserLog userLog = new UserLog();
        userLog.setUserCode(UserController.USER_CODE);
        userLog.setPageCode("c05");
        userLog.setWorkDesc("삭제");
        userLog.setWorkUrl("/condition/divisionWeight/del");
        userLog.setFileName("없음"); 
        UserService.insertUserLog(userLog); 

        conditionService.delDivisionWeight(condition);
        Condition standardInfo = new Condition();
        List<Condition> standardInfoList = conditionService.getStandardInfoList(standardInfo);

        rtnMap.put("status", "success");
        rtnMap.put("last_page", 1);
        rtnMap.put("data", standardInfoList);
        rtnMap.put("data", "success");
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
   	 
        
        
        
        UserLog userLog = new UserLog();
        userLog.setUserCode(UserController.USER_CODE);
        userLog.setPageCode("c05");
        userLog.setWorkDesc("엑셀저장");
        userLog.setWorkUrl("/condition/divisionWeight/excel");
        userLog.setFileName("기준정보"); 
        UserService.insertUserLog(userLog); 
        
        
        
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
            	    "coating_nm",
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
        
        
        UserLog userLog = new UserLog();
        userLog.setUserCode(UserController.USER_CODE);
        userLog.setPageCode("c05");
        userLog.setWorkDesc("엑셀 업로드");
        userLog.setWorkUrl("/condition/divisionWeight/excelFileInput");
        userLog.setFileName("기준정보"); 
        UserService.insertUserLog(userLog); 

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

  // 세척관리
    @RequestMapping(value= "/condition/divisionWashing", method = RequestMethod.GET)
    public String divisionWashing(Model model) {
        return "/condition/divisionWashing.jsp"; // 
    }
    // 세척관리
    @RequestMapping(value = "/condition/divisionWashing/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> divisionWashingList(Condition condition) {
        List<Condition> list = conditionService.divisionWashingList(condition);
        Map<String,Object> rtn = new HashMap<>();
        rtn.put("status", "success");
        rtn.put("data", list);
        return rtn;
    }

    //세척관리
    @RequestMapping(
    	    value = "/condition/divisionWashing/updateBatch",
    	    method = RequestMethod.POST,
    	    consumes = "application/json",
    	    produces = "application/json"
    	)
    	@ResponseBody
    	public Map<String, Object> divisionWashingUpdateBatch(@RequestBody List<Condition> conditionList,  HttpServletRequest request) {
    	    Map<String, Object> rtnMap = new HashMap<>();

    	    try {
    	        for (Condition condition : conditionList) {
    	            condition.setUser_id(getSessionUser(request).getUser_name());

    	            String nowTime = java.time.LocalDateTime.now().format(
    	                java.time.format.DateTimeFormatter.ofPattern("yyyyMMddHHmm")
    	            );
    	            condition.setUpd_dt(nowTime);

    	            // 🔽 이전 값도 함께 출력
    	            System.out.println("📝 세척변경 정보 확인");
    	            System.out.println("  ▶ code_name : " + condition.getCode_name());
    	            System.out.println("  ▶ option02  : " + condition.getOption02());    	       
    	            System.out.println("  ▶ op2_old   : " + condition.getOp2_old());
    	            System.out.println("  ▶ option03  : " + condition.getOption03());
    	            System.out.println("  ▶ op3_old   : " + condition.getOp3_old());
    	            System.out.println("  ▶ option04  : " + condition.getOption04());
    	            System.out.println("  ▶ op4_old   : " + condition.getOp4_old());
    	            System.out.println("  ▶ option05  : " + condition.getOption05());
    	            System.out.println("  ▶ op5_old   : " + condition.getOp5_old());
    	            System.out.println("  ▶ USER_ID   : " + condition.getUser_id());
    	            System.out.println("  ▶ UPD_DT    : " + condition.getUpd_dt());
    	            System.out.println("----------------------------------------");

    	            conditionService.divisionWashingUpdate(condition); // 실제 업데이트
    	            conditionService.divisionWashingLog(condition);
    	        }

    	        rtnMap.put("status", "success");
    	    } catch (Exception e) {
    	        rtnMap.put("status", "fail");
    	        rtnMap.put("message", e.getMessage());
    	    }

    	    return rtnMap;
    	}

    // 세척관리
    @RequestMapping(value = "/condition/divisionWashing/log", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> divisionWashingLogList(Condition condition) {
        List<Condition> list = conditionService.divisionWashingLogList(condition);
        Map<String,Object> rtn = new HashMap<>();
        rtn.put("status", "success");
        rtn.put("data", list);
        return rtn;
    }
    
    public Users getSessionUser(HttpServletRequest request) {
        Users u = null;
        
        if(request.getSession() != null){
           HttpSession ss = request.getSession();
           
           u = (Users)ss.getAttribute("loginUser");
        }
         
         return u;
      }



 // 일상점검일지
    @RequestMapping(value = "/condition/dailyCheck/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> dailyCheckList(@RequestBody Condition condition) {
        System.out.println("▶ 요청 파라미터:");
        System.out.println("   s_time = " + condition.getS_time());
        System.out.println("   e_time = " + condition.getE_time());
        System.out.println("   m_code = " + condition.getM_code());

        List<Condition> list = conditionService.dailyCheckList(condition);
        System.out.println("▶ 일상정검일지 조회 결과 건수: " + (list != null ? list.size() : 0));

        Map<String, Object> result = new HashMap<>();
        result.put("table3", list);
        return result;
    }

	//후처리 액교반 관리일지
    @RequestMapping(value= "/condition/afterLiquidManage", method = RequestMethod.GET)
    public String afterLiquidManage(Model model) {
        return "/condition/afterLiquidManage.jsp"; // 
    }
    
	// 액투입 관리일지 엑셀
	@RequestMapping(value = "/condition/afterLiquidManage/excel", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> afterLiquidManageExcek(@RequestBody Condition condition,
			@RequestParam(required = false) String startDate) {
		System.out.println("엑셀 컨트롤러 도착");
		//System.out.println("quality.getDate()" + quality.getDate());

		Map<String, Object> rtnMap = new HashMap<>();

		// 날짜 및 파일명 생성
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd'_액투입 관리일지 엑셀_'HHmmss");
		Date time = new Date();
		String fileName = format.format(time) + ".xlsx";

		FileOutputStream fos = null;
		FileInputStream fis = null;
		String openPath = "D:/GEOMET양식/";
		String savePath = "D:/GEOMET양식/액투입 관리일지/";
		
		// 필터링된 데이터만 조회
		List<Condition> datas = conditionService.getMachineliquidmanage2(condition);
		// System.out.println("조회된 건수: " + (getMachineList != null ?
		// getMachineList.size() : 0));

		if (datas == null || datas.isEmpty()) {
			rtnMap.put("error", "데이터 없음");
			return rtnMap;
		}

		try {
			fis = new FileInputStream(openPath + "액투입 관리일지 엑셀 양식.xlsx");
			XSSFWorkbook workbook = new XSSFWorkbook(fis);
			XSSFSheet sheet = workbook.getSheetAt(0);
			
			// 테두리 스타일 객체 생성
			XSSFCellStyle borderStyle = workbook.createCellStyle();
			borderStyle.setBorderTop(BorderStyle.THIN);
			borderStyle.setBorderBottom(BorderStyle.THIN);
			borderStyle.setBorderLeft(BorderStyle.THIN);
			borderStyle.setBorderRight(BorderStyle.THIN);
			
			// K7: 기간 (row=6, col=8)
			String sDate = condition.getIn_date();   // 시작날짜
			String eDate = condition.getEndDate();   // 끝날짜
			String periodText = (sDate == null ? "" : sDate) + " ~ " + (eDate == null ? "" : eDate);

			XSSFRow row7 = sheet.getRow(6); 
			if(row7 == null) {
				row7 = sheet.createRow(6);
			}
			XSSFCell cellI7 = row7.getCell(10);
			if(cellI7 == null) {
				cellI7 = row7.createCell(10);
			}
			cellI7.setCellValue(periodText);   // 템플릿 스타일 유지

			// I8: 설비명 (row=7, col=8)
			String mchName = condition.getMch_name();

			XSSFRow row8 = sheet.getRow(7);
			if(row8 == null) {
				row8 = sheet.createRow(7);
			}
			XSSFCell cellI8 = row8.getCell(10);
			if(cellI8 == null) {
				row8.createCell(10);
			}
			cellI8.setCellValue(mchName == null ? "" : mchName);  // 템플릿 스타일 유지

			// 기존 스타일을 유지하면서 데이터만 삽입
			String[] fields = { "in_date", "mch_name", "tank_no", "ck_time2", "ck_time", "specific_gravity", "operator",
					"liquid_lot_no", "liquid_viscosity", "liquid_in", "distilles_in", "viscosity_after"};

			int startRow = 10; // B11부터 시작 (row index는 0부터니까 10번 인덱스가 11번째 줄)
			int startCol = 0; // A열 (index 0)

			for (int i = 0; i < datas.size(); i++) {
				Condition item = datas.get(i);
				XSSFRow row = sheet.getRow(startRow + i);
				if (row == null)
					row = sheet.createRow(startRow + i);

				for (int j = 0; j < fields.length; j++) {
					XSSFCell cell = row.getCell(startCol + j);
					if (cell == null)
						cell = row.createCell(startCol + j);

					String value = "";
					try {
						Field field = Condition.class.getDeclaredField(fields[j]);
						field.setAccessible(true);
						Object fieldValue = field.get(item);
						value = (fieldValue != null) ? fieldValue.toString() : "";
					} catch (NoSuchFieldException | IllegalAccessException e) {
						value = "";
					}

					cell.setCellValue(value); // ✅ 스타일 유지
					cell.setCellStyle(borderStyle); //테두리
				}
			}

			workbook.setForceFormulaRecalculation(true);
			fos = new FileOutputStream(savePath + fileName);
			workbook.write(fos);
			workbook.close();
			fos.flush();

            // 클라이언트가 다운로드할 수 있도록 경로 반환
            rtnMap.put("filename", fileName);
            rtnMap.put("downloadPath",
                  "/geomet/download_afterLiquidManage?filename=" + URLEncoder.encode(fileName, "UTF-8"));


		} catch (Exception e) {
			e.printStackTrace();
			rtnMap.put("error", "엑셀 파일 생성 중 오류 발생");
		} finally {
			try {
				if (fis != null)
					fis.close();
				if (fos != null)
					fos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return rtnMap;
	}
	
	 // 액투입 관리일지 엑셀 다운로드
	 @RequestMapping(value = "/download_afterLiquidManage", method = RequestMethod.GET)
	 public void download_liquidManage(@RequestParam("filename") String filename, HttpServletResponse response)
	       throws IOException {

	    // 파일이 저장된 경로
	    String baseDir = "D:/GEOMET양식/액투입 관리일지/";

	    // System.out.println("다운 주소 filename: " + filename);

	    // 보안 체크
	    if (filename.contains("..") || filename.contains("/") || filename.contains("\\")) {
	       response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
	       return;
	    }

	    // 다운로드할 파일 객체 생성
	    File file = new File(baseDir + filename);
	    System.out.println("파일 전체 경로: " + file.getAbsolutePath());

	    // 파일이 존재하지 않으면 에러 반환
	    if (!file.exists()) {
	       response.setStatus(HttpServletResponse.SC_NOT_FOUND);
	       return;
	    }

	    // 파일 확장자 자동 추정
	    String mimeType = Files.probeContentType(file.toPath());
	    if (mimeType == null) {
	       mimeType = "application/octet-stream";
	    }
	    response.setContentType(mimeType);
	    response.setContentLengthLong(file.length());

	    // 파일명 인코딩
	    String encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");

	    // 다운로드 되도록 브라우저에 알림
	    response.setHeader("Content-Disposition", "attachment; filename*=UTF-8''" + encodedFilename);

	    // 파일을 바이트 스트림으로 클라이언트에 전송
	    try (FileInputStream fis = new FileInputStream(file); OutputStream os = response.getOutputStream()) {
	       byte[] buffer = new byte[1024];
	       int len;
	       while ((len = fis.read(buffer)) != -1) {
	          os.write(buffer, 0, len);
	       }
	       os.flush();
	    }
	 }
	 
		// 액교반 관리일지 엑셀
		@RequestMapping(value = "/condition/machineLiquidManage/excel", method = RequestMethod.POST)
		@ResponseBody
		public Map<String, Object> machineLiquidManageExcek(@RequestBody Condition condition,
				@RequestParam(required = false) String startDate) {
			System.out.println("엑셀 컨트롤러 도착");
			System.out.println("condition.getMch_name(): " + condition.getMch_name());
			//System.out.println("quality.getDate()" + quality.getDate());

			Map<String, Object> rtnMap = new HashMap<>();

			// 날짜 및 파일명 생성
			SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd'_액교반 관리일지 엑셀_'HHmmss");
			Date time = new Date();
			String fileName = format.format(time) + ".xlsx";

			FileOutputStream fos = null;
			FileInputStream fis = null;
			String openPath = "D:/GEOMET양식/";
			String savePath = "D:/GEOMET양식/액교반 관리일지/";
			
			// 필터링된 데이터만 조회
			List<Condition> datas = conditionService.getMachineliquidmanage(condition);
			// System.out.println("조회된 건수: " + (getMachineList != null ?
			// getMachineList.size() : 0));

			if (datas == null || datas.isEmpty()) {
				rtnMap.put("error", "데이터 없음");
				return rtnMap;
			}

			if(condition.getMch_name().equals("G600")|| condition.getMch_name().equals("G800")) {
			try {
				fis = new FileInputStream(openPath + "액교반 관리일지 엑셀 양식1.xlsx");
				XSSFWorkbook workbook = new XSSFWorkbook(fis);
				XSSFSheet sheet = workbook.getSheetAt(0);
				
				// 테두리 스타일 객체 생성
				XSSFCellStyle borderStyle = workbook.createCellStyle();
				borderStyle.setBorderTop(BorderStyle.THIN);
				borderStyle.setBorderBottom(BorderStyle.THIN);
				borderStyle.setBorderLeft(BorderStyle.THIN);
				borderStyle.setBorderRight(BorderStyle.THIN);
				
				//엑셀 스타일 정의(빨간색으로 입력)
				XSSFCellStyle redStyle = workbook.createCellStyle();
				XSSFFont redFont = workbook.createFont();
				redFont.setColor(IndexedColors.RED.getIndex());
				redStyle.setFont(redFont);
				
				//빨간색, 테두리
				XSSFCellStyle redBorderStyle = workbook.createCellStyle();
				redBorderStyle.cloneStyleFrom(borderStyle);
				redBorderStyle.setFont(redFont);
				
				// K7: 기간 (row=6, col=8)
				String sDate = condition.getIn_date();   // 시작날짜
				String eDate = condition.getEndDate();   // 끝날짜
				String periodText = (sDate == null ? "" : sDate) + " ~ " + (eDate == null ? "" : eDate);

				XSSFRow row7 = sheet.getRow(6); 
				if(row7 == null) {
					row7 = sheet.createRow(6);
				}
				XSSFCell cellI7 = row7.getCell(13);
				if(cellI7 == null) {
					cellI7 = row7.createCell(13);
				}
				cellI7.setCellValue(periodText);   // 템플릿 스타일 유지

				// I8: 설비명 (row=7, col=8)
				String mchName = condition.getMch_name();

				XSSFRow row8 = sheet.getRow(7);
				if(row8 == null) {
					row8 = sheet.createRow(7);
				}
				XSSFCell cellI8 = row8.getCell(13);
				if(cellI8 == null) {
					row8.createCell(13);
				}
				cellI8.setCellValue(mchName == null ? "" : mchName);  // 템플릿 스타일 유지

				// 기존 스타일을 유지하면서 데이터만 삽입
				String[] fields = { "in_date", "mch_name", "m68_mixer_no", "m68_g1_temp",
						"m68_g2_temp", "m68_g1_lot_no", "m68_g2_lot_no",
						"m68_thickener_g", "m68_mixing_start_time", "m68_thickener_time", "m68_viscosity", "m68_out_time",
						"m68_mixing_time", "m68_checker", "m68_post_rpm", "m68_thickener_lot", "m68_mch_temp", "m68_humidity"};

				int startRow = 10; // B11부터 시작 (row index는 0부터니까 10번 인덱스가 11번째 줄)
				int startCol = 0; // A열 (index 0)

				for (int i = 0; i < datas.size(); i++) {
					Condition item = datas.get(i);
					XSSFRow row = sheet.getRow(startRow + i);
					if (row == null)
						row = sheet.createRow(startRow + i);

					for (int j = 0; j < fields.length; j++) {
						XSSFCell cell = row.getCell(startCol + j);
						if (cell == null)
							cell = row.createCell(startCol + j);

						String value = "";
						try {
							Field field = Condition.class.getDeclaredField(fields[j]);
							field.setAccessible(true);
							Object fieldValue = field.get(item);
							value = (fieldValue != null) ? fieldValue.toString() : "";
						} catch (NoSuchFieldException | IllegalAccessException e) {
							value = "";
						}
						
				        // 숫자 파싱 (문자 중 숫자/부호/소수점만 추출)
				        Double num = null;
				        if (value != null) {
				            String cleaned = value.replaceAll("[^0-9.+-]", "");
				            if (!cleaned.isEmpty()) {
				                try {
				                    num = Double.valueOf(cleaned);
				                } catch (NumberFormatException ignore) {
				                    num = null;
				                }
				            }
				        }
				        
				        boolean makeRed = false;
				        
				        // ── 조건부 서식: 범위 밖이면 빨간색
				        if ("m68_g1_temp".equals(fields[j]) || "m68_g2_temp".equals(fields[j])) {
				            if (num != null) {
				                if (num < 15.0 || num > 25.0) {
				                    makeRed = true;
				                }
				                cell.setCellValue(num);
				            } else {
				                cell.setCellValue(value);
				            }
				        }  else if ("m68_thickener_g".equals(fields[j])) {
				            if (num != null) {
				                if (num < 180.0 || num > 260.0) {
				                    makeRed = true;
				                }
				                cell.setCellValue(num);
				            } else {
				                cell.setCellValue(value);
				            }
				        }else if("m68_viscosity".equals(fields[j])) {
				        	if(num != null) {
				        		if(num < 41.0 || num > 55.0) {
				        			makeRed = true;
				        		}
				        		cell.setCellValue(num);
				        	}else {
				        		cell.setCellValue(value);
				        	}
				        }else if("m68_mch_temp".equals(fields[j])) {
				        	if(num != null) {
				        		if(num > 25) {
				        			makeRed = true;
				        		}
				        		cell.setCellValue(num);
				        	}else {
				        		cell.setCellValue(value);
				        	}
				        }else if("m68_humidity".equals(fields[j])) {
				        	if(num != null) {
				        		if(num < 20) {
				        			makeRed = true;
				        		}
				        		cell.setCellValue(num);
				        	}else {
				        		cell.setCellValue(value);
				        	}
				        }
				        else {
				            // 일반 필드
				            cell.setCellValue(value);
				        }
				        if(makeRed) {
				        	cell.setCellStyle(redBorderStyle);
				        }else {
				        	cell.setCellStyle(borderStyle);
				        }

						cell.setCellValue(value); // ✅ 스타일 유지
						//cell.setCellStyle(borderStyle); //테두리
					}
				}

				workbook.setForceFormulaRecalculation(true);
				fos = new FileOutputStream(savePath + fileName);
				workbook.write(fos);
				workbook.close();
				fos.flush();

	            // 클라이언트가 다운로드할 수 있도록 경로 반환
	            rtnMap.put("filename", fileName);
	            rtnMap.put("downloadPath",
	                  "/geomet/download_machineLiquidManage?filename=" + URLEncoder.encode(fileName, "UTF-8"));


			} catch (Exception e) {
				e.printStackTrace();
				rtnMap.put("error", "엑셀 파일 생성 중 오류 발생");
			} finally {
				try {
					if (fis != null)
						fis.close();
					if (fos != null)
						fos.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			}
			else {
				
				String VISC_PREFIX = "PL점도(35~55): ";
				
				try {
					fis = new FileInputStream(openPath + "액교반 관리일지 엑셀 양식2.xlsx");
					XSSFWorkbook workbook = new XSSFWorkbook(fis);
					XSSFSheet sheet = workbook.getSheetAt(0);
					
					// 테두리 스타일 객체 생성
					XSSFCellStyle borderStyle = workbook.createCellStyle();
					borderStyle.setBorderTop(BorderStyle.THIN);
					borderStyle.setBorderBottom(BorderStyle.THIN);
					borderStyle.setBorderLeft(BorderStyle.THIN);
					borderStyle.setBorderRight(BorderStyle.THIN);
					
					//엑셀 스타일 정의(빨간색으로 입력)
					XSSFCellStyle redStyle = workbook.createCellStyle();
					XSSFFont redFont = workbook.createFont();
					redFont.setColor(IndexedColors.RED.getIndex());
					redStyle.setFont(redFont);
					
					//빨간색, 테두리
					XSSFCellStyle redBorderStyle = workbook.createCellStyle();
					redBorderStyle.cloneStyleFrom(borderStyle);
					redBorderStyle.setFont(redFont);
					
					// K7: 기간 (row=6, col=8)
					String sDate = condition.getIn_date();   // 시작날짜
					String eDate = condition.getEndDate();   // 끝날짜
					String periodText = (sDate == null ? "" : sDate) + " ~ " + (eDate == null ? "" : eDate);

					XSSFRow row7 = sheet.getRow(6); 
					if(row7 == null) {
						row7 = sheet.createRow(6);
					}
					XSSFCell cellI7 = row7.getCell(9);
					if(cellI7 == null) {
						cellI7 = row7.createCell(9);
					}
					cellI7.setCellValue(periodText);   // 템플릿 스타일 유지

					// I8: 설비명 (row=7, col=8)
					String mchName = condition.getMch_name();

					XSSFRow row8 = sheet.getRow(7);
					if(row8 == null) {
						row8 = sheet.createRow(7);
					}
					XSSFCell cellI8 = row8.getCell(9);
					if(cellI8 == null) {
						row8.createCell(9);
					}
					cellI8.setCellValue(mchName == null ? "" : mchName);  // 템플릿 스타일 유지

					// 기존 스타일을 유지하면서 데이터만 삽입
					String[] fields = { "in_date", "mch_name", "kmp_humidity", "kmp_mixing_temp", "kmp_mch_temp", "kmp_liquid_lot_no", "kmp_mixing_start_time",
							"kmp_mixing_time", "kmp_mch_visc", "kmp_out_time", "kmp_checker"};

					int startRow = 10; // B11부터 시작 (row index는 0부터니까 10번 인덱스가 11번째 줄)
					int startCol = 0; // A열 (index 0)

					for (int i = 0; i < datas.size(); i++) {
						Condition item = datas.get(i);
						XSSFRow row = sheet.getRow(startRow + i);
						if (row == null)
							row = sheet.createRow(startRow + i);

						for (int j = 0; j < fields.length; j++) {
							XSSFCell cell = row.getCell(startCol + j);
							if (cell == null)
								cell = row.createCell(startCol + j);

							String value = "";
							try {
								Field field = Condition.class.getDeclaredField(fields[j]);
								field.setAccessible(true);
								Object fieldValue = field.get(item);
								value = (fieldValue != null) ? fieldValue.toString() : "";
							} catch (NoSuchFieldException | IllegalAccessException e) {
								value = "";
							}

//					        if ("kmp_mch_visc".equals(fields[j])) {
//					            if (!value.isEmpty()) {
//					                value = VISC_PREFIX + value;
//					            }
//					        }
					        // 숫자 파싱 (문자 중 숫자/부호/소수점만 추출)
					        Double num = null;
					        if (value != null) {
					            String cleaned = value.replaceAll("[^0-9.+-]", "");
					            if (!cleaned.isEmpty()) {
					                try {
					                    num = Double.valueOf(cleaned);
					                } catch (NumberFormatException ignore) {
					                    num = null;
					                }
					            }
					        }
					        
					        boolean makeRed = false;
					        
					        // ── 조건부 서식: 범위 밖이면 빨간색
					        if ("kmp_humidity".equals(fields[j])) {
					            if (num != null) {
					                if (num < 15) {
					                    makeRed = true;
					                }
					                cell.setCellValue(num);
					            } else {
					                cell.setCellValue(value);
					            }
					        }else if("kmp_mixing_temp".equals(fields[j])) {
					        	if(num != null) {
					        		if(num > 25) {
					        			makeRed = true;
					        		}
					        		cell.setCellValue(num);
					        	}else {
					        		cell.setCellValue(value);
					        	}
					        }else if("kmp_mch_temp".equals(fields[j])) {
					        	if(num != null) {
					        		if(num > 25 || num < 15) {
					        			makeRed = true;
					        		}
					        		cell.setCellValue(num);
					        	}else {
					        		cell.setCellValue(value);
					        	}
					        }else if("kmp_mch_visc".equals(fields[j])) {
					        	if(num != null) {
					        		value = VISC_PREFIX + value;
					        		if(num < 35 || num > 55) {
					        			makeRed = true;
					        		}
					        		cell.setCellValue(num);
					        	}else {
					        		cell.setCellValue(value);
					        	}
					        }
					        else {
					            // 일반 필드
					            cell.setCellValue(value);
					        }
					        if(makeRed) {
					        	cell.setCellStyle(redBorderStyle);
					        }else {
					        	cell.setCellStyle(borderStyle);
					        }

							cell.setCellValue(value); // ✅ 스타일 유지
						}
					}

					workbook.setForceFormulaRecalculation(true);
					fos = new FileOutputStream(savePath + fileName);
					workbook.write(fos);
					workbook.close();
					fos.flush();

		            // 클라이언트가 다운로드할 수 있도록 경로 반환
		            rtnMap.put("filename", fileName);
		            rtnMap.put("downloadPath",
		                  "/geomet/download_machineLiquidManage?filename=" + URLEncoder.encode(fileName, "UTF-8"));


				} catch (Exception e) {
					e.printStackTrace();
					rtnMap.put("error", "엑셀 파일 생성 중 오류 발생");
				} finally {
					try {
						if (fis != null)
							fis.close();
						if (fos != null)
							fos.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				
			}

			return rtnMap;
		}
		
		 // 액교반 관리일지 엑셀 다운로드
		 @RequestMapping(value = "/download_machineLiquidManage", method = RequestMethod.GET)
		 public void download_machineLiquidManage(@RequestParam("filename") String filename, HttpServletResponse response)
		       throws IOException {

		    // 파일이 저장된 경로
		    String baseDir = "D:/GEOMET양식/액교반 관리일지/";

		    // System.out.println("다운 주소 filename: " + filename);

		    // 보안 체크
		    if (filename.contains("..") || filename.contains("/") || filename.contains("\\")) {
		       response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
		       return;
		    }

		    // 다운로드할 파일 객체 생성
		    File file = new File(baseDir + filename);
		    System.out.println("파일 전체 경로: " + file.getAbsolutePath());

		    // 파일이 존재하지 않으면 에러 반환
		    if (!file.exists()) {
		       response.setStatus(HttpServletResponse.SC_NOT_FOUND);
		       return;
		    }

		    // 파일 확장자 자동 추정
		    String mimeType = Files.probeContentType(file.toPath());
		    if (mimeType == null) {
		       mimeType = "application/octet-stream";
		    }
		    response.setContentType(mimeType);
		    response.setContentLengthLong(file.length());

		    // 파일명 인코딩
		    String encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");

		    // 다운로드 되도록 브라우저에 알림
		    response.setHeader("Content-Disposition", "attachment; filename*=UTF-8''" + encodedFilename);

		    // 파일을 바이트 스트림으로 클라이언트에 전송
		    try (FileInputStream fis = new FileInputStream(file); OutputStream os = response.getOutputStream()) {
		       byte[] buffer = new byte[1024];
		       int len;
		       while ((len = fis.read(buffer)) != -1) {
		          os.write(buffer, 0, len);
		       }
		       os.flush();
		    }
		 }
    

}
