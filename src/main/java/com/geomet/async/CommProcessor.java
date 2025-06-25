package com.geomet.async;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class CommProcessor {

    // 매일 오후 1시 46분에 실행
    @Scheduled(cron = "0 46 13 * * *")
    public void reportEx() {
        System.out.println("매일 13시 46분에 실행되는 작업입니다.");
      
    }
}
