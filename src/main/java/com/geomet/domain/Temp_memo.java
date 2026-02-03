package com.geomet.domain;

public class Temp_memo {
	    private int memo_id;           // PK
	    private String mch_code;       // 설비 코드
	    private String memo_time;      // 메모 시간 (DATETIME)
	    private String memo_content;   // 메모 내용
	    private String reg_date;       // 등록 시간
	    
	    // 검색용 필드
	    private String startDate;
	    private String endDate;
		public int getMemo_id() {
			return memo_id;
		}
		public void setMemo_id(int memo_id) {
			this.memo_id = memo_id;
		}
		public String getMch_code() {
			return mch_code;
		}
		public void setMch_code(String mch_code) {
			this.mch_code = mch_code;
		}
		public String getMemo_time() {
			return memo_time;
		}
		public void setMemo_time(String memo_time) {
			this.memo_time = memo_time;
		}
		public String getMemo_content() {
			return memo_content;
		}
		public void setMemo_content(String memo_content) {
			this.memo_content = memo_content;
		}
		public String getReg_date() {
			return reg_date;
		}
		public void setReg_date(String reg_date) {
			this.reg_date = reg_date;
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
	    
	    
	    
}
