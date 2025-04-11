package com.geomet.service;

import com.geomet.dao.StartProcessorDao;
import com.geomet.domain.Temp_data;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

@Service
public class StartProcessorServiceImpl implements StartProcessorService {

    @Autowired
    private StartProcessorDao startProcessorDao;

    
    @Override
    public void insertTempDataEvery() {
        System.out.println("===> StartProcessorService: insertTempDataEvery() 실행 시작");

        try {
            Temp_data filter = new Temp_data();
            List<Map<String, Object>> samples = startProcessorDao.getLatestTempSamples(filter);

            System.out.println("===> 가져온 샘플 개수: " + (samples != null ? samples.size() : "null"));

            if (samples == null || samples.isEmpty()) {
                System.out.println("===> 샘플 데이터 없음. 저장 안함.");
                return;
            }

            Temp_data tempData = new Temp_data();
            String latestTimestampStr = null;

            for (Map<String, Object> sample : samples) {
                String tagname = (String) sample.get("tagname");
                String tempStr = (String) sample.get("temp");
                System.out.println("===> 태그: " + tagname + ", 온도값: " + tempStr);
                Timestamp timestamp = (Timestamp) sample.get("timestamp");
                Integer temp = (tempStr != null && !tempStr.isEmpty()) ? Integer.parseInt(tempStr) : null;

                if (latestTimestampStr == null && timestamp != null) {
                    latestTimestampStr = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(timestamp);
                    tempData.setTemp_time(latestTimestampStr);
                }

                switch (tagname) {
                    case "JH.LSE.GEOMET_600T_DRY_D12000":
                        tempData.setT_600_D12000(temp);
                        break;
                    case "JH.LSE.GEOMET_600T_DRY_D12001":
                        tempData.setT_600_D12001(temp);
                        break;
                    case "JH.LSE.GEOMET_800T_DRY_D12000":
                        tempData.setT_800_D12000(temp);
                        break;
                    case "JH.LSE.GEOMET_800T_DRY_D12001":
                        tempData.setT_800_D12001(temp);
                        break;
                    case "JH.LSE.GEOMET_BLK_DRY_D12000":
                        tempData.setBLK_D12000(temp);
                        break;
                    case "JH.LSE.GEOMET_BLK_DRY_D12001":
                        tempData.setBLK_D12001(temp);
                        break;
                    case "JH.LSE.GEOMET_MLPL_DRY_D12000":
                        tempData.setMLPL_D12000(temp);
                        break;
                    case "JH.LSE.GEOMET_MLPL_DRY_D12001":
                        tempData.setMLPL_D12001(temp);
                        break;
                    default:
                        System.out.println(">> 알 수 없는 태그: " + tagname);
                        break;
                }
            }

            if (latestTimestampStr != null) {
                startProcessorDao.insertTempData(tempData);
                System.out.println("===> 데이터 저장 완료: " + latestTimestampStr);
            } else {
                System.out.println("===> 유효한 timestamp 없음, 저장 안함");
            }

        } catch (Exception e) {
            System.out.println("===> insertTempDataEvery() 에러 발생: " + e.getMessage());
            e.printStackTrace();
        }

        System.out.println("===> insertTempDataEvery() 실행 완료\n");
    }
}
