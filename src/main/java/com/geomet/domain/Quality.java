package com.geomet.domain;

public class Quality {

	

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
