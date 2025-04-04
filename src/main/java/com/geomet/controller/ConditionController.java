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
    public Map<String, Object> delDivisionWeight(@RequestBody Condition condition) {
        Map<String, Object> rtnMap = new HashMap<>();

        if (condition.getPlating_no() == null) {
            rtnMap.put("data", "행 선택하세요");
            return rtnMap;
        }

        conditionService.delDivisionWeight(condition);

        rtnMap.put("data", "success"); // 응답도 명확히
        return rtnMap;
    }


    @RequestMapping(value = "/condition/divisionWeight/print", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> divisionWeightPrint(HttpServletRequest request) {
        Map<String, Object> rtnMap = new HashMap<>();
        Condition standardInfo = new Condition();

        SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd'_GEOMET양식_'HHmmss");
        Date time = new Date();
        String fileName = format.format(time) + ".xlsx";

        FileOutputStream fos = null;
        FileInputStream fis = null;
        String openPath = "D:/GEOMET양식/";
        String savePath = "D:/GEOMET양식/조건관리/";

        List<Condition> standardInfoList = conditionService.getStandardInfoList(standardInfo);
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
            
            XSSFFont font = workbook.createFont();
            font.setFontHeightInPoints((short) 12);
            styleCenterBorder.setFont(font);

            String[] fields = {
                "plating_no", "material_no", "pum_name", "surface_spec",
                "max_weight", "min_weight", "avg_weight", "equip_1", "load_1",
                "equip_2", "load_2", "split_cnt", "avg_load", "g800", "g600",
                "common_equip", "k_black"
            };

            int startRow = 6;
            for (int i = 0; i < standardInfoList.size(); i++) {
                Condition item = standardInfoList.get(i);
                XSSFRow row = sheet.createRow(startRow + i);
                
                
                XSSFCell indexCell = row.createCell(0);
                indexCell.setCellValue(i + 1);
                indexCell.setCellStyle(styleCenterBorder);

                for (int j = 0; j < fields.length; j++) {
                    XSSFCell cell = row.createCell(j + 1); 

                    String value = "";
                    try {
                        Field field = Condition.class.getDeclaredField(fields[j]);
                        field.setAccessible(true);
                        Object fieldValue = field.get(item);
                        value = (fieldValue != null) ? fieldValue.toString() : "";
                    } catch (NoSuchFieldException | IllegalAccessException e) {
                        // 필드가 없거나 접근 불가능한 경우 공백 유지
                    }

                    cell.setCellValue(value);
                    cell.setCellStyle(styleCenterBorder); // 🔹 모든 셀에 스타일 적용
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
