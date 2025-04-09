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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.geomet.domain.Machine;
import com.geomet.domain.Quality;
import com.geomet.service.MachineService;


@Controller
public class MachineController {

	 @Autowired
	 private MachineService machineService; 
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
    
    //정기점검 계획/실적 조절 리스트
    @RequestMapping(value = "/machine/checkPlan/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> machineList(
            @RequestParam String startDate
            
    ) {
        System.out.println("Received request:");
        System.out.println("startDate: " + startDate);
  
        Map<String, Object> rtnMap = new HashMap<>();

        try {
           
        	Machine machine = new Machine();
        	
        	machine.setStartDate(startDate.isEmpty() ? null : startDate);        
        	

            List<Machine> getMachineList = machineService.getMachineList(machine);

            System.out.println("getMachineList Size: " + getMachineList.size());
            rtnMap.put("status", "success");
            rtnMap.put("last_page", 1);
            rtnMap.put("data", getMachineList);
        } catch (Exception e) {
            System.out.println("Error occurred: " + e.getMessage());
            rtnMap.put("status", "error");
            rtnMap.put("message", e.getMessage());
        }

        return rtnMap;
    }
    
	
    //정기점검 계획/실적
    @RequestMapping(value = "/machine/checkPlan/update", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> saveNonProductManage(@ModelAttribute Machine machine) {
        Map<String, Object> rtnMap = new HashMap<>();

        machineService.updatecheckPlan(machine);

        rtnMap.put("result", "success");
        return rtnMap;
    }
    
    
    
    // 정기점검 계획/실적 엑셀
    @RequestMapping(value = "/machine/checkPlan/excel", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> nonProductManageExcel(@RequestParam(required = false) String startDate) {
        System.out.println("정기점검 엑셀 다운로드 요청 params:");
        System.out.println("startDate = " + startDate);

        Map<String, Object> rtnMap = new HashMap<>();

        // 날짜 및 파일명 생성
        SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd'_GEOMET양식_'HHmmss");
        Date time = new Date();
        String fileName = format.format(time) + ".xlsx";

        FileOutputStream fos = null;
        FileInputStream fis = null;
        String openPath = "D:/GEOMET양식/";
        String savePath = "D:/GEOMET양식/정기점검 계획/";

        // 받은 파라미터로 machine 조건 설정
        Machine machine = new Machine();
        machine.setStartDate(startDate);

        // 필터링된 데이터만 조회
        List<Machine> getMachineList = machineService.getMachineList(machine);
        System.out.println("조회된 건수: " + (getMachineList != null ? getMachineList.size() : 0));

        if (getMachineList == null || getMachineList.isEmpty()) {
            rtnMap.put("error", "데이터 없음");
            return rtnMap;
        }

        try {
            fis = new FileInputStream(openPath + "08_01.설비관리_정기점검 계획실적.xlsx");
            XSSFWorkbook workbook = new XSSFWorkbook(fis);
            XSSFSheet sheet = workbook.getSheetAt(0);

            // 기존 스타일을 유지하면서 데이터만 삽입
            String[] fields = {"updated_at","item_type", "m1", "m2", "m3", "m4", "m5", "m6", "m7", "m8", "m9", "m10", "m11", "m12", "save_url", "remark" };

            int startRow = 9; // B10부터 시작 (row index는 0부터니까 9번 인덱스가 10번째 줄)
            int startCol = 1; // B열 (index 1)

            for (int i = 0; i < getMachineList.size(); i++) {
                Machine item = getMachineList.get(i);
                XSSFRow row = sheet.getRow(startRow + i);
                if (row == null) row = sheet.createRow(startRow + i);

                for (int j = 0; j < fields.length; j++) {
                    XSSFCell cell = row.getCell(startCol + j);
                    if (cell == null) cell = row.createCell(startCol + j);

                    String value = "";
                    try {
                        Field field = Machine.class.getDeclaredField(fields[j]);
                        field.setAccessible(true);
                        Object fieldValue = field.get(item);
                        value = (fieldValue != null) ? fieldValue.toString() : "";
                    } catch (NoSuchFieldException | IllegalAccessException e) {
                        value = "";
                    }

                    cell.setCellValue(value); // ✅ 스타일 유지
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
