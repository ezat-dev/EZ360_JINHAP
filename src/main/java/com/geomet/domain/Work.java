package com.geomet.domain;
import java.util.List;

public class Work {
	
		private Integer in_1;
		private Integer in_2;
		private Integer in_3;
		private Integer in_4;
		private Integer in_5;
		private Integer in_6;
		
	    private Integer month_kg_1;        // 월간 생산량
	    private Integer opening_balance_2; // 월초 재고
	    private Integer kg_price_3;        // Kg 단가
	    private Integer barrel_price_4;    // 드럼 단가
	    private Integer barrel_weight_5;   // 드럼 무게
	    private Integer total_in_6;        // 입고량
	    private Integer total_usage_7;     // 사용량
	    private Integer use_price_8;       // 사용 금액
	    private Integer kg_use_9;          // Kg당 사용량
	    private Integer medicine_tong_10;  // 약품 통 수량
	    private Integer total_usage;       // 총 사용량
	    private Integer net_change;        // 증감량
	    private Integer end_balance;       // 기말 재고

	    // --- String ---
	    private String medicine_name;       // 약품명
	    private String m_mach_code;         // 설비 코드 그룹
	    private String attachment_spec_11;  // 첨부 규격
	    private String unit;                // 단위
	    private String y_n;                 // 사용 여부 (Y/N)
	    private String month_start;         // 월 시작일

	    // --- 추가 필드 ---
	    private String reg_date;
	    private String company_name;
	    private String lot_no;
	    private String stock_in;
	    private String daily_usage;
	    private String day_sum;
	
	
	
	
	
	private String barcode_no;
	private String date_time;
	private String w1;
	private String w2;
	private String s1;
	private String s2;
	private String s3;
	private String s4;
	private String s5;
	private String s6;
	private String g6;
	private String g8;
	private String kb;
	private String mlpl;
	private String resourceId;
	private String resiurceName;
	private String resourceName;
	private String downtime;
	
	private String target_weight;
	private String hour_weight;
	private String now_weight;
	private String jindo;
	private String work_tong;
	private String non_time;


	
	private String endDate;

	private String line_cd;
	private String total_cnt;
	private String prod_cnt;
//	private String ml;
	private String pl;
//	private String kb;
	private String sv;
	private String ar;
	private String ws;
	private String no;
	
	
	private String w_s;
	private String w_e;
	private String s_s;
	private String s_e;
	private String G03_s;
	private String G03_e;
	private String G04_s;
	private String G04_e;
	
	//컬럼 파라미터 
	

	
	
	private String wrk_ord_no;
	private String b_a;
	private String p_code;
	private String tank_temp;
	private String visocosity;
	private String specific_gravity;
	private String chiller_temp;
	private String t_600_d12000;
	private String t_600_d12001;
	private String t_800_d12000;
	private String t_800_d12001;
	private String blk_d12000;
	private String blk_d12001;
	private String mlpl_d12000;
	private String mlpl_d12001;
	
	
	
	private String capa_now_month;
	private String month_ton;
	private String percent_month;
	private String bujok_month;
	private String start_month;
	
    private String inventory_type;
    private Float getmet;
    private Integer ml;
    private Integer plus;

	
	private String m_code2;
	private String ex_mch_name;
	private List<Work> table1;
	private List<Work> table2;
	private List<Work> table3;
    private String drug_name;
	private String startDate;
    private String id;
    private String date;

    private String next_month;
    private String stock_cnt;
    private String geomet_g1;
    private String geomet_g2;
    private String geomet_adding;
    private String pluse;
    private String ml_h;
    private String ml_g;
    private String k_black;
    private String naoh_99;
    private String sc_300a;
    private String sc330b_3x;
    private String sc330_liquid;
    private String geomet_sus;
    private String ed2800_a_black;
    private String ed2800_b;
    private String geomet_005;
    private String geomet_069;
    private String geomet_p_210;
    private String geomet_sq_70;
    private String created_at;
    private String status;
    private String nextMonth;
    private String filed_name;
    private String s_time2;
    
    //설비효율 관리
    private String facility_name;
    private String c_min;
    private String h_min;
	/*
	 * private String a; private String b; private String c; private String d;
	 */
    private String a;
    private String b;
    private String c;
    private String d;

	/*
	 * private String e; private String f;
	 */
    private String g;
    private String h;
    private String k;
    private String l;
    private String j;
    private String i;
    private String m;
    private String n;
    private String o;
    private String p;
    private String r;
    private String s;
    private String t;
    private String u;
    private String q;


    
    private String weight;
    private String weight_wr;
    private String group_id;
    
    //작업일보
    private String r_num;
    private String start_time;
    private String end_time;
    private String tong_day;
    private String weight_day;
    private String item_nm;
    private String item_cd;
    private String next_facility;
    private String e;
    private String f;
    private String s_time;
    private String e_time;
    private String m_code;
    //작업일보 합계
    private String mach_code;
	/*
	 * private String tong_day; private String weight_day;
	 */
    private String tong_sum;
    private String weight_sum;
    private String work_time;
    
    private String work_hour;
    
    private String work_percent;
    private String sum_time;
    private String sum_percent;
    private String avg_day;
    private String avg_sum;
    private String uph;
    private String uph_sum;
    
    //작업일보 인풋
    private String idx;
    private String mch_code;
    private String mch_name;
    private String gb;
    private String visc;
    private String pre_temp;
    private String heat_temp;
    private String liq_temp;
    private String sg;
    private String input_date;
    
//    public String barcode_no;
//    public String item_cd;
//    public String item_nm;
//    public String w_s;
//    public String w_e;
//    public String s_s;

    public String g_s;
    public String g_e;
    public String mlpl_s;
    public String mlpl_e;
    public String before_month;
    
    //약품정보
    private Integer m_id;
    //private String medicine_name;
    private Integer kg_price;
    private Integer barrel_weight;
    private Integer barrel_price;
    private String attachment_spec;
    //private String unit;

    private String start_date;
    private String month_ym;
  
    
    private String end_date;
    
    
    
    
    public String getMonth_ym() {
		return month_ym;
	}
	public void setMonth_ym(String month_ym) {
		this.month_ym = month_ym;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public Integer getMonth_kg_1() {
		return month_kg_1;
	}
	public void setMonth_kg_1(Integer month_kg_1) {
		this.month_kg_1 = month_kg_1;
	}
	public Integer getOpening_balance_2() {
		return opening_balance_2;
	}
	public void setOpening_balance_2(Integer opening_balance_2) {
		this.opening_balance_2 = opening_balance_2;
	}
	public Integer getKg_price_3() {
		return kg_price_3;
	}
	public void setKg_price_3(Integer kg_price_3) {
		this.kg_price_3 = kg_price_3;
	}
	public Integer getBarrel_price_4() {
		return barrel_price_4;
	}
	public void setBarrel_price_4(Integer barrel_price_4) {
		this.barrel_price_4 = barrel_price_4;
	}
	public Integer getBarrel_weight_5() {
		return barrel_weight_5;
	}
	public void setBarrel_weight_5(Integer barrel_weight_5) {
		this.barrel_weight_5 = barrel_weight_5;
	}
	public Integer getTotal_in_6() {
		return total_in_6;
	}
	public void setTotal_in_6(Integer total_in_6) {
		this.total_in_6 = total_in_6;
	}
	public Integer getTotal_usage_7() {
		return total_usage_7;
	}
	public void setTotal_usage_7(Integer total_usage_7) {
		this.total_usage_7 = total_usage_7;
	}
	public Integer getUse_price_8() {
		return use_price_8;
	}
	public void setUse_price_8(Integer use_price_8) {
		this.use_price_8 = use_price_8;
	}
	public Integer getKg_use_9() {
		return kg_use_9;
	}
	public void setKg_use_9(Integer kg_use_9) {
		this.kg_use_9 = kg_use_9;
	}
	public Integer getMedicine_tong_10() {
		return medicine_tong_10;
	}
	public void setMedicine_tong_10(Integer medicine_tong_10) {
		this.medicine_tong_10 = medicine_tong_10;
	}
	public Integer getTotal_usage() {
		return total_usage;
	}
	public void setTotal_usage(Integer total_usage) {
		this.total_usage = total_usage;
	}
	public Integer getNet_change() {
		return net_change;
	}
	public void setNet_change(Integer net_change) {
		this.net_change = net_change;
	}
	public Integer getEnd_balance() {
		return end_balance;
	}
	public void setEnd_balance(Integer end_balance) {
		this.end_balance = end_balance;
	}
	public String getM_mach_code() {
		return m_mach_code;
	}
	public void setM_mach_code(String m_mach_code) {
		this.m_mach_code = m_mach_code;
	}
	public String getAttachment_spec_11() {
		return attachment_spec_11;
	}
	public void setAttachment_spec_11(String attachment_spec_11) {
		this.attachment_spec_11 = attachment_spec_11;
	}
	public String getMonth_start() {
		return month_start;
	}
	public void setMonth_start(String month_start) {
		this.month_start = month_start;
	}
	public Integer getM_id() {
		return m_id;
	}
	public void setM_id(Integer m_id) {
		this.m_id = m_id;
	}
	public Integer getKg_price() {
		return kg_price;
	}
	public void setKg_price(Integer kg_price) {
		this.kg_price = kg_price;
	}
	public Integer getBarrel_weight() {
		return barrel_weight;
	}
	public void setBarrel_weight(Integer barrel_weight) {
		this.barrel_weight = barrel_weight;
	}
	public Integer getBarrel_price() {
		return barrel_price;
	}
	public void setBarrel_price(Integer barrel_price) {
		this.barrel_price = barrel_price;
	}
	public String getAttachment_spec() {
		return attachment_spec;
	}
	public void setAttachment_spec(String attachment_spec) {
		this.attachment_spec = attachment_spec;
	}
	public String getY_n() {
		return y_n;
	}
	public void setY_n(String y_n) {
		this.y_n = y_n;
	}
	public String getBefore_month() {
		return before_month;
	}
	public void setBefore_month(String before_month) {
		this.before_month = before_month;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getMedicine_name() {
		return medicine_name;
	}
	public void setMedicine_name(String medicine_name) {
		this.medicine_name = medicine_name;
	}
	public String getLot_no() {
		return lot_no;
	}
	public void setLot_no(String lot_no) {
		this.lot_no = lot_no;
	}
	public String getStock_in() {
		return stock_in;
	}
	public void setStock_in(String stock_in) {
		this.stock_in = stock_in;
	}
	public String getDaily_usage() {
		return daily_usage;
	}
	public void setDaily_usage(String daily_usage) {
		this.daily_usage = daily_usage;
	}
	public String getDay_sum() {
		return day_sum;
	}
	public void setDay_sum(String day_sum) {
		this.day_sum = day_sum;
	}
	public String getTarget_weight() {
		return target_weight;
	}
	public void setTarget_weight(String target_weight) {
		this.target_weight = target_weight;
	}
	public String getHour_weight() {
		return hour_weight;
	}
	public void setHour_weight(String hour_weight) {
		this.hour_weight = hour_weight;
	}
	public String getNow_weight() {
		return now_weight;
	}
	public void setNow_weight(String now_weight) {
		this.now_weight = now_weight;
	}
	public String getJindo() {
		return jindo;
	}
	public void setJindo(String jindo) {
		this.jindo = jindo;
	}
	public String getWork_tong() {
		return work_tong;
	}
	public void setWork_tong(String work_tong) {
		this.work_tong = work_tong;
	}
	public String getNon_time() {
		return non_time;
	}
	public void setNon_time(String non_time) {
		this.non_time = non_time;
	}
	public String getDate_time() {
		return date_time;
	}
	public void setDate_time(String date_time) {
		this.date_time = date_time;
	}
	public String getWrk_ord_no() {
		return wrk_ord_no;
	}
	public void setWrk_ord_no(String wrk_ord_no) {
		this.wrk_ord_no = wrk_ord_no;
	}
	//생산모니터링
	/*
	 * public String facility_name; public String mach_code;
	 */
    public String std_weight;
    public String c_t;
    public String aa;
    public String bb;
    public String work_day;
    public String set_hr;
    public String mok_hr;
    public String capa_day;
    public String day_ton;
    public String percent_day;
    public String bujok_day;
    public String capa_month;
    public String capa_sum;
    public String cc;
    public String dd;
    public String ee;
    public String tong;
    public String tong_night;
 
    public String a1;
    public String a2;
    public String a3;
    public String a4;
    public String a5;
    public String a6;
    public String a7;
    public String a8;
    public String a9;
    public String a10;
    public String a11;
    public String a12;
    public String a13;
    
    public String total;
    public String prod;
	/*
	 * public String ml; public String pl; public String kb; public String sv;
	 * public String ar; public String ws; public String no;
	 */
    
    private String err_name;
    private String err_count;
    private String total_seconds;
    private String total_time_hms;
    
    
    
    


	public String getErr_name() {
		return err_name;
	}
	public void setErr_name(String err_name) {
		this.err_name = err_name;
	}
	public String getErr_count() {
		return err_count;
	}
	public void setErr_count(String err_count) {
		this.err_count = err_count;
	}
	public String getTotal_seconds() {
		return total_seconds;
	}
	public void setTotal_seconds(String total_seconds) {
		this.total_seconds = total_seconds;
	}
	public String getTotal_time_hms() {
		return total_time_hms;
	}
	public void setTotal_time_hms(String total_time_hms) {
		this.total_time_hms = total_time_hms;
	}
	public String getLine_cd() {
		return line_cd;
	}
	public Integer getIn_1() {
		return in_1;
	}
	public void setIn_1(Integer in_1) {
		this.in_1 = in_1;
	}
	public Integer getIn_2() {
		return in_2;
	}
	public void setIn_2(Integer in_2) {
		this.in_2 = in_2;
	}
	public Integer getIn_3() {
		return in_3;
	}
	public void setIn_3(Integer in_3) {
		this.in_3 = in_3;
	}
	public Integer getIn_4() {
		return in_4;
	}
	public void setIn_4(Integer in_4) {
		this.in_4 = in_4;
	}
	public Integer getIn_5() {
		return in_5;
	}
	public void setIn_5(Integer in_5) {
		this.in_5 = in_5;
	}
	public Integer getIn_6() {
		return in_6;
	}
	public void setIn_6(Integer in_6) {
		this.in_6 = in_6;
	}
	public String getG_s() {
		return g_s;
	}
	public void setG_s(String g_s) {
		this.g_s = g_s;
	}
	public String getG_e() {
		return g_e;
	}
	public void setG_e(String g_e) {
		this.g_e = g_e;
	}
	public String getMlpl_s() {
		return mlpl_s;
	}
	public void setMlpl_s(String mlpl_s) {
		this.mlpl_s = mlpl_s;
	}
	public String getMlpl_e() {
		return mlpl_e;
	}
	public void setMlpl_e(String mlpl_e) {
		this.mlpl_e = mlpl_e;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getProd() {
		return prod;
	}
	public void setProd(String prod) {
		this.prod = prod;
	}
	public void setLine_cd(String line_cd) {
		this.line_cd = line_cd;
	}
	public String getTotal_cnt() {
		return total_cnt;
	}
	public void setTotal_cnt(String total_cnt) {
		this.total_cnt = total_cnt;
	}
	public String getProd_cnt() {
		return prod_cnt;
	}
	public void setProd_cnt(String prod_cnt) {
		this.prod_cnt = prod_cnt;
	}
	public String getPl() {
		return pl;
	}
	public void setPl(String pl) {
		this.pl = pl;
	}
	public String getSv() {
		return sv;
	}
	public void setSv(String sv) {
		this.sv = sv;
	}
	public String getAr() {
		return ar;
	}
	public void setAr(String ar) {
		this.ar = ar;
	}
	public String getWs() {
		return ws;
	}
	public void setWs(String ws) {
		this.ws = ws;
	}

	public String getResourceName() {
		return resourceName;
	}
	public void setResourceName(String resourceName) {
		this.resourceName = resourceName;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getW1() {
		return w1;
	}
	public void setW1(String w1) {
		this.w1 = w1;
	}
	public String getW2() {
		return w2;
	}
	public void setW2(String w2) {
		this.w2 = w2;
	}
	public String getS1() {
		return s1;
	}
	public void setS1(String s1) {
		this.s1 = s1;
	}
	public String getS2() {
		return s2;
	}
	public void setS2(String s2) {
		this.s2 = s2;
	}
	public String getS3() {
		return s3;
	}
	public void setS3(String s3) {
		this.s3 = s3;
	}
	public String getS4() {
		return s4;
	}
	public void setS4(String s4) {
		this.s4 = s4;
	}
	public String getS5() {
		return s5;
	}
	public void setS5(String s5) {
		this.s5 = s5;
	}
	public String getS6() {
		return s6;
	}
	public void setS6(String s6) {
		this.s6 = s6;
	}
	public String getG6() {
		return g6;
	}
	public void setG6(String g6) {
		this.g6 = g6;
	}
	public String getG8() {
		return g8;
	}
	public void setG8(String g8) {
		this.g8 = g8;
	}
	public String getKb() {
		return kb;
	}
	public void setKb(String kb) {
		this.kb = kb;
	}
	public String getMlpl() {
		return mlpl;
	}
	public void setMlpl(String mlpl) {
		this.mlpl = mlpl;
	}
	public String getResourceId() {
		return resourceId;
	}
	public void setResourceId(String resourceId) {
		this.resourceId = resourceId;
	}
	public String getResiurceName() {
		return resiurceName;
	}
	public void setResiurceName(String resiurceName) {
		this.resiurceName = resiurceName;
	}
	public String getDowntime() {
		return downtime;
	}
	public void setDowntime(String downtime) {
		this.downtime = downtime;
	}
	public String getBarcode_no() {
		return barcode_no;
	}
	public void setBarcode_no(String barcode_no) {
		this.barcode_no = barcode_no;
	}
	public String getW_s() {
		return w_s;
	}
	public void setW_s(String w_s) {
		this.w_s = w_s;
	}
	public String getW_e() {
		return w_e;
	}
	public void setW_e(String w_e) {
		this.w_e = w_e;
	}
	public String getS_s() {
		return s_s;
	}
	public void setS_s(String s_s) {
		this.s_s = s_s;
	}
	public String getS_e() {
		return s_e;
	}
	public void setS_e(String s_e) {
		this.s_e = s_e;
	}
	public String getG03_s() {
		return G03_s;
	}
	public void setG03_s(String g03_s) {
		G03_s = g03_s;
	}
	public String getG03_e() {
		return G03_e;
	}
	public void setG03_e(String g03_e) {
		G03_e = g03_e;
	}
	public String getG04_s() {
		return G04_s;
	}
	public void setG04_s(String g04_s) {
		G04_s = g04_s;
	}
	public String getG04_e() {
		return G04_e;
	}
	public void setG04_e(String g04_e) {
		G04_e = g04_e;
	}
	public String getT_600_d12000() {
		return t_600_d12000;
	}
	public void setT_600_d12000(String t_600_d12000) {
		this.t_600_d12000 = t_600_d12000;
	}
	public String getT_600_d12001() {
		return t_600_d12001;
	}
	public void setT_600_d12001(String t_600_d12001) {
		this.t_600_d12001 = t_600_d12001;
	}
	public String getT_800_d12000() {
		return t_800_d12000;
	}
	public void setT_800_d12000(String t_800_d12000) {
		this.t_800_d12000 = t_800_d12000;
	}
	public String getT_800_d12001() {
		return t_800_d12001;
	}
	public void setT_800_d12001(String t_800_d12001) {
		this.t_800_d12001 = t_800_d12001;
	}
	public String getBlk_d12000() {
		return blk_d12000;
	}
	public void setBlk_d12000(String blk_d12000) {
		this.blk_d12000 = blk_d12000;
	}
	public String getBlk_d12001() {
		return blk_d12001;
	}
	public void setBlk_d12001(String blk_d12001) {
		this.blk_d12001 = blk_d12001;
	}
	public String getMlpl_d12000() {
		return mlpl_d12000;
	}
	public void setMlpl_d12000(String mlpl_d12000) {
		this.mlpl_d12000 = mlpl_d12000;
	}
	public String getMlpl_d12001() {
		return mlpl_d12001;
	}
	public void setMlpl_d12001(String mlpl_d12001) {
		this.mlpl_d12001 = mlpl_d12001;
	}
	public String getB_a() {
		return b_a;
	}
	public void setB_a(String b_a) {
		this.b_a = b_a;
	}
	public String getP_code() {
		return p_code;
	}
	public void setP_code(String p_code) {
		this.p_code = p_code;
	}
	public String getTank_temp() {
		return tank_temp;
	}
	public void setTank_temp(String tank_temp) {
		this.tank_temp = tank_temp;
	}
	public String getVisocosity() {
		return visocosity;
	}
	public void setVisocosity(String visocosity) {
		this.visocosity = visocosity;
	}
	public String getSpecific_gravity() {
		return specific_gravity;
	}
	public void setSpecific_gravity(String specific_gravity) {
		this.specific_gravity = specific_gravity;
	}
	public String getChiller_temp() {
		return chiller_temp;
	}
	public void setChiller_temp(String chiller_temp) {
		this.chiller_temp = chiller_temp;
	}

	public String getGroup_id() {
		return group_id;
	}
	public void setGroup_id(String group_id) {
		this.group_id = group_id;
	}
	public String getS_time2() {
		return s_time2;
	}
	public void setS_time2(String s_time2) {
		this.s_time2 = s_time2;
	}
	public String getInventory_type() {
		return inventory_type;
	}
	public void setInventory_type(String inventory_type) {
		this.inventory_type = inventory_type;
	}
	public Float getGetmet() {
		return getmet;
	}
	public void setGetmet(Float getmet) {
		this.getmet = getmet;
	}
	public Integer getMl() {
		return ml;
	}
	public void setMl(Integer ml) {
		this.ml = ml;
	}
	public Integer getPlus() {
		return plus;
	}
	public void setPlus(Integer plus) {
		this.plus = plus;
	}
	public String getL() {
		return l;
	}
	public void setL(String l) {
		this.l = l;
	}
	public String getJ() {
		return j;
	}
	public void setJ(String j) {
		this.j = j;
	}
	public String getC_min() {
		return c_min;
	}
	public void setC_min(String c_min) {
		this.c_min = c_min;
	}
	public String getH_min() {
		return h_min;
	}
	public void setH_min(String h_min) {
		this.h_min = h_min;
	}
	public String getA() {
		return a;
	}
	public void setA(String a) {
		this.a = a;
	}
	public String getB() {
		return b;
	}
	public void setB(String b) {
		this.b = b;
	}
	public String getC() {
		return c;
	}
	public void setC(String c) {
		this.c = c;
	}
	public String getD() {
		return d;
	}
	public void setD(String d) {
		this.d = d;
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
	public String getK() {
		return k;
	}
	public void setK(String k) {
		this.k = k;
	}
	public String getI() {
		return i;
	}
	public void setI(String i) {
		this.i = i;
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
	public String getP() {
		return p;
	}
	public void setP(String p) {
		this.p = p;
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
	public String getQ() {
		return q;
	}
	public void setQ(String q) {
		this.q = q;
	}
	public String getStart_month() {
		return start_month;
	}
	public void setStart_month(String start_month) {
		this.start_month = start_month;
	}
	public String getCapa_now_month() {
		return capa_now_month;
	}
	public void setCapa_now_month(String capa_now_month) {
		this.capa_now_month = capa_now_month;
	}
	public String getMonth_ton() {
		return month_ton;
	}
	public void setMonth_ton(String month_ton) {
		this.month_ton = month_ton;
	}
	public String getPercent_month() {
		return percent_month;
	}
	public void setPercent_month(String percent_month) {
		this.percent_month = percent_month;
	}
	public String getBujok_month() {
		return bujok_month;
	}
	public void setBujok_month(String bujok_month) {
		this.bujok_month = bujok_month;
	}
	public String getM_code2() {
		return m_code2;
	}
	public void setM_code2(String m_code2) {
		this.m_code2 = m_code2;
	}
	public String getWork_hour() {
		return work_hour;
	}
	public void setWork_hour(String work_hour) {
		this.work_hour = work_hour;
	}
	public String getEx_mch_name() {
		return ex_mch_name;
	}
	public void setEx_mch_name(String ex_mch_name) {
		this.ex_mch_name = ex_mch_name;
	}
	public List<Work> getTable1() {
		return table1;
	}
	public void setTable1(List<Work> table1) {
		this.table1 = table1;
	}
	public List<Work> getTable2() {
		return table2;
	}
	public void setTable2(List<Work> table2) {
		this.table2 = table2;
	}
	public List<Work> getTable3() {
		return table3;
	}
	public void setTable3(List<Work> table3) {
		this.table3 = table3;
	}
	public String getTong() {
		return tong;
	}
	public void setTong(String tong) {
		this.tong = tong;
	}
	public String getTong_night() {
		return tong_night;
	}
	public void setTong_night(String tong_night) {
		this.tong_night = tong_night;
	}
	public String getA1() {
		return a1;
	}
	public void setA1(String a1) {
		this.a1 = a1;
	}
	public String getA2() {
		return a2;
	}
	public void setA2(String a2) {
		this.a2 = a2;
	}
	public String getA3() {
		return a3;
	}
	public void setA3(String a3) {
		this.a3 = a3;
	}
	public String getA4() {
		return a4;
	}
	public void setA4(String a4) {
		this.a4 = a4;
	}
	public String getA5() {
		return a5;
	}
	public void setA5(String a5) {
		this.a5 = a5;
	}
	public String getA6() {
		return a6;
	}
	public void setA6(String a6) {
		this.a6 = a6;
	}
	public String getA7() {
		return a7;
	}
	public void setA7(String a7) {
		this.a7 = a7;
	}
	public String getA8() {
		return a8;
	}
	public void setA8(String a8) {
		this.a8 = a8;
	}
	public String getA9() {
		return a9;
	}
	public void setA9(String a9) {
		this.a9 = a9;
	}
	public String getA10() {
		return a10;
	}
	public void setA10(String a10) {
		this.a10 = a10;
	}
	public String getA11() {
		return a11;
	}
	public void setA11(String a11) {
		this.a11 = a11;
	}
	public String getA12() {
		return a12;
	}
	public void setA12(String a12) {
		this.a12 = a12;
	}
	public String getA13() {
		return a13;
	}
	public void setA13(String a13) {
		this.a13 = a13;
	}
	public String getStd_weight() {
		return std_weight;
	}
	public void setStd_weight(String std_weight) {
		this.std_weight = std_weight;
	}
	public String getC_t() {
		return c_t;
	}
	public void setC_t(String c_t) {
		this.c_t = c_t;
	}
	public String getAa() {
		return aa;
	}
	public void setAa(String aa) {
		this.aa = aa;
	}
	public String getBb() {
		return bb;
	}
	public void setBb(String bb) {
		this.bb = bb;
	}
	public String getWork_day() {
		return work_day;
	}
	public void setWork_day(String work_day) {
		this.work_day = work_day;
	}
	public String getSet_hr() {
		return set_hr;
	}
	public void setSet_hr(String set_hr) {
		this.set_hr = set_hr;
	}
	public String getMok_hr() {
		return mok_hr;
	}
	public void setMok_hr(String mok_hr) {
		this.mok_hr = mok_hr;
	}
	public String getCapa_day() {
		return capa_day;
	}
	public void setCapa_day(String capa_day) {
		this.capa_day = capa_day;
	}
	public String getDay_ton() {
		return day_ton;
	}
	public void setDay_ton(String day_ton) {
		this.day_ton = day_ton;
	}
	public String getPercent_day() {
		return percent_day;
	}
	public void setPercent_day(String percent_day) {
		this.percent_day = percent_day;
	}
	public String getBujok_day() {
		return bujok_day;
	}
	public void setBujok_day(String bujok_day) {
		this.bujok_day = bujok_day;
	}
	public String getCapa_month() {
		return capa_month;
	}
	public void setCapa_month(String capa_month) {
		this.capa_month = capa_month;
	}
	public String getCapa_sum() {
		return capa_sum;
	}
	public void setCapa_sum(String capa_sum) {
		this.capa_sum = capa_sum;
	}
	public String getCc() {
		return cc;
	}
	public void setCc(String cc) {
		this.cc = cc;
	}
	public String getDd() {
		return dd;
	}
	public void setDd(String dd) {
		this.dd = dd;
	}
	public String getEe() {
		return ee;
	}
	public void setEe(String ee) {
		this.ee = ee;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getR_num() {
		return r_num;
	}
	public void setR_num(String r_num) {
		this.r_num = r_num;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public String getTong_day() {
		return tong_day;
	}
	public void setTong_day(String tong_day) {
		this.tong_day = tong_day;
	}
	public String getWeight_day() {
		return weight_day;
	}
	public void setWeight_day(String weight_day) {
		this.weight_day = weight_day;
	}
	public String getItem_nm() {
		return item_nm;
	}
	public void setItem_nm(String item_nm) {
		this.item_nm = item_nm;
	}
	public String getItem_cd() {
		return item_cd;
	}
	public void setItem_cd(String item_cd) {
		this.item_cd = item_cd;
	}
	public String getNext_facility() {
		return next_facility;
	}
	public void setNext_facility(String next_facility) {
		this.next_facility = next_facility;
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
	public String getS_time() {
		return s_time;
	}
	public void setS_time(String s_time) {
		this.s_time = s_time;
	}
	public String getE_time() {
		return e_time;
	}
	public void setE_time(String e_time) {
		this.e_time = e_time;
	}
	public String getM_code() {
		return m_code;
	}
	public void setM_code(String m_code) {
		this.m_code = m_code;
	}
	public String getMach_code() {
		return mach_code;
	}
	public void setMach_code(String mach_code) {
		this.mach_code = mach_code;
	}
	public String getTong_sum() {
		return tong_sum;
	}
	public void setTong_sum(String tong_sum) {
		this.tong_sum = tong_sum;
	}
	public String getWeight_sum() {
		return weight_sum;
	}
	public void setWeight_sum(String weight_sum) {
		this.weight_sum = weight_sum;
	}
	public String getWork_time() {
		return work_time;
	}
	public void setWork_time(String work_time) {
		this.work_time = work_time;
	}
	public String getWork_percent() {
		return work_percent;
	}
	public void setWork_percent(String work_percent) {
		this.work_percent = work_percent;
	}
	public String getSum_time() {
		return sum_time;
	}
	public void setSum_time(String sum_time) {
		this.sum_time = sum_time;
	}
	public String getSum_percent() {
		return sum_percent;
	}
	public void setSum_percent(String sum_percent) {
		this.sum_percent = sum_percent;
	}
	public String getAvg_day() {
		return avg_day;
	}
	public void setAvg_day(String avg_day) {
		this.avg_day = avg_day;
	}
	public String getAvg_sum() {
		return avg_sum;
	}
	public void setAvg_sum(String avg_sum) {
		this.avg_sum = avg_sum;
	}
	public String getUph() {
		return uph;
	}
	public void setUph(String uph) {
		this.uph = uph;
	}
	public String getUph_sum() {
		return uph_sum;
	}
	public void setUph_sum(String uph_sum) {
		this.uph_sum = uph_sum;
	}
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getMch_code() {
		return mch_code;
	}
	public void setMch_code(String mch_code) {
		this.mch_code = mch_code;
	}
	public String getMch_name() {
		return mch_name;
	}
	public void setMch_name(String mch_name) {
		this.mch_name = mch_name;
	}
	public String getGb() {
		return gb;
	}
	public void setGb(String gb) {
		this.gb = gb;
	}
	public String getVisc() {
		return visc;
	}
	public void setVisc(String visc) {
		this.visc = visc;
	}
	public String getPre_temp() {
		return pre_temp;
	}
	public void setPre_temp(String pre_temp) {
		this.pre_temp = pre_temp;
	}
	public String getHeat_temp() {
		return heat_temp;
	}
	public void setHeat_temp(String heat_temp) {
		this.heat_temp = heat_temp;
	}
	public String getLiq_temp() {
		return liq_temp;
	}
	public void setLiq_temp(String liq_temp) {
		this.liq_temp = liq_temp;
	}
	public String getSg() {
		return sg;
	}
	public void setSg(String sg) {
		this.sg = sg;
	}
	public String getInput_date() {
		return input_date;
	}
	public void setInput_date(String input_date) {
		this.input_date = input_date;
	}
	public String getFacility_name() {
		return facility_name;
	}
	public void setFacility_name(String facility_name) {
		this.facility_name = facility_name;
	}

	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getWeight_wr() {
		return weight_wr;
	}
	public void setWeight_wr(String weight_wr) {
		this.weight_wr = weight_wr;
	}
	public String getFiled_name() {
		return filed_name;
	}
	public void setFiled_name(String filed_name) {
		this.filed_name = filed_name;
	}
	public String getNextMonth() {
		return nextMonth;
	}
	public void setNextMonth(String nextMonth) {
		this.nextMonth = nextMonth;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDrug_name() {
		return drug_name;
	}
	public void setDrug_name(String drug_name) {
		this.drug_name = drug_name;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getNext_month() {
		return next_month;
	}
	public void setNext_month(String next_month) {
		this.next_month = next_month;
	}
	public String getStock_cnt() {
		return stock_cnt;
	}
	public void setStock_cnt(String stock_cnt) {
		this.stock_cnt = stock_cnt;
	}
	public String getGeomet_g1() {
		return geomet_g1;
	}
	public void setGeomet_g1(String geomet_g1) {
		this.geomet_g1 = geomet_g1;
	}
	public String getGeomet_g2() {
		return geomet_g2;
	}
	public void setGeomet_g2(String geomet_g2) {
		this.geomet_g2 = geomet_g2;
	}
	public String getGeomet_adding() {
		return geomet_adding;
	}
	public void setGeomet_adding(String geomet_adding) {
		this.geomet_adding = geomet_adding;
	}
	public String getPluse() {
		return pluse;
	}
	public void setPluse(String pluse) {
		this.pluse = pluse;
	}
	public String getMl_h() {
		return ml_h;
	}
	public void setMl_h(String ml_h) {
		this.ml_h = ml_h;
	}
	public String getMl_g() {
		return ml_g;
	}
	public void setMl_g(String ml_g) {
		this.ml_g = ml_g;
	}
	public String getK_black() {
		return k_black;
	}
	public void setK_black(String k_black) {
		this.k_black = k_black;
	}
	public String getNaoh_99() {
		return naoh_99;
	}
	public void setNaoh_99(String naoh_99) {
		this.naoh_99 = naoh_99;
	}
	public String getSc_300a() {
		return sc_300a;
	}
	public void setSc_300a(String sc_300a) {
		this.sc_300a = sc_300a;
	}
	public String getSc330b_3x() {
		return sc330b_3x;
	}
	public void setSc330b_3x(String sc330b_3x) {
		this.sc330b_3x = sc330b_3x;
	}
	public String getSc330_liquid() {
		return sc330_liquid;
	}
	public void setSc330_liquid(String sc330_liquid) {
		this.sc330_liquid = sc330_liquid;
	}
	public String getGeomet_sus() {
		return geomet_sus;
	}
	public void setGeomet_sus(String geomet_sus) {
		this.geomet_sus = geomet_sus;
	}
	public String getEd2800_a_black() {
		return ed2800_a_black;
	}
	public void setEd2800_a_black(String ed2800_a_black) {
		this.ed2800_a_black = ed2800_a_black;
	}
	public String getEd2800_b() {
		return ed2800_b;
	}
	public void setEd2800_b(String ed2800_b) {
		this.ed2800_b = ed2800_b;
	}
	public String getGeomet_005() {
		return geomet_005;
	}
	public void setGeomet_005(String geomet_005) {
		this.geomet_005 = geomet_005;
	}
	public String getGeomet_069() {
		return geomet_069;
	}
	public void setGeomet_069(String geomet_069) {
		this.geomet_069 = geomet_069;
	}
	public String getGeomet_p_210() {
		return geomet_p_210;
	}
	public void setGeomet_p_210(String geomet_p_210) {
		this.geomet_p_210 = geomet_p_210;
	}
	public String getGeomet_sq_70() {
		return geomet_sq_70;
	}
	public void setGeomet_sq_70(String geomet_sq_70) {
		this.geomet_sq_70 = geomet_sq_70;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}

}
