package com.geomet.domain;

public class Quality {

	
	    private String defect_place;
		private String group_id;
		private String item_cd;
		private String item_nm;
		private String coating_nm;
		private String sample_f;
		private String area_g;
		private String total_area_h;
		private String user_id;
		private String upd_dt;
		
		private String no;
	    private String startDate;
	    private String Equipment_name;
	    private String endDate;
	    private String defect_date;
	    private String defect_type;
	    private String equipment;
	    private String product_no;
	    private String product_name;
	    private String defect_lot;
	    private String worker;
	    private String action;
	    private String selection_method;
	    private String action_date;
	    private String defect_quantity;
	    private String cause;
	    private String improvement;
	    
	    private String yn_a;
	    private String yn_b;
	    private String start_date;
	    
	    private String id;
	    private String mch_name;
	    private String t_year;
	    private String t_month;
	    private String t_url;
	    private String t_ok;
	    private String t_gb;
	    private String t_day;
	    private String t_min;
	    private String t_result;
	    
	    private String in_day; //입고일자
	    private String page; //어떤 페이지인지
	    private String supplier; //공급처
	    private String medicine; //약품
	    private String lot; //로트번호
	    private String nv_1; //가열잔분
	    private String nv_2; //가열잔분
	    private String color_1; //색상
	    private String color_2; //색상
	    private String sensuality_1_1; //관능1
	    private String sensuality_2_1; //관능2
	    private String sensuality_1_2; //관능1
	    private String sensuality_2_2; //관능2
	    private String confirm; //합부판정
	    //private String file_url; //시험성적서 파일 url
	    private String file_name; //시험성적서 파일 이름
	    private String writer; //작성자
	    private String confirmer; //확인자
	    private String ph_1; //ph
	    private String ph_2; //ph
	    private String specific_gravity_1; //비중
	    private String specific_gravity_2; //비중
	    private String viscosity_1; //점도
	    private String viscosity_2; //점도
	    private String hardness_1; //심부경도
	    private String hardness_2; //심부경도
	    private String short_1; //심부경도
	    private String short_2; //심부경도
	    private String appearance_1; //심부경도
	    private String appearance_2; //심부경도
	    private String ex_1_1;
	    private String ex_1_2;
	    private String ex_2_1;
	    private String ex_2_2;
	    private String result; //판정결과
	    private String update_id; //작성자
	    
	    private Integer num; //투입약품기준자료 pk
	    private Integer naoh_result; //NaOH 분석결과
	    private Float hcl; //1.0N-HCL 소모량
	    private Integer liter; //조 용량
	    private Float naoh; //NaOH
	    private Float sc300a; //sc300a
	    private Float sc300b; //sc300b
	    private Float condense; //농축액
	    private Float after_naoh; //투입 후 NaOH
	    private Integer table_code; //테이블코드
	    
	    
	    //테스트 관리대장
	    private String number; //테스트 관리대장 pk
	    private String date; //날짜
	    private String sst1; //sst1
	    private String sst2; 
	    private String sst3;
	    private String cct1;
	    private String cct2;
	    private String cct3;
	    private String contact1;
	    private String contact2;
	    private String contact3;
	    private String gattach1;
	    private String gattach2;
	    private String gattach3;
	    private String after_attach1;
	    private String after_attach2;
	    private String after_attach3;
	    private String heat1;
	    private String heat2;
	    private String heat3;
	    private String clean1;
	    private String clean2;
	    private String clean3;
	    private String shot1;
	    private String shot2;
	    private String shot3;
	    private String etc1;
	    private String etc2;
	    private String etc3;
	    private String etc4;
	    private String etc5;
	    private String etc6;
	    
	    //테스트/시험정보
	    private String test_num;
	    private Float hafter_1;
	    private Float empty_2;
	    private Float hbefore_3;
	    private String min_spec;
	    private String max_spec;
	    private String spec;
	    
	    private String acid_reduce;
	    private String naoh_density;
	    
	    //액분석관리
	    private String auto_track;
	    private String meq_min_spec;
	    private String meq_max_spec;
	    private String ph_input;
	    private String ph_min_spec;
	    private String ph_max_spec;
	    private String conductivity_input;
	    private String conductivity_min_spec;
	    private String conductivity_max_spec;
	    private String nv_baking;
	    private String nv_foil;
	    private String nv_paint;
	    private String ash_baking;
	    private String ash_do;
	    private String ash_paint;
	    private String meq_kcc;
	    private String ash_kcc;
	    private String nv_kcc;
	    private String ph_kcc;
	    private String conductivity_kcc;
	    private String meq_result;
	    private String ash_result;
	    private String nv_result;
	    private String ph_result;
	    private String conductivity_result;
	    private String meq_result2;
	    private String ash_result2;
	    private String nv_result2;
	    private String ph_result2;
	    private String conductivity_result2;
	    
	    private String regdate;
	    private String sample;
	    private String part_no;
	    private String part_name;
	    private String end_date;
	    private String file;
	    private String file_url;
	    private String cct_id;
	    private String sst_id;
	    private String before_weight;
	    private String after_weight;
	    private String count;
	    private String surface;
	    private String viscosity;
	    private String calc1;
	    private String calc2;
	    private String calc3;
	    private String attachment_id;
	    
	    //테스트/시험정보 그래프
	    private String t1;
	    private String t2;
	    private String t3;
	    private String t4;
	    private String t5;
	    private String t6;
	    private String t7;
	    private String t8;
	    private String t9;
	    private String t10;
	    private String t11;
	    private String t12;
	    private String t13;
	    private String min_calc3_G600;
	    private String min_calc3_G800;
	    private String min_calc3_PLUS;
	    private String min_calc3_ML;
	    private String min_calc3_KB;

	    
	    
		public String getDefect_place() {
			return defect_place;
		}
		public void setDefect_place(String defect_place) {
			this.defect_place = defect_place;
		}
		public String getMeq_result2() {
			return meq_result2;
		}
		public void setMeq_result2(String meq_result2) {
			this.meq_result2 = meq_result2;
		}
		public String getAsh_result2() {
			return ash_result2;
		}
		public void setAsh_result2(String ash_result2) {
			this.ash_result2 = ash_result2;
		}
		public String getNv_result2() {
			return nv_result2;
		}
		public void setNv_result2(String nv_result2) {
			this.nv_result2 = nv_result2;
		}
		public String getPh_result2() {
			return ph_result2;
		}
		public void setPh_result2(String ph_result2) {
			this.ph_result2 = ph_result2;
		}
		public String getConductivity_result2() {
			return conductivity_result2;
		}
		public void setConductivity_result2(String conductivity_result2) {
			this.conductivity_result2 = conductivity_result2;
		}
		public String getMin_calc3_PLUS() {
			return min_calc3_PLUS;
		}
		public void setMin_calc3_PLUS(String min_calc3_PLUS) {
			this.min_calc3_PLUS = min_calc3_PLUS;
		}
		public String getMin_calc3_ML() {
			return min_calc3_ML;
		}
		public void setMin_calc3_ML(String min_calc3_ML) {
			this.min_calc3_ML = min_calc3_ML;
		}
		public String getMin_calc3_KB() {
			return min_calc3_KB;
		}
		public void setMin_calc3_KB(String min_calc3_KB) {
			this.min_calc3_KB = min_calc3_KB;
		}
		public String getMin_calc3_G600() {
			return min_calc3_G600;
		}
		public void setMin_calc3_G600(String min_calc3_G600) {
			this.min_calc3_G600 = min_calc3_G600;
		}
		public String getMin_calc3_G800() {
			return min_calc3_G800;
		}
		public void setMin_calc3_G800(String min_calc3_G800) {
			this.min_calc3_G800 = min_calc3_G800;
		}
		public String getT1() {
			return t1;
		}
		public void setT1(String t1) {
			this.t1 = t1;
		}
		public String getT2() {
			return t2;
		}
		public void setT2(String t2) {
			this.t2 = t2;
		}
		public String getT3() {
			return t3;
		}
		public void setT3(String t3) {
			this.t3 = t3;
		}
		public String getT4() {
			return t4;
		}
		public void setT4(String t4) {
			this.t4 = t4;
		}
		public String getT5() {
			return t5;
		}
		public void setT5(String t5) {
			this.t5 = t5;
		}
		public String getT6() {
			return t6;
		}
		public void setT6(String t6) {
			this.t6 = t6;
		}
		public String getT7() {
			return t7;
		}
		public void setT7(String t7) {
			this.t7 = t7;
		}
		public String getT8() {
			return t8;
		}
		public void setT8(String t8) {
			this.t8 = t8;
		}
		public String getT9() {
			return t9;
		}
		public void setT9(String t9) {
			this.t9 = t9;
		}
		public String getT10() {
			return t10;
		}
		public void setT10(String t10) {
			this.t10 = t10;
		}
		public String getT11() {
			return t11;
		}
		public void setT11(String t11) {
			this.t11 = t11;
		}
		public String getT12() {
			return t12;
		}
		public void setT12(String t12) {
			this.t12 = t12;
		}
		public String getT13() {
			return t13;
		}
		public void setT13(String t13) {
			this.t13 = t13;
		}
		public String getRegdate() {
			return regdate;
		}
		public void setRegdate(String regdate) {
			this.regdate = regdate;
		}
		public String getSample() {
			return sample;
		}
		public void setSample(String sample) {
			this.sample = sample;
		}
		public String getPart_no() {
			return part_no;
		}
		public void setPart_no(String part_no) {
			this.part_no = part_no;
		}
		public String getPart_name() {
			return part_name;
		}
		public void setPart_name(String part_name) {
			this.part_name = part_name;
		}
		public String getEnd_date() {
			return end_date;
		}
		public void setEnd_date(String end_date) {
			this.end_date = end_date;
		}
		public String getFile() {
			return file;
		}
		public void setFile(String file) {
			this.file = file;
		}
		public String getFile_url() {
			return file_url;
		}
		public void setFile_url(String file_url) {
			this.file_url = file_url;
		}
		public String getCct_id() {
			return cct_id;
		}
		public void setCct_id(String cct_id) {
			this.cct_id = cct_id;
		}
		public String getSst_id() {
			return sst_id;
		}
		public void setSst_id(String sst_id) {
			this.sst_id = sst_id;
		}
		public String getBefore_weight() {
			return before_weight;
		}
		public void setBefore_weight(String before_weight) {
			this.before_weight = before_weight;
		}
		public String getAfter_weight() {
			return after_weight;
		}
		public void setAfter_weight(String after_weight) {
			this.after_weight = after_weight;
		}
		public String getCount() {
			return count;
		}
		public void setCount(String count) {
			this.count = count;
		}
		public String getSurface() {
			return surface;
		}
		public void setSurface(String surface) {
			this.surface = surface;
		}
		public String getViscosity() {
			return viscosity;
		}
		public void setViscosity(String viscosity) {
			this.viscosity = viscosity;
		}
		public String getCalc1() {
			return calc1;
		}
		public void setCalc1(String calc1) {
			this.calc1 = calc1;
		}
		public String getCalc2() {
			return calc2;
		}
		public void setCalc2(String calc2) {
			this.calc2 = calc2;
		}
		public String getCalc3() {
			return calc3;
		}
		public void setCalc3(String calc3) {
			this.calc3 = calc3;
		}
		public String getAttachment_id() {
			return attachment_id;
		}
		public void setAttachment_id(String attachment_id) {
			this.attachment_id = attachment_id;
		}
		public String getNv_baking() {
			return nv_baking;
		}
		public void setNv_baking(String nv_baking) {
			this.nv_baking = nv_baking;
		}
		public String getNv_foil() {
			return nv_foil;
		}
		public void setNv_foil(String nv_foil) {
			this.nv_foil = nv_foil;
		}
		public String getNv_paint() {
			return nv_paint;
		}
		public void setNv_paint(String nv_paint) {
			this.nv_paint = nv_paint;
		}
		public String getAsh_baking() {
			return ash_baking;
		}
		public void setAsh_baking(String ash_baking) {
			this.ash_baking = ash_baking;
		}
		public String getAsh_do() {
			return ash_do;
		}
		public void setAsh_do(String ash_do) {
			this.ash_do = ash_do;
		}
		public String getAsh_paint() {
			return ash_paint;
		}
		public void setAsh_paint(String ash_paint) {
			this.ash_paint = ash_paint;
		}
		public String getMeq_kcc() {
			return meq_kcc;
		}
		public void setMeq_kcc(String meq_kcc) {
			this.meq_kcc = meq_kcc;
		}
		public String getAsh_kcc() {
			return ash_kcc;
		}
		public void setAsh_kcc(String ash_kcc) {
			this.ash_kcc = ash_kcc;
		}
		public String getNv_kcc() {
			return nv_kcc;
		}
		public void setNv_kcc(String nv_kcc) {
			this.nv_kcc = nv_kcc;
		}
		public String getPh_kcc() {
			return ph_kcc;
		}
		public void setPh_kcc(String ph_kcc) {
			this.ph_kcc = ph_kcc;
		}
		public String getConductivity_kcc() {
			return conductivity_kcc;
		}
		public void setConductivity_kcc(String conductivity_kcc) {
			this.conductivity_kcc = conductivity_kcc;
		}
		public String getMeq_result() {
			return meq_result;
		}
		public void setMeq_result(String meq_result) {
			this.meq_result = meq_result;
		}
		public String getAsh_result() {
			return ash_result;
		}
		public void setAsh_result(String ash_result) {
			this.ash_result = ash_result;
		}
		public String getNv_result() {
			return nv_result;
		}
		public void setNv_result(String nv_result) {
			this.nv_result = nv_result;
		}
		public String getPh_result() {
			return ph_result;
		}
		public void setPh_result(String ph_result) {
			this.ph_result = ph_result;
		}
		public String getConductivity_result() {
			return conductivity_result;
		}
		public void setConductivity_result(String conductivity_result) {
			this.conductivity_result = conductivity_result;
		}
		public String getAuto_track() {
			return auto_track;
		}
		public void setAuto_track(String auto_track) {
			this.auto_track = auto_track;
		}
		public String getMeq_min_spec() {
			return meq_min_spec;
		}
		public void setMeq_min_spec(String meq_min_spec) {
			this.meq_min_spec = meq_min_spec;
		}
		public String getMeq_max_spec() {
			return meq_max_spec;
		}
		public void setMeq_max_spec(String meq_max_spec) {
			this.meq_max_spec = meq_max_spec;
		}
		public String getPh_input() {
			return ph_input;
		}
		public void setPh_input(String ph_input) {
			this.ph_input = ph_input;
		}
		public String getPh_min_spec() {
			return ph_min_spec;
		}
		public void setPh_min_spec(String ph_min_spec) {
			this.ph_min_spec = ph_min_spec;
		}
		public String getPh_max_spec() {
			return ph_max_spec;
		}
		public void setPh_max_spec(String ph_max_spec) {
			this.ph_max_spec = ph_max_spec;
		}
		public String getConductivity_input() {
			return conductivity_input;
		}
		public void setConductivity_input(String conductivity_input) {
			this.conductivity_input = conductivity_input;
		}
		public String getConductivity_min_spec() {
			return conductivity_min_spec;
		}
		public void setConductivity_min_spec(String conductivity_min_spec) {
			this.conductivity_min_spec = conductivity_min_spec;
		}
		public String getConductivity_max_spec() {
			return conductivity_max_spec;
		}
		public void setConductivity_max_spec(String conductivity_max_spec) {
			this.conductivity_max_spec = conductivity_max_spec;
		}
		public String getTest_num() {
			return test_num;
		}
		public void setTest_num(String test_num) {
			this.test_num = test_num;
		}
		public Float getHafter_1() {
			return hafter_1;
		}
		public void setHafter_1(Float hafter_1) {
			this.hafter_1 = hafter_1;
		}
		public Float getEmpty_2() {
			return empty_2;
		}
		public void setEmpty_2(Float empty_2) {
			this.empty_2 = empty_2;
		}
		public Float getHbefore_3() {
			return hbefore_3;
		}
		public void setHbefore_3(Float hbefore_3) {
			this.hbefore_3 = hbefore_3;
		}
		public String getMin_spec() {
			return min_spec;
		}
		public void setMin_spec(String min_spec) {
			this.min_spec = min_spec;
		}
		public String getMax_spec() {
			return max_spec;
		}
		public void setMax_spec(String max_spec) {
			this.max_spec = max_spec;
		}
		public String getSpec() {
			return spec;
		}
		public void setSpec(String spec) {
			this.spec = spec;
		}
		public String getAcid_reduce() {
			return acid_reduce;
		}
		public void setAcid_reduce(String acid_reduce) {
			this.acid_reduce = acid_reduce;
		}
		public String getNaoh_density() {
			return naoh_density;
		}
		public void setNaoh_density(String naoh_density) {
			this.naoh_density = naoh_density;
		}
		public String getEtc1() {
			return etc1;
		}
		public void setEtc1(String etc1) {
			this.etc1 = etc1;
		}
		public String getEtc2() {
			return etc2;
		}
		public void setEtc2(String etc2) {
			this.etc2 = etc2;
		}
		public String getEtc3() {
			return etc3;
		}
		public void setEtc3(String etc3) {
			this.etc3 = etc3;
		}
		public String getEtc4() {
			return etc4;
		}
		public void setEtc4(String etc4) {
			this.etc4 = etc4;
		}
		public String getEtc5() {
			return etc5;
		}
		public void setEtc5(String etc5) {
			this.etc5 = etc5;
		}
		public String getEtc6() {
			return etc6;
		}
		public void setEtc6(String etc6) {
			this.etc6 = etc6;
		}
		public String getNumber() {
			return number;
		}
		public void setNumber(String number) {
			this.number = number;
		}
		public String getDate() {
			return date;
		}
		public void setDate(String date) {
			this.date = date;
		}
		public String getSst1() {
			return sst1;
		}
		public void setSst1(String sst1) {
			this.sst1 = sst1;
		}
		public String getSst2() {
			return sst2;
		}
		public void setSst2(String sst2) {
			this.sst2 = sst2;
		}
		public String getSst3() {
			return sst3;
		}
		public void setSst3(String sst3) {
			this.sst3 = sst3;
		}
		public String getCct1() {
			return cct1;
		}
		public void setCct1(String cct1) {
			this.cct1 = cct1;
		}
		public String getCct2() {
			return cct2;
		}
		public void setCct2(String cct2) {
			this.cct2 = cct2;
		}
		public String getCct3() {
			return cct3;
		}
		public void setCct3(String cct3) {
			this.cct3 = cct3;
		}
		public String getContact1() {
			return contact1;
		}
		public void setContact1(String contact1) {
			this.contact1 = contact1;
		}
		public String getContact2() {
			return contact2;
		}
		public void setContact2(String contact2) {
			this.contact2 = contact2;
		}
		public String getContact3() {
			return contact3;
		}
		public void setContact3(String contact3) {
			this.contact3 = contact3;
		}
		public String getGattach1() {
			return gattach1;
		}
		public void setGattach1(String gattach1) {
			this.gattach1 = gattach1;
		}
		public String getGattach2() {
			return gattach2;
		}
		public void setGattach2(String gattach2) {
			this.gattach2 = gattach2;
		}
		public String getGattach3() {
			return gattach3;
		}
		public void setGattach3(String gattach3) {
			this.gattach3 = gattach3;
		}
		public String getAfter_attach1() {
			return after_attach1;
		}
		public void setAfter_attach1(String after_attach1) {
			this.after_attach1 = after_attach1;
		}
		public String getAfter_attach2() {
			return after_attach2;
		}
		public void setAfter_attach2(String after_attach2) {
			this.after_attach2 = after_attach2;
		}
		public String getAfter_attach3() {
			return after_attach3;
		}
		public void setAfter_attach3(String after_attach3) {
			this.after_attach3 = after_attach3;
		}
		public String getHeat1() {
			return heat1;
		}
		public void setHeat1(String heat1) {
			this.heat1 = heat1;
		}
		public String getHeat2() {
			return heat2;
		}
		public void setHeat2(String heat2) {
			this.heat2 = heat2;
		}
		public String getHeat3() {
			return heat3;
		}
		public void setHeat3(String heat3) {
			this.heat3 = heat3;
		}
		public String getClean1() {
			return clean1;
		}
		public void setClean1(String clean1) {
			this.clean1 = clean1;
		}
		public String getClean2() {
			return clean2;
		}
		public void setClean2(String clean2) {
			this.clean2 = clean2;
		}
		public String getClean3() {
			return clean3;
		}
		public void setClean3(String clean3) {
			this.clean3 = clean3;
		}
		public String getShot1() {
			return shot1;
		}
		public void setShot1(String shot1) {
			this.shot1 = shot1;
		}
		public String getShot2() {
			return shot2;
		}
		public void setShot2(String shot2) {
			this.shot2 = shot2;
		}
		public String getShot3() {
			return shot3;
		}
		public void setShot3(String shot3) {
			this.shot3 = shot3;
		}
		public Integer getNum() {
			return num;
		}
		public void setNum(Integer num) {
			this.num = num;
		}
		public Integer getNaoh_result() {
			return naoh_result;
		}
		public void setNaoh_result(Integer naoh_result) {
			this.naoh_result = naoh_result;
		}
		public Float getHcl() {
			return hcl;
		}
		public void setHcl(Float hcl) {
			this.hcl = hcl;
		}
		public Integer getLiter() {
			return liter;
		}
		public void setLiter(Integer liter) {
			this.liter = liter;
		}
		public Float getNaoh() {
			return naoh;
		}
		public void setNaoh(Float naoh) {
			this.naoh = naoh;
		}
		public Float getSc300a() {
			return sc300a;
		}
		public void setSc300a(Float sc300a) {
			this.sc300a = sc300a;
		}
		public Float getSc300b() {
			return sc300b;
		}
		public void setSc300b(Float sc300b) {
			this.sc300b = sc300b;
		}
		public Float getCondense() {
			return condense;
		}
		public void setCondense(Float condense) {
			this.condense = condense;
		}
		public Float getAfter_naoh() {
			return after_naoh;
		}
		public void setAfter_naoh(Float after_naoh) {
			this.after_naoh = after_naoh;
		}
		public Integer getTable_code() {
			return table_code;
		}
		public void setTable_code(Integer table_code) {
			this.table_code = table_code;
		}
		public String getGroup_id() {
			return group_id;
		}
		public void setGroup_id(String group_id) {
			this.group_id = group_id;
		}
		public String getItem_cd() {
			return item_cd;
		}
		public void setItem_cd(String item_cd) {
			this.item_cd = item_cd;
		}
		public String getItem_nm() {
			return item_nm;
		}
		public void setItem_nm(String item_nm) {
			this.item_nm = item_nm;
		}
		public String getCoating_nm() {
			return coating_nm;
		}
		public void setCoating_nm(String coating_nm) {
			this.coating_nm = coating_nm;
		}
		public String getSample_f() {
			return sample_f;
		}
		public void setSample_f(String sample_f) {
			this.sample_f = sample_f;
		}
		public String getArea_g() {
			return area_g;
		}
		public void setArea_g(String area_g) {
			this.area_g = area_g;
		}
		public String getTotal_area_h() {
			return total_area_h;
		}
		public void setTotal_area_h(String total_area_h) {
			this.total_area_h = total_area_h;
		}
		public String getUser_id() {
			return user_id;
		}
		public void setUser_id(String user_id) {
			this.user_id = user_id;
		}
		public String getUpd_dt() {
			return upd_dt;
		}
		public void setUpd_dt(String upd_dt) {
			this.upd_dt = upd_dt;
		}
		public String getNo() {
			return no;
		}
		public void setNo(String no) {
			this.no = no;
		}
		public String getStartDate() {
			return startDate;
		}
		public void setStartDate(String startDate) {
			this.startDate = startDate;
		}
		public String getEquipment_name() {
			return Equipment_name;
		}
		public void setEquipment_name(String equipment_name) {
			Equipment_name = equipment_name;
		}
		public String getEndDate() {
			return endDate;
		}
		public void setEndDate(String endDate) {
			this.endDate = endDate;
		}
		public String getDefect_date() {
			return defect_date;
		}
		public void setDefect_date(String defect_date) {
			this.defect_date = defect_date;
		}
		public String getDefect_type() {
			return defect_type;
		}
		public void setDefect_type(String defect_type) {
			this.defect_type = defect_type;
		}
		public String getEquipment() {
			return equipment;
		}
		public void setEquipment(String equipment) {
			this.equipment = equipment;
		}
		public String getProduct_no() {
			return product_no;
		}
		public void setProduct_no(String product_no) {
			this.product_no = product_no;
		}
		public String getProduct_name() {
			return product_name;
		}
		public void setProduct_name(String product_name) {
			this.product_name = product_name;
		}
		public String getDefect_lot() {
			return defect_lot;
		}
		public void setDefect_lot(String defect_lot) {
			this.defect_lot = defect_lot;
		}
		public String getWorker() {
			return worker;
		}
		public void setWorker(String worker) {
			this.worker = worker;
		}
		public String getAction() {
			return action;
		}
		public void setAction(String action) {
			this.action = action;
		}
		public String getSelection_method() {
			return selection_method;
		}
		public void setSelection_method(String selection_method) {
			this.selection_method = selection_method;
		}
		public String getAction_date() {
			return action_date;
		}
		public void setAction_date(String action_date) {
			this.action_date = action_date;
		}
		public String getDefect_quantity() {
			return defect_quantity;
		}
		public void setDefect_quantity(String defect_quantity) {
			this.defect_quantity = defect_quantity;
		}
		public String getCause() {
			return cause;
		}
		public void setCause(String cause) {
			this.cause = cause;
		}
		public String getImprovement() {
			return improvement;
		}
		public void setImprovement(String improvement) {
			this.improvement = improvement;
		}
		public String getYn_a() {
			return yn_a;
		}
		public void setYn_a(String yn_a) {
			this.yn_a = yn_a;
		}
		public String getYn_b() {
			return yn_b;
		}
		public void setYn_b(String yn_b) {
			this.yn_b = yn_b;
		}
		public String getStart_date() {
			return start_date;
		}
		public void setStart_date(String start_date) {
			this.start_date = start_date;
		}
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getMch_name() {
			return mch_name;
		}
		public void setMch_name(String mch_name) {
			this.mch_name = mch_name;
		}
		public String getT_year() {
			return t_year;
		}
		public void setT_year(String t_year) {
			this.t_year = t_year;
		}
		public String getT_month() {
			return t_month;
		}
		public void setT_month(String t_month) {
			this.t_month = t_month;
		}
		public String getT_url() {
			return t_url;
		}
		public void setT_url(String t_url) {
			this.t_url = t_url;
		}
		public String getT_ok() {
			return t_ok;
		}
		public void setT_ok(String t_ok) {
			this.t_ok = t_ok;
		}
		public String getT_gb() {
			return t_gb;
		}
		public void setT_gb(String t_gb) {
			this.t_gb = t_gb;
		}
		public String getT_day() {
			return t_day;
		}
		public void setT_day(String t_day) {
			this.t_day = t_day;
		}
		public String getT_min() {
			return t_min;
		}
		public void setT_min(String t_min) {
			this.t_min = t_min;
		}
		public String getT_result() {
			return t_result;
		}
		public void setT_result(String t_result) {
			this.t_result = t_result;
		}
		public String getIn_day() {
			return in_day;
		}
		public void setIn_day(String in_day) {
			this.in_day = in_day;
		}
		public String getPage() {
			return page;
		}
		public void setPage(String page) {
			this.page = page;
		}
		public String getSupplier() {
			return supplier;
		}
		public void setSupplier(String supplier) {
			this.supplier = supplier;
		}
		public String getMedicine() {
			return medicine;
		}
		public void setMedicine(String medicine) {
			this.medicine = medicine;
		}
		public String getLot() {
			return lot;
		}
		public void setLot(String lot) {
			this.lot = lot;
		}
		
		public String getNv_1() {
			return nv_1;
		}
		public void setNv_1(String nv_1) {
			this.nv_1 = nv_1;
		}
		public String getNv_2() {
			return nv_2;
		}
		public void setNv_2(String nv_2) {
			this.nv_2 = nv_2;
		}
		public String getColor_1() {
			return color_1;
		}
		public void setColor_1(String color_1) {
			this.color_1 = color_1;
		}
		public String getColor_2() {
			return color_2;
		}
		public void setColor_2(String color_2) {
			this.color_2 = color_2;
		}
		public String getSensuality_1_1() {
			return sensuality_1_1;
		}
		public void setSensuality_1_1(String sensuality_1_1) {
			this.sensuality_1_1 = sensuality_1_1;
		}
		public String getSensuality_2_1() {
			return sensuality_2_1;
		}
		public void setSensuality_2_1(String sensuality_2_1) {
			this.sensuality_2_1 = sensuality_2_1;
		}
		public String getSensuality_1_2() {
			return sensuality_1_2;
		}
		public void setSensuality_1_2(String sensuality_1_2) {
			this.sensuality_1_2 = sensuality_1_2;
		}
		public String getSensuality_2_2() {
			return sensuality_2_2;
		}
		public void setSensuality_2_2(String sensuality_2_2) {
			this.sensuality_2_2 = sensuality_2_2;
		}
		public String getConfirm() {
			return confirm;
		}
		public void setConfirm(String confirm) {
			this.confirm = confirm;
		}
		public String getFile_name() {
			return file_name;
		}
		public void setFile_name(String file_name) {
			this.file_name = file_name;
		}
		public String getWriter() {
			return writer;
		}
		public void setWriter(String writer) {
			this.writer = writer;
		}
		public String getConfirmer() {
			return confirmer;
		}
		public void setConfirmer(String confirmer) {
			this.confirmer = confirmer;
		}
		public String getPh_1() {
			return ph_1;
		}
		public void setPh_1(String ph_1) {
			this.ph_1 = ph_1;
		}
		public String getPh_2() {
			return ph_2;
		}
		public void setPh_2(String ph_2) {
			this.ph_2 = ph_2;
		}
		public String getSpecific_gravity_1() {
			return specific_gravity_1;
		}
		public void setSpecific_gravity_1(String specific_gravity_1) {
			this.specific_gravity_1 = specific_gravity_1;
		}
		public String getSpecific_gravity_2() {
			return specific_gravity_2;
		}
		public void setSpecific_gravity_2(String specific_gravity_2) {
			this.specific_gravity_2 = specific_gravity_2;
		}
		public String getViscosity_1() {
			return viscosity_1;
		}
		public void setViscosity_1(String viscosity_1) {
			this.viscosity_1 = viscosity_1;
		}
		public String getViscosity_2() {
			return viscosity_2;
		}
		public void setViscosity_2(String viscosity_2) {
			this.viscosity_2 = viscosity_2;
		}
		public String getHardness_1() {
			return hardness_1;
		}
		public void setHardness_1(String hardness_1) {
			this.hardness_1 = hardness_1;
		}
		public String getHardness_2() {
			return hardness_2;
		}
		public void setHardness_2(String hardness_2) {
			this.hardness_2 = hardness_2;
		}
		public String getShort_1() {
			return short_1;
		}
		public void setShort_1(String short_1) {
			this.short_1 = short_1;
		}
		public String getShort_2() {
			return short_2;
		}
		public void setShort_2(String short_2) {
			this.short_2 = short_2;
		}
		public String getAppearance_1() {
			return appearance_1;
		}
		public void setAppearance_1(String appearance_1) {
			this.appearance_1 = appearance_1;
		}
		public String getAppearance_2() {
			return appearance_2;
		}
		public void setAppearance_2(String appearance_2) {
			this.appearance_2 = appearance_2;
		}
		public String getEx_1_1() {
			return ex_1_1;
		}
		public void setEx_1_1(String ex_1_1) {
			this.ex_1_1 = ex_1_1;
		}
		public String getEx_1_2() {
			return ex_1_2;
		}
		public void setEx_1_2(String ex_1_2) {
			this.ex_1_2 = ex_1_2;
		}
		public String getEx_2_1() {
			return ex_2_1;
		}
		public void setEx_2_1(String ex_2_1) {
			this.ex_2_1 = ex_2_1;
		}
		public String getEx_2_2() {
			return ex_2_2;
		}
		public void setEx_2_2(String ex_2_2) {
			this.ex_2_2 = ex_2_2;
		}
		public String getResult() {
			return result;
		}
		public void setResult(String result) {
			this.result = result;
		}
		public String getUpdate_id() {
			return update_id;
		}
		public void setUpdate_id(String update_id) {
			this.update_id = update_id;
		}
		@Override
		public String toString() {
			return "Quality [no=" + no + ", startDate=" + startDate + ", in_day=" + in_day + ", page=" + page
					+ ", supplier=" + supplier + ", medicine=" + medicine + ", lot=" + lot + ", nv_1=" + nv_1 + ", color_1="
					+ color_1 + ",color_2=" + color_2 + ", sensuality_1_1=" + sensuality_1_1 + ", sensuality_2_1=" + sensuality_2_1
					+ ", sensuality_1_2=" + sensuality_1_2 + ", sensuality_2_2=" + sensuality_2_2 + ", confirm="
					+ confirm + ", file_name=" + file_name + ", writer=" + writer + ", confirmer=" + confirmer
					+ ", ph_1=" + ph_1 + ", ph_2=" + ph_2 + ", specific_gravity_1=" + specific_gravity_1
					+ ", specific_gravity_2=" + specific_gravity_2 + ", viscosity_1=" + viscosity_1 + ", viscosity_2="
					+ viscosity_2 + ", hardness_1=" + hardness_1 + ", hardness_2=" + hardness_2 + ", short_1=" + short_1
					+ ", short_2=" + short_2 + ", appearance_1=" + appearance_1 + ", appearance_2=" + appearance_2
					+ ", ex_1_1=" + ex_1_1 + ", ex_1_2=" + ex_1_2 + ", ex_2_1=" + ex_2_1 + ", ex_2_2=" + ex_2_2
					+ ", result=" + result + ", update_id=" + update_id + "]";
		}

}
