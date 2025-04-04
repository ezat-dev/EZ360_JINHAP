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
            "plating_no", "material_no", "pum_name", "surface_spec",
            "max_weight", "min_weight", "avg_weight", "equip_1", "load_1",
            "equip_2", "load_2", "split_cnt", "avg_load", "g800", "g600",
            "common_equip", "k_black"
    };

    private static final int startRow = 6; // 데이터가 시작되는 행

    public List<Condition> parseExcelFile(MultipartFile file) throws IOException {
        List<Condition> conditionList = new ArrayList<>();
        XSSFWorkbook workbook = new XSSFWorkbook(file.getInputStream());
        XSSFSheet sheet = workbook.getSheetAt(0);

        for (int i = startRow; i <= sheet.getLastRowNum(); i++) {
            XSSFRow row = sheet.getRow(i);
            if (row == null) continue;

            Condition condition = new Condition();
            StringBuilder logOutput = new StringBuilder("Row " + (i - startRow + 1) + " | ");

            for (int j = 0; j < fields.length; j++) {
                XSSFCell cell = row.getCell(j + 1); // 첫 번째 컬럼(인덱스)은 건너뜀
                String value = (cell != null) ? getCellValue(cell) : "";
                
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
            System.out.println(logOutput.toString());

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
