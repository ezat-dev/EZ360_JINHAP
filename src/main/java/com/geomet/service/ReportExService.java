package com.geomet.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    /**
     * 매일 보고서 엑셀을 두 가지 설정으로 생성하고 저장
     */
    public void generateDailyReport() {
        LocalDate today = LocalDate.now();
        LocalDate target = today.minusDays(1);
        String rawStart = target.format(FMT);

        // 두 가지 설정
        MachineConfig[] configs = new MachineConfig[]{
            new MachineConfig("공용설비", "G04-GG07", "작업일보공용설비.xlsx"),
            new MachineConfig("K-BLACK", "G04-GG05", "작업일보공용설비.xlsx"),
            
            new MachineConfig("GEOMET 800톤", "G03-GG01", "작업일보G600.xlsx"),
            new MachineConfig("GEOMET 600톤", "G03-GG03", "작업일보G600.xlsx"),
            
            new MachineConfig("세척(1호기)", "W0100", "작업일보세척설비.xlsx"),
            new MachineConfig("세척(2호기)", "W0200",  "작업일보세척설비.xlsx"),
            
            new MachineConfig("쇼트(1호기)", "S0100",  "작업일보세척설비.xlsx"),
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

                // 템플릿 로드
                String template = "D:/GEOMET양식/작업일보_양식/" + cfg.templateFile;
                try (FileInputStream fis = new FileInputStream(template);
                     Workbook wb = WorkbookFactory.create(fis)) {

                    Sheet sheet = wb.getSheetAt(0);
                    // 셀 생성 헬퍼
                    java.util.function.BiFunction<Row, Integer, Cell> getCell = (r, c) -> {
                        Cell cell = r.getCell(c);
                        return (cell != null) ? cell : r.createCell(c);
                    };

                    // 테두리 스타일
                    CellStyle border = wb.createCellStyle();
                    border.setBorderTop(BorderStyle.THIN);
                    border.setBorderBottom(BorderStyle.THIN);
                    border.setBorderLeft(BorderStyle.THIN);
                    border.setBorderRight(BorderStyle.THIN);

                    // Header 작성
                    Row r1 = sheet.getRow(1); if (r1 == null) r1 = sheet.createRow(1);
                    getCell.apply(r1, 1).setCellValue(work.getEx_mch_name());

                    LocalDate sd = LocalDate.parse(rawStart, FMT);
                    String disp = sd.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                    Row r7 = sheet.getRow(6); if (r7 == null) r7 = sheet.createRow(6);
                    getCell.apply(r7, 11).setCellValue(disp);

                 // table1 작성 (6행 B열)
                    int idx = 5;
                    for (Work w : table1) {
                        Row rr = sheet.getRow(idx); if (rr == null) rr = sheet.createRow(idx);
                        int c = 1;
                        if ("G03-GG01".equals(code) || "G03-GG03".equals(code)) {
            
                            getCell.apply(rr, c++).setCellValue(w.getVisc());
                            getCell.apply(rr, c++).setCellValue(w.getPre_temp());
                            getCell.apply(rr, c++).setCellValue(w.getHeat_temp());
                            getCell.apply(rr, c++).setCellValue(w.getLiq_temp());
                            getCell.apply(rr, c++).setCellValue(w.getSg());
                          
                            for (int j = 1; j <= 5; j++) getCell.apply(rr, j).setCellStyle(border);
                        } else {
                     
                            getCell.apply(rr, c++).setCellValue(w.getVisc());
                            getCell.apply(rr, c++).setCellValue(w.getPre_temp());
                            getCell.apply(rr, c++).setCellValue(w.getHeat_temp());

                            for (int j = 1; j <= 3; j++) getCell.apply(rr, j).setCellStyle(border);
                        }
                        idx++;
                    }


                    // table2 작성 (10행 A열)
                    idx = 9;
                    for (Work w : table2) {
                        if (w.getAvg_day()!=null) w.setAvg_day(w.getAvg_day()+"kg");
                        if (w.getAvg_sum()!=null) w.setAvg_sum(w.getAvg_sum()+"kg");
                        if (w.getWork_time()!=null) w.setWork_time(w.getWork_time()+"");
                        if (w.getSum_time()!=null) w.setSum_time(w.getSum_time()+"hr");
                        if (w.getWork_percent()!=null) w.setWork_percent(w.getWork_percent()+"%");
                        if (w.getSum_percent()!=null) w.setSum_percent(w.getSum_percent()+"%");
                        Row rr = sheet.getRow(idx); if (rr==null) rr=sheet.createRow(idx);
                        int c=0;
                        getCell.apply(rr,c++).setCellValue(w.getTong_day());
                        getCell.apply(rr,c++).setCellValue(w.getWeight_day());
                        getCell.apply(rr,c++).setCellValue(w.getAvg_day());
                        getCell.apply(rr,c++).setCellValue(w.getTong_sum());
                        getCell.apply(rr,c++).setCellValue(w.getWeight_sum());
                        getCell.apply(rr,c++).setCellValue(w.getAvg_sum());
                        getCell.apply(rr,c++).setCellValue(w.getWork_time());
                        getCell.apply(rr,c++).setCellValue(w.getWork_percent());
                        getCell.apply(rr,c++).setCellValue(w.getSum_time());
                        getCell.apply(rr,c++).setCellValue(w.getSum_percent());
                        getCell.apply(rr,c++).setCellValue(w.getUph());
                        getCell.apply(rr,c++).setCellValue(w.getUph_sum());
                        for(int j=0;j<12;j++) getCell.apply(rr,j).setCellStyle(border);
                        idx++;
                    }

                    // table3 작성 (13행 A열)
                    int idx2=12;
                    for(Work w:table3) {
                        if(w.getStart_time()!=null && w.getStart_time().length()==14)
                            w.setStart_time(w.getStart_time().substring(8,10)+":"+w.getStart_time().substring(10,12)+":"+w.getStart_time().substring(12,14));
                        if(w.getEnd_time()!=null && w.getEnd_time().length()==14)
                            w.setEnd_time(w.getEnd_time().substring(8,10)+":"+w.getEnd_time().substring(10,12)+":"+w.getEnd_time().substring(12,14));
                        if(w.getWeight_day()!=null) w.setWeight_day(w.getWeight_day()+"kg");
                        boolean hv = w.getR_num()!=null||w.getStart_time()!=null||w.getEnd_time()!=null||w.getTong_day()!=null||w.getWeight_day()!=null||w.getA()!=null||w.getItem_nm()!=null||w.getItem_cd()!=null||w.getNext_facility()!=null||w.getE()!=null||w.getF()!=null;
                        if(!hv){ idx2++; continue; }
                        Row rr=sheet.getRow(idx2); if(rr==null) rr=sheet.createRow(idx2);
                        int c=0;
                        getCell.apply(rr,c++).setCellValue(w.getR_num());
                        getCell.apply(rr,c++).setCellValue(w.getStart_time());
                        getCell.apply(rr,c++).setCellValue(w.getEnd_time());
                        getCell.apply(rr,c++).setCellValue(w.getTong_day());
                        getCell.apply(rr,c++).setCellValue(w.getWeight_day());
                        getCell.apply(rr,c++).setCellValue(w.getA());
                        getCell.apply(rr,c++).setCellValue(w.getItem_nm());
                        getCell.apply(rr,c++).setCellValue(w.getItem_nm());
                        getCell.apply(rr,c++).setCellValue(w.getItem_cd());
                        getCell.apply(rr,c++).setCellValue(w.getNext_facility());
                        getCell.apply(rr,c++).setCellValue(w.getE());
                        getCell.apply(rr,c++).setCellValue(w.getF());
                        for(int j=0;j<12;j++) getCell.apply(rr,j).setCellStyle(border);
                        idx2++;
                    }

                    // 비고란 추가
                    Row rm=sheet.getRow(idx2); if(rm==null) rm=sheet.createRow(idx2);
                    Cell cl= getCell.apply(rm,0); cl.setCellValue("비고:"); cl.setCellStyle(border);
                    for(int j=1;j<=5;j++) getCell.apply(rm,j).setCellStyle(border);
                    for(int i=sheet.getNumMergedRegions()-1;i>=0;i--) {
                        CellRangeAddress reg=sheet.getMergedRegion(i);
                        if(reg.getFirstRow()==idx2 && reg.getFirstColumn()>=1 && reg.getLastColumn()<=11)
                            sheet.removeMergedRegion(i);
                    }
                    sheet.addMergedRegion(new CellRangeAddress(idx2,idx2,1,5));

                    // 저장 및 로그
                    String dir="D:/GEOMET양식/작업일보";
                    String part=cfg.displayName.replaceAll("[^a-zA-Z0-9가-힣]","");
                    String fn=String.format("작업일보_%s_%s.xlsx", rawStart, part);
                    try(FileOutputStream fos=new FileOutputStream(new File(dir,fn))){ wb.write(fos); }
                  //  System.out.println("[ReportExService] 생성: " + fn);
                }
            } catch(Exception e) {
                e.printStackTrace();
            }
        }
    }
    
    private static class MachineConfig {
        String displayName;
        String machineCode;
        String templateFile;
        MachineConfig(String dn, String mc, String tf){ this.displayName=dn; this.machineCode=mc; this.templateFile=tf; }
    }
}