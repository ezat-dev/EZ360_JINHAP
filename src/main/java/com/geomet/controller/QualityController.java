package com.geomet.controller;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.Field;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
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

import com.geomet.domain.Condition;
import com.geomet.domain.Quality;

import com.geomet.service.QualityService;


@Controller
public class QualityController {
	
	 @Autowired
	    private QualityService qualityService; 

	/*-----품질관리-----*/
	
	//온도균일성 테스트
    @RequestMapping(value= "/quality/tusTest", method = RequestMethod.GET)
    public String tusTest(Model model) {
        return "/quality/tusTest.jsp"; // 
    }
    
    //온도균일성 테스트 - 조회
	 @RequestMapping(value = "/quality/tustest/selectList", method = RequestMethod.POST) 
	 @ResponseBody 
	 public Map<String, Object> tusTestSelect() {
		 Map<String, Object> rtnMap = new HashMap<String, Object>();
		 
		 rtnMap.put("last_page",1);
		 rtnMap.put("data","");
		 
		 return rtnMap; 
	 }
	
	//내식성 테스트 - SST, CCT, 부착량 시험, 내수 밀착성, 설비별 가열잔분, 탈지액 분석
    @RequestMapping(value= "/quality/resistTest", method = RequestMethod.GET)
    public String resistTest(Model model) {
        return "/quality/resistTest.jsp"; // 
    }
	
	//수입검사 - 쇼트볼, 신액입고분
    @RequestMapping(value= "/quality/inTest", method = RequestMethod.GET)
    public String inTest(Model model) {
        return "/quality/inTest.jsp"; // 
    }	
	
	//욕액분석, 사용액 분석, 이코팅, 방청
    @RequestMapping(value= "/quality/liquidAnalyze", method = RequestMethod.GET)
    public String liquidAnalyze(Model model) {
        return "/quality/liquidAnalyze.jsp"; // 
    }	
	
	//부적합품 관리
    @RequestMapping(value= "/quality/nonProductManage", method = RequestMethod.GET)
    public String nonProductManage(Model model) {
        return "/quality/nonProductManage.jsp"; // 
    }	
    
    // 부적합품 관리 리스트
    @RequestMapping(value = "/quality/nonProductManage/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> corrStatusList(
            @RequestParam String equipment_name,
            @RequestParam String startDate,
            @RequestParam String endDate
    ) {      
		/*
		 * System.out.println("Received request:");
		 * System.out.println("부적합equipment_name: " + equipment_name);
		 * System.out.println("부적합startDate: " + startDate);
		 * System.out.println("부적합endDate: " + endDate);
		 */

        Map<String, Object> rtnMap = new HashMap<>();
        try {
           
        	Quality quality = new Quality();
        	quality.setEquipment_name(equipment_name.isEmpty() ? null : equipment_name); 
        	quality.setStartDate(startDate.isEmpty() ? null : startDate);        
        	quality.setEndDate(endDate.isEmpty() ? null : endDate); 

            List<Quality> getNonProductManageList = qualityService.getNonProductManageList(quality);

           // System.out.println("getStandardInfoList Size: " + getNonProductManageList.size());     
            rtnMap.put("status", "success");
            rtnMap.put("last_page", 1);
            rtnMap.put("data", getNonProductManageList);
        } catch (Exception e) {
            System.out.println("Error occurred: " + e.getMessage());
            rtnMap.put("status", "error");
            rtnMap.put("message", e.getMessage());
        }

        return rtnMap;
    }
    
    // 부적합품 관리
    @RequestMapping(value = "/quality/nonProductManage/insert", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> saveNonProductManage(@ModelAttribute Quality quality) {
        Map<String, Object> rtnMap = new HashMap<>();

        qualityService.saveNonProductManage(quality);

        rtnMap.put("result", "success");
        return rtnMap;
    }
    // 부적합품 관리
    @RequestMapping(value = "/quality/nonProductManage/del", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> delNonProductManage(@RequestBody Quality quality) {
        Map<String, Object> rtnMap = new HashMap<>();

        if (quality.getNo() == null) {
            rtnMap.put("data", "행 선택하세요");
            return rtnMap;
        }

        qualityService.delNonProductManage(quality);

        rtnMap.put("data", "success"); 
        return rtnMap;
    }
    
    // 부적합품 관리 엑셀
    @RequestMapping(value = "/quality/nonProductManage/excel", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> nonProductManageExcel(
            @RequestParam(required = false) String equipment_name,
            @RequestParam(required = false) String startDate,
            @RequestParam(required = false) String endDate
    ) {
    	System.out.println("엑셀 다운로드 요청 params:");
        System.out.println("equipment_name = " + equipment_name);
        System.out.println("startDate = " + startDate);
        System.out.println("endDate = " + endDate);
        
        Map<String, Object> rtnMap = new HashMap<>();

        // 날짜 및 파일명 생성
        SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd'_GEOMET양식_'HHmmss");
        Date time = new Date();
        String fileName = format.format(time) + ".xlsx";

        FileOutputStream fos = null;
        FileInputStream fis = null;
        String openPath = "D:/GEOMET양식/";
        String savePath = "D:/GEOMET양식/부적합품 관리/";

        // 받은 파라미터로 Quality 조건 설정
        Quality quality = new Quality();
        quality.setEquipment_name(equipment_name);
        quality.setStartDate(startDate);
        quality.setEndDate(endDate);

        // 필터링된 데이터만 조회
        List<Quality> nonProductManageInfoList = qualityService.getNonProductManageList(quality);

        System.out.println("조회된 건수: " + (nonProductManageInfoList != null ? nonProductManageInfoList.size() : 0));

        if (nonProductManageInfoList == null || nonProductManageInfoList.isEmpty()) {
            rtnMap.put("error", "데이터 없음");
            return rtnMap;
        }

        try {
            fis = new FileInputStream(openPath + "04_05.품질관리_부적합품 관리_0401변경.xlsx");
            XSSFWorkbook workbook = new XSSFWorkbook(fis);
            XSSFSheet sheet = workbook.getSheetAt(0);

            XSSFCellStyle styleCenterBorder = workbook.createCellStyle();
            styleCenterBorder.setAlignment(HorizontalAlignment.CENTER);
            styleCenterBorder.setBorderTop(BorderStyle.THIN);
            styleCenterBorder.setBorderBottom(BorderStyle.THIN);
            styleCenterBorder.setBorderLeft(BorderStyle.THIN);
            styleCenterBorder.setBorderRight(BorderStyle.THIN);

            String[] fields = {
                "no", "defect_date", "defect_type", "equipment", "product_no", "product_name",
                "defect_lot", "worker", "action", "selection_method", "action_date",
                "defect_quantity", "cause", "improvement", "yn_a", "yn_b", "start_date"
            };

            int startRow = 5; // 엑셀 6행
            int startCol = 1; // B열

            for (int i = 0; i < nonProductManageInfoList.size(); i++) {
                Quality item = nonProductManageInfoList.get(i);
                XSSFRow row = sheet.createRow(startRow + i);

                for (int j = 0; j < fields.length; j++) {
                    XSSFCell cell = row.createCell(startCol + j);
                    String value = "";

                    try {
                        Field field = Quality.class.getDeclaredField(fields[j]);
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


}
