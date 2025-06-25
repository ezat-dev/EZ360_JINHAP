package com.geomet.async;

import com.geomet.service.StartProcessorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import com.geomet.service.ReportExService;
@Component
public class StartProcessor {

	@Autowired
    private StartProcessorService startProcessorService;


    @Scheduled(fixedRate = 60000)
    public void runTaskEverySecond() {
        startProcessorService.insertTempDataEvery();
    }
    
    
    @Autowired
    private ReportExService reportExService;
    
    @Scheduled(cron = "0 14 17 * * *")
    public void reportEx() {
        try {
            reportExService.generateDailyReport();
            
            
            System.out.println("[Schedule] 작업일보 엑셀 생성 완료: " + java.time.LocalDateTime.now());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

