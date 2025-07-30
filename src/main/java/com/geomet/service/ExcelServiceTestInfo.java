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

import com.geomet.domain.Quality;

@Service
public class ExcelServiceTestInfo {

    private static final String[] fields = {
        "group_id",
        "item_cd",
        "item_nm",
        "coating_nm",
        "sample_f",
        "area_g",
        "total_area_h"
    };

    private static final int startRow = 6; // 데이터가 시작되는 행 (7번째 줄)

    public List<Quality> parseExcelFile(MultipartFile file) throws IOException {
        List<Quality> qualityList = new ArrayList<>();
        XSSFWorkbook workbook = new XSSFWorkbook(file.getInputStream());
        XSSFSheet sheet = workbook.getSheetAt(0);

        for (int i = startRow; i <= sheet.getLastRowNum(); i++) {
            XSSFRow row = sheet.getRow(i);
            if (row == null) continue; // 빈 행 방어

            StringBuilder logOutput = new StringBuilder("Row " + (i - startRow + 1) + " | ");

            Quality quality = new Quality();

            for (int j = 0; j < fields.length; j++) {
                XSSFCell cell = row.getCell(j + 1); // 엑셀 두 번째 열부터 시작
                String value = (cell != null) ? getCellValue(cell) : "";

                // 필수값 체크 (item_cd는 필수)
                if (value.isEmpty() && fields[j].equals("item_cd")) {
                    workbook.close();
                    throw new IllegalArgumentException("엑셀 파일에 도금품번이 누락된 행이 있습니다. 행 번호: " + (i - 5));
                }

                // 디버깅 로그: total_area_h 확인
                if (fields[j].equals("total_area_h")) {
                    System.out.println("Row " + i + " - total_area_h 값: '" + value + "'");
                }

                try {
                    Field field = Quality.class.getDeclaredField(fields[j]);
                    field.setAccessible(true);
                    field.set(quality, value);
                } catch (NoSuchFieldException | IllegalAccessException e) {
                    System.err.println("필드 매핑 오류: " + fields[j]);
                    e.printStackTrace();
                }

                logOutput.append(fields[j]).append(": ").append(value).append(", ");
            }

            // 전체 행 로그
            // System.out.println(logOutput.toString());

            qualityList.add(quality);
        }

        workbook.close();
        return qualityList;
    }

    private String getCellValue(XSSFCell cell) {
        if (cell == null) return "";
        switch (cell.getCellType()) {
            case STRING:
                return cell.getStringCellValue();
            case NUMERIC:
                return String.valueOf(cell.getNumericCellValue()); // 소수점 유지
            case BOOLEAN:
                return String.valueOf(cell.getBooleanCellValue());
            case FORMULA:
                return String.valueOf(cell.getNumericCellValue()); // 수식 결과도 숫자로 처리
            default:
                return "";
        }
    }
}
