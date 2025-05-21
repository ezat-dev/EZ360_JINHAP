package com.geomet.domain;

public class Users {
	
	private String column;
	private String value;
	private String date;
	private String s_date;
	private String s_time;

	//tb_user테이블(작업자 등록)
	private String user_code;
	private String user_id;
	private String user_pw;
	private String user_level;
	private String user_name;
	private String user_busu;
	private String user_jick;
	private String user_phone;
	private String user_yn;
	private String start_day;
	private String st_day;
	//tb_plan_manage
    private String no;
    private String u_code;
    private String duty;
    private String employee_no;
    private String name;
    private String education;
    private String career;
    private String training;
    private String cert_name;
    private String acquisition_date;
    private String next_date;

    private String note;
    
    private String startDate;
    private String endDate;
    private String file_name;
    
	
    
    private Integer id;
    private String category;      // 구분
    private String day_shift;      // 주간
    private String night_shift;    // 야간

    
    
  
    private String task;               // 업무
    private String team_a;             // A조
    private String team_b;             // B조
    private String team_c;             // C조
    private String sub_task;           // 업무2
    private String always_day_shift;    // 상시주간
    
    
    

    private String division;        // 구분
    private String shift_type;      // 주/야
    private String line_leader;     // 라인장
    private String degreasing;      // 탈유탈지
    private String shot;            // 쇼트
    private String g800;            // G-800
    private String g600;            // G-600
    private String common;          // 공용설비
    private String k_black;         // K-BLACK
    private String liquid_mgmt;     // 액관리
    private String e_coating;       // e-coating
    private String group_leader;    // 그룹장
    private String rust;            // 방청
    private String lab;             // 실험
    private String memo;            // 메모
	public String getColumn() {
		return column;
	}
	public void setColumn(String column) {
		this.column = column;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getS_date() {
		return s_date;
	}
	public void setS_date(String s_date) {
		this.s_date = s_date;
	}
	public String getS_time() {
		return s_time;
	}
	public void setS_time(String s_time) {
		this.s_time = s_time;
	}
	public String getUser_code() {
		return user_code;
	}
	public void setUser_code(String user_code) {
		this.user_code = user_code;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_level() {
		return user_level;
	}
	public void setUser_level(String user_level) {
		this.user_level = user_level;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_busu() {
		return user_busu;
	}
	public void setUser_busu(String user_busu) {
		this.user_busu = user_busu;
	}
	public String getUser_jick() {
		return user_jick;
	}
	public void setUser_jick(String user_jick) {
		this.user_jick = user_jick;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_yn() {
		return user_yn;
	}
	public void setUser_yn(String user_yn) {
		this.user_yn = user_yn;
	}
	public String getStart_day() {
		return start_day;
	}
	public void setStart_day(String start_day) {
		this.start_day = start_day;
	}
	public String getSt_day() {
		return st_day;
	}
	public void setSt_day(String st_day) {
		this.st_day = st_day;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getU_code() {
		return u_code;
	}
	public void setU_code(String u_code) {
		this.u_code = u_code;
	}
	public String getDuty() {
		return duty;
	}
	public void setDuty(String duty) {
		this.duty = duty;
	}
	public String getEmployee_no() {
		return employee_no;
	}
	public void setEmployee_no(String employee_no) {
		this.employee_no = employee_no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getCareer() {
		return career;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	public String getTraining() {
		return training;
	}
	public void setTraining(String training) {
		this.training = training;
	}
	public String getCert_name() {
		return cert_name;
	}
	public void setCert_name(String cert_name) {
		this.cert_name = cert_name;
	}
	public String getAcquisition_date() {
		return acquisition_date;
	}
	public void setAcquisition_date(String acquisition_date) {
		this.acquisition_date = acquisition_date;
	}
	public String getNext_date() {
		return next_date;
	}
	public void setNext_date(String next_date) {
		this.next_date = next_date;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getDay_shift() {
		return day_shift;
	}
	public void setDay_shift(String day_shift) {
		this.day_shift = day_shift;
	}
	public String getNight_shift() {
		return night_shift;
	}
	public void setNight_shift(String night_shift) {
		this.night_shift = night_shift;
	}
	public String getTask() {
		return task;
	}
	public void setTask(String task) {
		this.task = task;
	}
	public String getTeam_a() {
		return team_a;
	}
	public void setTeam_a(String team_a) {
		this.team_a = team_a;
	}
	public String getTeam_b() {
		return team_b;
	}
	public void setTeam_b(String team_b) {
		this.team_b = team_b;
	}
	public String getTeam_c() {
		return team_c;
	}
	public void setTeam_c(String team_c) {
		this.team_c = team_c;
	}
	public String getSub_task() {
		return sub_task;
	}
	public void setSub_task(String sub_task) {
		this.sub_task = sub_task;
	}
	public String getAlways_day_shift() {
		return always_day_shift;
	}
	public void setAlways_day_shift(String always_day_shift) {
		this.always_day_shift = always_day_shift;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	public String getShift_type() {
		return shift_type;
	}
	public void setShift_type(String shift_type) {
		this.shift_type = shift_type;
	}
	public String getLine_leader() {
		return line_leader;
	}
	public void setLine_leader(String line_leader) {
		this.line_leader = line_leader;
	}
	public String getDegreasing() {
		return degreasing;
	}
	public void setDegreasing(String degreasing) {
		this.degreasing = degreasing;
	}
	public String getShot() {
		return shot;
	}
	public void setShot(String shot) {
		this.shot = shot;
	}
	public String getG800() {
		return g800;
	}
	public void setG800(String g800) {
		this.g800 = g800;
	}
	public String getG600() {
		return g600;
	}
	public void setG600(String g600) {
		this.g600 = g600;
	}
	public String getCommon() {
		return common;
	}
	public void setCommon(String common) {
		this.common = common;
	}
	public String getK_black() {
		return k_black;
	}
	public void setK_black(String k_black) {
		this.k_black = k_black;
	}
	public String getLiquid_mgmt() {
		return liquid_mgmt;
	}
	public void setLiquid_mgmt(String liquid_mgmt) {
		this.liquid_mgmt = liquid_mgmt;
	}
	public String getE_coating() {
		return e_coating;
	}
	public void setE_coating(String e_coating) {
		this.e_coating = e_coating;
	}
	public String getGroup_leader() {
		return group_leader;
	}
	public void setGroup_leader(String group_leader) {
		this.group_leader = group_leader;
	}
	public String getRust() {
		return rust;
	}
	public void setRust(String rust) {
		this.rust = rust;
	}
	public String getLab() {
		return lab;
	}
	public void setLab(String lab) {
		this.lab = lab;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
    

    
    
    
   
}
