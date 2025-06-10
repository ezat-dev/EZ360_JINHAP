package com.geomet.service;

import java.io.IOException;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.geomet.domain.Condition;
import com.google.common.collect.Table.Cell;

@Service
public class ExcelService {

    private static final String[] fields = {
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

    private static final int startRow = 6; // 데이터가 시작되는 행

    public List<Condition> parseExcelFile(MultipartFile file) throws IOException {
        List<Condition> conditionList = new ArrayList<>();
        XSSFWorkbook workbook = new XSSFWorkbook(file.getInputStream());
        XSSFSheet sheet = workbook.getSheetAt(0);

        for (int i = startRow; i <= sheet.getLastRowNum(); i++) {
            XSSFRow row = sheet.getRow(i);
            StringBuilder logOutput = new StringBuilder("Row " + (i - startRow + 1) + " | ");

//            if (row.getCell(2).getStringCellValue() == null) continue;
          //  System.out.println(row);
            /*
             1. 각 행을 콘솔에 로그를 남겼을 때 null인지 아니면 어떤값인지 확인
 				-> continue를 쓸건지 break를 쓸건지 
             */

            
            
            Condition condition = new Condition();
           
            for (int j = 0; j < fields.length; j++) {
                XSSFCell cell = row.getCell(j + 1);
                String value = (cell != null) ? getCellValue(cell) : "";

               
                if (value.isEmpty() && fields[j].equals("item_cd")) {
                    workbook.close();
                    throw new IllegalArgumentException("엑셀 파일에 도금품번이 누락된 행이 있습니다. 행 번호: " + (i - 5));
                }

                try {
                    Field field = Condition.class.getDeclaredField(fields[j]);
                    field.setAccessible(true);
                    field.set(condition, value);
                } catch (NoSuchFieldException | IllegalAccessException e) {
                    e.printStackTrace();
                }

                logOutput.append(fields[j]).append(": ").append(value).append(", ");
            }


            // 각 행별 데이터 출력
          //  System.out.println(logOutput.toString());

            conditionList.add(condition);
        }

        workbook.close();
        return conditionList;
    }

    private String getCellValue(XSSFCell cell) {
        if (cell == null) return "";
        switch (cell.getCellType()) {
            case STRING: return cell.getStringCellValue();
            case NUMERIC: return String.valueOf((int) cell.getNumericCellValue());
            case BOOLEAN: return String.valueOf(cell.getBooleanCellValue());
            default: return "";
        }
    }
}
