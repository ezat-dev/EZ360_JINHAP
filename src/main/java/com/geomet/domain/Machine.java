package com.geomet.domain;

public class Machine {
	//tb_check_plan
	private String id;
    private String equipmentName;
    private String inspectionDate;
    private String itemType;
    private String m1;
    private String m2;
    private String m3;
    private String m4;
    private String m5;
    private String m6;
    private String m7;
    private String m8;
    private String m9;
    private String m10;
    private String m11;
    private String m12;
    private String saveUrl;
    private String remark;
    private String createdAt;
    private String updated_at;
    private String save_url;
    private String startDate;
    private String equipment_name;
    private String item_type;
    
    
    
    private String machine_code;           // 기계 코드
    private String machine_code_ch;        // 새로운 필드: 기계 코드 (machine_code_ch)
    private String now_count;              // 현 생산 실적 (통수)
    private String m_result_count;         // 월간 누적 실적 (통수)
    private String m_result_weight_ton;    // 월간 누적 실적 (중량 톤)
    private String little_count_ea;        // 월간 누적 생산 수량 (EA)
    private String rate_weight;            // 과부족량 (중량)
    private String rate_count;             // 과부족량 (수량)
    private String end_time;               // 종료 시간
    private String operating_hr;           // 가동시간 (시간)
    private String now_ct;                 // 실제 생산 C/T
    private String now_target;             // 생산 목표
    private String result_prod_ton;        // 실적 생산 (TON)
    private String result_rate;            // 생산 달성률
    private String facility_ct;            // 비가동 C/T (시설 C/T)
    private String facility_capa;          // 생산 목표 (시설 Capa)
    private String snapshot_time;          // 실적 생산 시각
    private String loss_hr;
    private String little_weight_ton;
    private String result_little_ton;
    


    
    
    //no_time
    private String non_time_idx;
    private String info_list;
    private String start_time;
    private String day_count;
    private String month_count;
    private String endDate;
    private String non_time_memo;
    private String v_equipment_name;
    //non_time_view
    
    private String sum_time;
    private String info_list_v;

    private String sum_time_ch;

	public String getId() {
		return id;
	}

	public String getNon_time_idx() {
		return non_time_idx;
	}

	public void setNon_time_idx(String non_time_idx) {
		this.non_time_idx = non_time_idx;
	}

	public String getV_equipment_name() {
		return v_equipment_name;
	}

	public void setV_equipment_name(String v_equipment_name) {
		this.v_equipment_name = v_equipment_name;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEquipmentName() {
		return equipmentName;
	}

	public void setEquipmentName(String equipmentName) {
		this.equipmentName = equipmentName;
	}

	public String getInspectionDate() {
		return inspectionDate;
	}

	public void setInspectionDate(String inspectionDate) {
		this.inspectionDate = inspectionDate;
	}

	public String getItemType() {
		return itemType;
	}

	public void setItemType(String itemType) {
		this.itemType = itemType;
	}

	public String getM1() {
		return m1;
	}

	public void setM1(String m1) {
		this.m1 = m1;
	}

	public String getM2() {
		return m2;
	}

	public void setM2(String m2) {
		this.m2 = m2;
	}

	public String getM3() {
		return m3;
	}

	public void setM3(String m3) {
		this.m3 = m3;
	}

	public String getM4() {
		return m4;
	}

	public void setM4(String m4) {
		this.m4 = m4;
	}

	public String getM5() {
		return m5;
	}

	public void setM5(String m5) {
		this.m5 = m5;
	}

	public String getM6() {
		return m6;
	}

	public void setM6(String m6) {
		this.m6 = m6;
	}

	public String getM7() {
		return m7;
	}

	public void setM7(String m7) {
		this.m7 = m7;
	}

	public String getM8() {
		return m8;
	}

	public void setM8(String m8) {
		this.m8 = m8;
	}

	public String getM9() {
		return m9;
	}

	public void setM9(String m9) {
		this.m9 = m9;
	}

	public String getM10() {
		return m10;
	}

	public void setM10(String m10) {
		this.m10 = m10;
	}

	public String getM11() {
		return m11;
	}

	public void setM11(String m11) {
		this.m11 = m11;
	}

	public String getM12() {
		return m12;
	}

	public void setM12(String m12) {
		this.m12 = m12;
	}

	public String getSaveUrl() {
		return saveUrl;
	}

	public void setSaveUrl(String saveUrl) {
		this.saveUrl = saveUrl;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}

	public String getUpdated_at() {
		return updated_at;
	}

	public void setUpdated_at(String updated_at) {
		this.updated_at = updated_at;
	}

	public String getSave_url() {
		return save_url;
	}

	public void setSave_url(String save_url) {
		this.save_url = save_url;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEquipment_name() {
		return equipment_name;
	}

	public void setEquipment_name(String equipment_name) {
		this.equipment_name = equipment_name;
	}

	public String getItem_type() {
		return item_type;
	}

	public void setItem_type(String item_type) {
		this.item_type = item_type;
	}

	public String getMachine_code() {
		return machine_code;
	}

	public void setMachine_code(String machine_code) {
		this.machine_code = machine_code;
	}

	public String getMachine_code_ch() {
		return machine_code_ch;
	}

	public void setMachine_code_ch(String machine_code_ch) {
		this.machine_code_ch = machine_code_ch;
	}

	public String getNow_count() {
		return now_count;
	}

	public void setNow_count(String now_count) {
		this.now_count = now_count;
	}

	public String getM_result_count() {
		return m_result_count;
	}

	public void setM_result_count(String m_result_count) {
		this.m_result_count = m_result_count;
	}

	public String getM_result_weight_ton() {
		return m_result_weight_ton;
	}

	public void setM_result_weight_ton(String m_result_weight_ton) {
		this.m_result_weight_ton = m_result_weight_ton;
	}

	public String getLittle_count_ea() {
		return little_count_ea;
	}

	public void setLittle_count_ea(String little_count_ea) {
		this.little_count_ea = little_count_ea;
	}

	public String getRate_weight() {
		return rate_weight;
	}

	public void setRate_weight(String rate_weight) {
		this.rate_weight = rate_weight;
	}

	public String getRate_count() {
		return rate_count;
	}

	public void setRate_count(String rate_count) {
		this.rate_count = rate_count;
	}

	public String getEnd_time() {
		return end_time;
	}

	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}

	public String getOperating_hr() {
		return operating_hr;
	}

	public void setOperating_hr(String operating_hr) {
		this.operating_hr = operating_hr;
	}

	public String getNow_ct() {
		return now_ct;
	}

	public void setNow_ct(String now_ct) {
		this.now_ct = now_ct;
	}

	public String getNow_target() {
		return now_target;
	}

	public void setNow_target(String now_target) {
		this.now_target = now_target;
	}

	public String getResult_prod_ton() {
		return result_prod_ton;
	}

	public void setResult_prod_ton(String result_prod_ton) {
		this.result_prod_ton = result_prod_ton;
	}

	public String getResult_rate() {
		return result_rate;
	}

	public void setResult_rate(String result_rate) {
		this.result_rate = result_rate;
	}

	public String getFacility_ct() {
		return facility_ct;
	}

	public void setFacility_ct(String facility_ct) {
		this.facility_ct = facility_ct;
	}

	public String getFacility_capa() {
		return facility_capa;
	}

	public void setFacility_capa(String facility_capa) {
		this.facility_capa = facility_capa;
	}

	public String getSnapshot_time() {
		return snapshot_time;
	}

	public void setSnapshot_time(String snapshot_time) {
		this.snapshot_time = snapshot_time;
	}

	public String getLoss_hr() {
		return loss_hr;
	}

	public void setLoss_hr(String loss_hr) {
		this.loss_hr = loss_hr;
	}

	public String getLittle_weight_ton() {
		return little_weight_ton;
	}

	public void setLittle_weight_ton(String little_weight_ton) {
		this.little_weight_ton = little_weight_ton;
	}

	public String getResult_little_ton() {
		return result_little_ton;
	}

	public void setResult_little_ton(String result_little_ton) {
		this.result_little_ton = result_little_ton;
	}

	public String getInfo_list() {
		return info_list;
	}

	public void setInfo_list(String info_list) {
		this.info_list = info_list;
	}

	public String getStart_time() {
		return start_time;
	}

	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}

	public String getDay_count() {
		return day_count;
	}

	public void setDay_count(String day_count) {
		this.day_count = day_count;
	}

	public String getMonth_count() {
		return month_count;
	}

	public void setMonth_count(String month_count) {
		this.month_count = month_count;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getNon_time_memo() {
		return non_time_memo;
	}

	public void setNon_time_memo(String non_time_memo) {
		this.non_time_memo = non_time_memo;
	}

	public String getSum_time() {
		return sum_time;
	}

	public void setSum_time(String sum_time) {
		this.sum_time = sum_time;
	}

	public String getInfo_list_v() {
		return info_list_v;
	}

	public void setInfo_list_v(String info_list_v) {
		this.info_list_v = info_list_v;
	}

	public String getSum_time_ch() {
		return sum_time_ch;
	}

	public void setSum_time_ch(String sum_time_ch) {
		this.sum_time_ch = sum_time_ch;
	}
    
    
    
    
  

	
}
