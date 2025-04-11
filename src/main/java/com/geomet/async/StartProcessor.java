package com.geomet.async;

import com.geomet.service.StartProcessorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class StartProcessor {

	@Autowired
    private StartProcessorService startProcessorService;


    @Scheduled(fixedRate = 60000)
    public void runTaskEverySecond() {
        startProcessorService.insertTempDataEvery();
    }
}
