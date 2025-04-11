package com.geomet.dao;

import com.geomet.domain.Temp_data;
import java.util.List;
import java.util.Map;

public interface StartProcessorDao {

    List<Map<String, Object>> getLatestTempSamples(Temp_data temp_data);
    

    void insertTempData(Temp_data tempData);
}
