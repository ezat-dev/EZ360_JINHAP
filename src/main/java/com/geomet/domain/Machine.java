package com.geomet.domain;

public class Machine {
	private String work_time2;
	private String mach_cod;
	private String target;
	private String prodqty;
	private String rate;
	private String n_rate;
	private String c_rate;
 

	private String alarm_count;

	private String non_time;
	
	private String d;
	private String e;
	private String f;
	private String g;
	private String h;
	private String i;
	private String j;
	private String k;
	private String l;
	private String m;
	private String n;
	private String o;
	
	private String p;
	private String q;
	private String r;
	private String s;
	private String t;
	private String u;
	


	
	
	public String getP() {
		return p;
	}

	public void setP(String p) {
		this.p = p;
	}

	public String getQ() {
		return q;
	}

	public void setQ(String q) {
		this.q = q;
	}

	public String getR() {
		return r;
	}

	public void setR(String r) {
		this.r = r;
	}

	public String getS() {
		return s;
	}

	public void setS(String s) {
		this.s = s;
	}

	public String getT() {
		return t;
	}

	public void setT(String t) {
		this.t = t;
	}

	public String getU() {
		return u;
	}

	public void setU(String u) {
		this.u = u;
	}

	private String work_hour;
	
	
	
	//tb_check_plan
	private String id;
	private String start_time_formatted;
	private String end_time_formatted;

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
    private String machine_status;

    //모니터링 뷰
    private String facility_name;              // 설비명
               // 기계 상태 (가동 / 비가동)
    private Double c_t;                        // Cycle Time
    private Double work_ct;                    // 실 작업 CT
    private Double capa;                       // 기준 능력 (Capacity)
    private Double capa_quality;              // 품질 기준 능력
    private Integer tong_day;                 // 일일 통 수
    private Integer work_time;                // 가동 시간 (시간 단위)
    private Double work_loss;                 // 손실 시간 (초 단위)
    private Double work_ton;                  // 생산 톤수
    private Double work_bujok;                // 부족 톤수
    private Double work_percent;              // 달성률 (%)
    private Integer tong_sum;                 // 누적 통 수
    private Double weight_sum;                // 누적 중량 (kg)
    private Double work_sum_ton_bujok;        // 누적 부족 톤수
    private Double work_sum_weight_bujok;     // 누적 부족 통 수
    private Double work_sum_weight_percent;   // 누적 중량 달성률 (%)
    private Double work_sum_tong_percent;     // 누적 통 수 달성률 (%)
    
    
    
    
    
    
    
    
    
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
    
    
    //설비이력카드
    private String no;
    private String mch_name;
    private String mch_code;
    private String insert_date;
    private String a_check;
    private String maintenance;
    private String content;
    private String remarks;
    private String result;
    
    //부품교체 이력
    private String day_update;
 //   private String mch_name;
    private String chg_item;
    private String chg_date;
    private String reason;
    private String required_info;
    private String change_by;
    private String company_name;
    private String target_date;
 //   private String remark;
    
    
    //부품 스페어 
    
    private String a_usage;
    private String standard;
    private String producer;
    private String replacement;
    private String buy_cycle;
    private String stock;
    private String now_stock;
    private String mch_parts;
    //공무일지

    private String gong_date;
    private String g_b;
    private String gong_type;
    private String gong_hr;

    
    
    //경보
    private String position_cd;
    private String mach_code;
 
    private String line_cd;
    private String err_code;
    private String err_name;


    
    private Integer facility_code;

    private String facility_comment;
    private String facility_mach_code;

    private String std_weight;
    private String facility_yn;
    private Integer ch_idx;
    

    


	public String getWork_time2() {
		return work_time2;
	}

	public void setWork_time2(String work_time2) {
		this.work_time2 = work_time2;
	}

	public String getNon_time() {
		return non_time;
	}

	public void setNon_time(String non_time) {
		this.non_time = non_time;
	}

	public String getMach_cod() {
		return mach_cod;
	}

	public void setMach_cod(String mach_cod) {
		this.mach_cod = mach_cod;
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public String getProdqty() {
		return prodqty;
	}

	public void setProdqty(String prodqty) {
		this.prodqty = prodqty;
	}

	public String getRate() {
		return rate;
	}

	public void setRate(String rate) {
		this.rate = rate;
	}

	public String getN_rate() {
		return n_rate;
	}

	public void setN_rate(String n_rate) {
		this.n_rate = n_rate;
	}

	public String getC_rate() {
		return c_rate;
	}

	public void setC_rate(String c_rate) {
		this.c_rate = c_rate;
	}

	public String getD() {
		return d;
	}

	public void setD(String d) {
		this.d = d;
	}

	public String getE() {
		return e;
	}

	public void setE(String e) {
		this.e = e;
	}

	public String getF() {
		return f;
	}

	public void setF(String f) {
		this.f = f;
	}

	public String getG() {
		return g;
	}

	public void setG(String g) {
		this.g = g;
	}

	public String getH() {
		return h;
	}

	public void setH(String h) {
		this.h = h;
	}

	public String getI() {
		return i;
	}

	public void setI(String i) {
		this.i = i;
	}

	public String getJ() {
		return j;
	}

	public void setJ(String j) {
		this.j = j;
	}

	public String getK() {
		return k;
	}

	public void setK(String k) {
		this.k = k;
	}

	public String getL() {
		return l;
	}

	public void setL(String l) {
		this.l = l;
	}

	public String getM() {
		return m;
	}

	public void setM(String m) {
		this.m = m;
	}

	public String getN() {
		return n;
	}

	public void setN(String n) {
		this.n = n;
	}

	public String getO() {
		return o;
	}

	public void setO(String o) {
		this.o = o;
	}

	public String getWork_hour() {
		return work_hour;
	}
	
	
	

	public String getAlarm_count() {
		return alarm_count;
	}

	public void setAlarm_count(String alarm_count) {
		this.alarm_count = alarm_count;
	}

	public void setWork_hour(String work_hour) {
		this.work_hour = work_hour;
	}

	public Integer getFacility_code() {
		return facility_code;
	}

	public void setFacility_code(Integer facility_code) {
		this.facility_code = facility_code;
	}

	public String getFacility_comment() {
		return facility_comment;
	}

	public void setFacility_comment(String facility_comment) {
		this.facility_comment = facility_comment;
	}

	public String getFacility_mach_code() {
		return facility_mach_code;
	}

	public void setFacility_mach_code(String facility_mach_code) {
		this.facility_mach_code = facility_mach_code;
	}

	public String getStd_weight() {
		return std_weight;
	}

	public void setStd_weight(String std_weight) {
		this.std_weight = std_weight;
	}

	public String getFacility_yn() {
		return facility_yn;
	}

	public void setFacility_yn(String facility_yn) {
		this.facility_yn = facility_yn;
	}

	public Integer getCh_idx() {
		return ch_idx;
	}

	public void setCh_idx(Integer ch_idx) {
		this.ch_idx = ch_idx;
	}

	public String getPosition_cd() {
		return position_cd;
	}

	public void setPosition_cd(String position_cd) {
		this.position_cd = position_cd;
	}



	public String getLine_cd() {
		return line_cd;
	}

	public void setLine_cd(String line_cd) {
		this.line_cd = line_cd;
	}

	public String getErr_code() {
		return err_code;
	}

	public void setErr_code(String err_code) {
		this.err_code = err_code;
	}

	public String getErr_name() {
		return err_name;
	}

	public void setErr_name(String err_name) {
		this.err_name = err_name;
	}

	public String getMach_code() {
		return mach_code;
	}

	public void setMach_code(String mach_code) {
		this.mach_code = mach_code;
	}

	public String getGong_date() {
		return gong_date;
	}

	public void setGong_date(String gong_date) {
		this.gong_date = gong_date;
	}

	public String getG_b() {
		return g_b;
	}

	public void setG_b(String g_b) {
		this.g_b = g_b;
	}

	public String getGong_type() {
		return gong_type;
	}

	public void setGong_type(String gong_type) {
		this.gong_type = gong_type;
	}

	public String getGong_hr() {
		return gong_hr;
	}

	public void setGong_hr(String gong_hr) {
		this.gong_hr = gong_hr;
	}

	public String getA_usage() {
		return a_usage;
	}

	public void setA_usage(String a_usage) {
		this.a_usage = a_usage;
	}

	public String getNow_stock() {
		return now_stock;
	}

	public void setNow_stock(String now_stock) {
		this.now_stock = now_stock;
	}

	public String getMch_parts() {
		return mch_parts;
	}

	public void setMch_parts(String mch_parts) {
		this.mch_parts = mch_parts;
	}



	public String getStandard() {
		return standard;
	}

	public void setStandard(String standard) {
		this.standard = standard;
	}

	public String getProducer() {
		return producer;
	}

	public void setProducer(String producer) {
		this.producer = producer;
	}

	public String getReplacement() {
		return replacement;
	}

	public void setReplacement(String replacement) {
		this.replacement = replacement;
	}

	public String getBuy_cycle() {
		return buy_cycle;
	}

	public void setBuy_cycle(String buy_cycle) {
		this.buy_cycle = buy_cycle;
	}

	public String getStock() {
		return stock;
	}

	public void setStock(String stock) {
		this.stock = stock;
	}



	public String getResult() {
		return result;
	}

	public String getDay_update() {
		return day_update;
	}

	public void setDay_update(String day_update) {
		this.day_update = day_update;
	}

	public String getChg_item() {
		return chg_item;
	}

	public void setChg_item(String chg_item) {
		this.chg_item = chg_item;
	}

	public String getChg_date() {
		return chg_date;
	}

	public void setChg_date(String chg_date) {
		this.chg_date = chg_date;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getRequired_info() {
		return required_info;
	}

	public void setRequired_info(String required_info) {
		this.required_info = required_info;
	}

	public String getChange_by() {
		return change_by;
	}

	public void setChange_by(String change_by) {
		this.change_by = change_by;
	}

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	public String getTarget_date() {
		return target_date;
	}

	public void setTarget_date(String target_date) {
		this.target_date = target_date;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getMch_name() {
		return mch_name;
	}

	public void setMch_name(String mch_name) {
		this.mch_name = mch_name;
	}

	public String getMch_code() {
		return mch_code;
	}

	public void setMch_code(String mch_code) {
		this.mch_code = mch_code;
	}

	public String getInsert_date() {
		return insert_date;
	}

	public void setInsert_date(String insert_date) {
		this.insert_date = insert_date;
	}


	public String getA_check() {
		return a_check;
	}

	public void setA_check(String a_check) {
		this.a_check = a_check;
	}

	public String getMaintenance() {
		return maintenance;
	}

	public void setMaintenance(String maintenance) {
		this.maintenance = maintenance;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getFacility_name() {
		return facility_name;
	}

	public void setFacility_name(String facility_name) {
		this.facility_name = facility_name;
	}

	public Double getC_t() {
		return c_t;
	}

	public void setC_t(Double c_t) {
		this.c_t = c_t;
	}

	public Double getWork_ct() {
		return work_ct;
	}

	public void setWork_ct(Double work_ct) {
		this.work_ct = work_ct;
	}

	public Double getCapa() {
		return capa;
	}

	public void setCapa(Double capa) {
		this.capa = capa;
	}

	public Double getCapa_quality() {
		return capa_quality;
	}

	public void setCapa_quality(Double capa_quality) {
		this.capa_quality = capa_quality;
	}

	public Integer getTong_day() {
		return tong_day;
	}

	public void setTong_day(Integer tong_day) {
		this.tong_day = tong_day;
	}

	public Integer getWork_time() {
		return work_time;
	}

	public void setWork_time(Integer work_time) {
		this.work_time = work_time;
	}

	public Double getWork_loss() {
		return work_loss;
	}

	public void setWork_loss(Double work_loss) {
		this.work_loss = work_loss;
	}

	public Double getWork_ton() {
		return work_ton;
	}

	public void setWork_ton(Double work_ton) {
		this.work_ton = work_ton;
	}

	public Double getWork_bujok() {
		return work_bujok;
	}

	public void setWork_bujok(Double work_bujok) {
		this.work_bujok = work_bujok;
	}

	public Double getWork_percent() {
		return work_percent;
	}

	public void setWork_percent(Double work_percent) {
		this.work_percent = work_percent;
	}

	public Integer getTong_sum() {
		return tong_sum;
	}

	public void setTong_sum(Integer tong_sum) {
		this.tong_sum = tong_sum;
	}

	public Double getWeight_sum() {
		return weight_sum;
	}

	public void setWeight_sum(Double weight_sum) {
		this.weight_sum = weight_sum;
	}

	public Double getWork_sum_ton_bujok() {
		return work_sum_ton_bujok;
	}

	public void setWork_sum_ton_bujok(Double work_sum_ton_bujok) {
		this.work_sum_ton_bujok = work_sum_ton_bujok;
	}

	public Double getWork_sum_weight_bujok() {
		return work_sum_weight_bujok;
	}

	public void setWork_sum_weight_bujok(Double work_sum_weight_bujok) {
		this.work_sum_weight_bujok = work_sum_weight_bujok;
	}

	public Double getWork_sum_weight_percent() {
		return work_sum_weight_percent;
	}

	public void setWork_sum_weight_percent(Double work_sum_weight_percent) {
		this.work_sum_weight_percent = work_sum_weight_percent;
	}

	public Double getWork_sum_tong_percent() {
		return work_sum_tong_percent;
	}

	public void setWork_sum_tong_percent(Double work_sum_tong_percent) {
		this.work_sum_tong_percent = work_sum_tong_percent;
	}

	public String getId() {
		return id;
	}

	public String getMachine_status() {
		return machine_status;
	}

	public void setMachine_status(String machine_status) {
		this.machine_status = machine_status;
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

	public String getStart_time_formatted() {
		return start_time_formatted;
	}

	public void setStart_time_formatted(String start_time_formatted) {
		this.start_time_formatted = start_time_formatted;
	}

	public String getEnd_time_formatted() {
		return end_time_formatted;
	}

	public void setEnd_time_formatted(String end_time_formatted) {
		this.end_time_formatted = end_time_formatted;
	}
    
    
    
    
  

	
}
