package com.geomet.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.function.BiFunction;

import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geomet.domain.Work;

@Service
public class ReportExService {
    private static final DateTimeFormatter FMT = DateTimeFormatter.ofPattern("yyyyMMdd");

    @Autowired
    private WorkService workService;

    public void generateDailyReport() {
        LocalDate today = LocalDate.now();
        LocalDate target = today.minusDays(1);
        String rawStart = target.format(FMT);

        MachineConfig[] configs = new MachineConfig[]{
            new MachineConfig("공용설비", "G04-GG07", "작업일보공용설비.xlsx"),
            new MachineConfig("K-BLACK", "G04-GG05", "작업일보공용설비.xlsx"),
            new MachineConfig("GEOMET 800톤", "G03-GG01", "작업일보G600.xlsx"),
            new MachineConfig("GEOMET 600톤", "G03-GG03", "작업일보G600.xlsx"),
            new MachineConfig("세척(1호기)", "W0100", "작업일보세척설비.xlsx"),
            new MachineConfig("세척(2호기)", "W0200", "작업일보세척설비.xlsx"),
            new MachineConfig("쇼트(1호기)", "S0100", "작업일보세척설비.xlsx"),
            new MachineConfig("쇼트(2호기)", "S0200", "작업일보세척설비.xlsx"),
            new MachineConfig("쇼트(3호기)", "S0300", "작업일보세척설비.xlsx"),
            new MachineConfig("쇼트(4호기)", "S0400", "작업일보세척설비.xlsx"),
            new MachineConfig("쇼트(5호기)", "S0500", "작업일보세척설비.xlsx"),
            new MachineConfig("쇼트(6호기)", "S0600", "작업일보세척설비.xlsx")
        };

        for (MachineConfig cfg : configs) {
            try {
                Work work = new Work();
                work.setS_time(rawStart + "0800");
                work.setE_time(target.plusDays(1).format(FMT) + "0800");
                work.setEx_mch_name(cfg.displayName);

                String code = cfg.machineCode;
                String code2;
                if ("G03-GG01".equals(code)) {
                    code2 = "'G03-GG01','G04-GG05','G04-GG07'";
                } else if ("G03-GG03".equals(code)) {
                    code2 = "'G03-GG03','G04-GG05','G04-GG07'";
                } else {
                    code2 = "'" + code + "'";
                }

                work.setM_code(code);
                work.setM_code2(code2);

                List<Work> table1 = workService.getReportInputLIst(work);
                List<Work> table2 = workService.getWorkDailySum(work);
                List<Work> table3 = workService.getWorkDailyList(work);

                String template = "D:/GEOMET양식/작업일보_양식/" + cfg.templateFile;
                try (FileInputStream fis = new FileInputStream(template);
                     Workbook wb = WorkbookFactory.create(fis)) {

                    Sheet sheet = wb.getSheetAt(0);

                    BiFunction<Row, Integer, Cell> getCell = (r, c) -> {
                        Cell cell = r.getCell(c);
                        return (cell != null) ? cell : r.createCell(c);
                    };

                    CellStyle borderStyle = wb.createCellStyle();
                    borderStyle.setBorderTop(BorderStyle.THIN);
                    borderStyle.setBorderBottom(BorderStyle.THIN);
                    borderStyle.setBorderLeft(BorderStyle.THIN);
                    borderStyle.setBorderRight(BorderStyle.THIN);

                    // Header
                    Row r1 = sheet.getRow(1); if (r1 == null) r1 = sheet.createRow(1);
                    getCell.apply(r1, 1).setCellValue(work.getEx_mch_name());

                    LocalDate sd = LocalDate.parse(rawStart, FMT);
                    String disp = sd.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                    Row r7 = sheet.getRow(6); if (r7 == null) r7 = sheet.createRow(6);
                    getCell.apply(r7, 11).setCellValue(disp);

                    // -------------------
                    // table1 작성
                    int idx = 5;
                    if (table1 != null) {
                        for (Work w : table1) {
                            if (w == null) { idx++; continue; }
                            Row rr = sheet.getRow(idx); if (rr == null) rr = sheet.createRow(idx);
                            int c = 0;

                            if ("G03-GG01".equals(code) || "G03-GG03".equals(code) 
                                || "G04-GG05".equals(code) || "G04-GG07".equals(code)) {

                                getCell.apply(rr, c++).setCellValue(nvl(w.getB_a()));            
                                getCell.apply(rr, c++).setCellValue(nvl(w.getT_600_d12000()));   
                                getCell.apply(rr, c++).setCellValue(nvl(w.getT_600_d12001()));   
                                getCell.apply(rr, c++).setCellValue(nvl(w.getP_code()));         
                                getCell.apply(rr, c++).setCellValue(nvl(w.getTank_temp()));      
                                getCell.apply(rr, c++).setCellValue(nvl(w.getVisocosity()));     
                                getCell.apply(rr, c++).setCellValue(nvl(w.getSpecific_gravity()));
                                getCell.apply(rr, c++).setCellValue(nvl(w.getChiller_temp()));   

                                for (int j = 0; j < 8; j++) getCell.apply(rr, j).setCellStyle(borderStyle);

                            } else {
                                getCell.apply(rr, c++).setCellValue(nvl(w.getVisc()));
                                getCell.apply(rr, c++).setCellValue(nvl(w.getPre_temp()));
                                getCell.apply(rr, c++).setCellValue(nvl(w.getHeat_temp()));
                                for (int j = 0; j < 3; j++) getCell.apply(rr, j).setCellStyle(borderStyle);
                            }
                            idx++;
                        }
                    }

                    // -------------------
                    // table2 작성
                    int rowIdx = 11;
                    if (table2 != null) {
                        for (Work w : table2) {
                            if (w == null) { rowIdx++; continue; }

                            if (w.getAvg_day() != null)      w.setAvg_day(w.getAvg_day() + "kg");
                            if (w.getSum_time() != null)     w.setSum_time(w.getSum_time() + "hr");
                            if (w.getWork_percent() != null) w.setWork_percent(w.getWork_percent() + "%");
                            if (w.getSum_percent() != null)  w.setSum_percent(w.getSum_percent() + "%");

                            Row r = sheet.getRow(rowIdx); if (r == null) r = sheet.createRow(rowIdx);
                            int col = 0;

                            getCell.apply(r, col++).setCellValue(nvl(w.getTong_day()));
                            getCell.apply(r, col++).setCellValue(nvl(w.getWeight_day())); 
                            getCell.apply(r, col++).setCellValue(nvl(w.getAvg_day()));
                            getCell.apply(r, col++).setCellValue(nvl(w.getWork_time()));
                            getCell.apply(r, col++).setCellValue(nvl(w.getWork_percent()));
                            getCell.apply(r, col++).setCellValue(nvl(w.getUph()));
                            getCell.apply(r, col++).setCellValue(nvl(w.getTong_sum()));
                            getCell.apply(r, col++).setCellValue(nvl(w.getWeight_sum()));
                            getCell.apply(r, col++).setCellValue(nvl(w.getSum_time()));
                            getCell.apply(r, col++).setCellValue(nvl(w.getSum_percent()));
                            getCell.apply(r, col++).setCellValue(nvl(w.getUph_sum()));

                            for (int c = 0; c < 11; c++) getCell.apply(r, c).setCellStyle(borderStyle);
                            rowIdx++;
                        }
                    }

                    // -------------------
                    // table3 작성
                    int rowIdx2 = 14;
                    if (table3 != null) {
                        for (Work w : table3) {
                            if (w == null) { rowIdx2++; continue; }

                            if (w.getStart_time() != null && w.getStart_time().length() == 14)
                                w.setStart_time(formatTime(w.getStart_time()));
                            if (w.getEnd_time() != null && w.getEnd_time().length() == 14)
                                w.setEnd_time(formatTime(w.getEnd_time()));
                            if (w.getWeight_day() != null) w.setWeight_day(w.getWeight_day() + "kg");

                            boolean hasValue = w.getR_num() != null || w.getStart_time() != null || w.getEnd_time() != null
                                    || w.getTong_day() != null || w.getWeight_day() != null || w.getA() != null
                                    || w.getItem_nm() != null || w.getItem_cd() != null || w.getNext_facility() != null
                                    || w.getE() != null || w.getF() != null;
                            if (!hasValue) { rowIdx2++; continue; }

                            Row r = sheet.getRow(rowIdx2); if (r == null) r = sheet.createRow(rowIdx2);
                            int col = 0;

                            getCell.apply(r, col++).setCellValue(nvl(w.getR_num()));          // 순서
                            getCell.apply(r, col++).setCellValue(nvl(w.getStart_time()));     // 투입시간
                            getCell.apply(r, col++).setCellValue(nvl(w.getEnd_time()));       // 완료시간
                            getCell.apply(r, col++).setCellValue(nvl(w.getTong_day()));       // 투입통수
                            getCell.apply(r, col++).setCellValue(nvl(w.getWeight_day()));     // 작업중량
                            getCell.apply(r, col++).setCellValue(nvl(w.getA()));              // 분할횟수
                            getCell.apply(r, col++).setCellValue(nvl(w.getItem_nm()));        // 품명
                            getCell.apply(r, col++).setCellValue(nvl(w.getItem_cd()));        // 품번
                            getCell.apply(r, col++).setCellValue(nvl(w.getGroup_id()));       // 그룹ID
                            getCell.apply(r, col++).setCellValue(nvl(w.getNext_facility()));  // 후처리 사양
                            // col++; // 한 칸 건너뛰기
                            getCell.apply(r, col++).setCellValue(nvl(w.getE()));              // 구분(신규/재작업)

                            // 테두리 적용 (0~12 컬럼)
                            for (int c = 0; c <= col; c++) getCell.apply(r, c).setCellStyle(borderStyle);
                            rowIdx2++;
                        }
                    }

                    // -------------------
                    // 비고 작성
                    int remarkRowIdx = rowIdx2;
                    Row remarkRow = sheet.getRow(remarkRowIdx); if (remarkRow == null) remarkRow = sheet.createRow(remarkRowIdx);

                    Cell lbl = getCell.apply(remarkRow, 0);
                    lbl.setCellValue("비고:");
                    lbl.setCellStyle(borderStyle);

                    for (int col = 1; col <= 5; col++) {
                        Cell cell = getCell.apply(remarkRow, col);
                        cell.setCellStyle(borderStyle);
                    }

                    for (int i = sheet.getNumMergedRegions() - 1; i >= 0; i--) {
                        CellRangeAddress region = sheet.getMergedRegion(i);
                        if (region.getFirstRow() == remarkRowIdx && region.getFirstColumn() >= 1 && region.getLastColumn() <= 11)
                            sheet.removeMergedRegion(i);
                    }

                    sheet.addMergedRegion(new CellRangeAddress(remarkRowIdx, remarkRowIdx, 1, 5));

                    String dir = "D:/GEOMET양식/작업일보";
                    String part = cfg.displayName.replaceAll("[^a-zA-Z0-9가-힣]", "");
                    String fn = String.format("작업일보_%s_%s.xlsx", rawStart, part);
                    try (FileOutputStream fos = new FileOutputStream(new File(dir, fn))) {
                        wb.write(fos);
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    private static String nvl(String val) {
        return val != null ? val : "";
    }

    private static String formatTime(String t) {
        return t.substring(8, 10) + ":" + t.substring(10, 12) + ":" + t.substring(12, 14);
    }

    private static class MachineConfig {
        String displayName;
        String machineCode;
        String templateFile;
        MachineConfig(String dn, String mc, String tf) { this.displayName = dn; this.machineCode = mc; this.templateFile = tf; }
    }
}
