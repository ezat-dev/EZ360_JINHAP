package com.geomet.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.BiFunction;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.geomet.domain.Machine;
import com.geomet.domain.Temp_data;
import com.geomet.domain.Work;
import com.geomet.service.MachineService;


@Controller
public class MachineController {

	@Autowired
	private MachineService machineService; 
	/*-----모니터링-----*/

	//통합 모니터링
	@RequestMapping(value= "/machine/allMonitoring", method = RequestMethod.GET)
	public String allMonitoring(Model model) {
		return "/machine/allMonitoring.jsp"; // 
	}

	//설비별 생산실적 현황
	@RequestMapping(value= "/machine/workReport", method = RequestMethod.GET)
	public String workReport(Model model) {
		return "/machine/workReport.jsp"; // 
	}

	//통합 모니터링
	@RequestMapping(value = "/machine/allMonitoring/list", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getTempMonitoringList() {
		Map<String, Object> rtnMap = new HashMap<>();
		try {

			Machine machine = new Machine();
			List<Machine> allList = machineService.getAllDataList(machine);

			rtnMap.put("status", "success");
			rtnMap.put("data", allList);
			rtnMap.put("count", allList.size());
		} catch (Exception e) {
			e.printStackTrace();
			rtnMap.put("status", "error");
			rtnMap.put("message", e.getMessage());
		}

		return rtnMap;
	}




	//설비별 모니터링
	@RequestMapping(value= "/machine/detailMonitoring", method = RequestMethod.GET)
	public String detailMonitoring(Model model) {
		return "/machine/detailMonitoring.jsp"; // 
	}

	//경보 모니터링
	@RequestMapping(value= "/machine/alarmMonitoring", method = RequestMethod.GET)
	public String alarmMonitoring(Model model) {
		return "/machine/alarmMonitoring.jsp"; // 
	}

	//경보 발생빈도
	@RequestMapping(value= "/machine/alarmList", method = RequestMethod.GET)
	public String alarmList(Model model) {
		return "/machine/alarmList.jsp"; // 
	}

	//설비별 온도경향 모니터링
	@RequestMapping(value= "/machine/tempMonitoring", method = RequestMethod.GET)
	public String tempMonitoring(Model model) {
		return "/machine/tempMonitoring.jsp"; // 
	}



	// 온도 모니터링 데이터 리스트
	@RequestMapping(value = "/machine/tempMonitoring/list", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getTempMonitoringList(@RequestParam(required = false) String startDate,
			@RequestParam(required = false) String endDate,
			@RequestParam(required = false) String mch_code) {
		Map<String, Object> rtnMap = new HashMap<>();

		try {

			Temp_data temp = new Temp_data();
			if (startDate != null && !startDate.isEmpty()) temp.setStartDate(startDate);
			if (endDate != null && !endDate.isEmpty()) temp.setEndDate(endDate);
			if (mch_code != null && !mch_code.isEmpty()) temp.setMch_code(mch_code);  // ✅ 이 부분도 꼭 필요

			List<Temp_data> tempList = machineService.getTempDataList(temp);
			/*
            for(Temp_data tt : tempList) {
            	System.out.println(tt.getTemp_time());
            }
			 */           
			rtnMap.put("status", "success");
			rtnMap.put("data", tempList);
			rtnMap.put("count", tempList.size());

		} catch (Exception e) {
			e.printStackTrace();
			rtnMap.put("status", "error");
			rtnMap.put("message", e.getMessage());
		}

		return rtnMap;
	}







	/*-----설비관리-----*/

	//정기점검 계획/실적
	@RequestMapping(value= "/machine/checkPlan", method = RequestMethod.GET)
	public String checkPlan(Model model) {
		return "/machine/checkPlan.jsp"; // 
	}

	//정기점검 계획/실적 조절 리스트
	@RequestMapping(value = "/machine/checkPlan/list", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> machineList(
			@RequestParam String startDate

			) {
		//System.out.println("Received request:");
		//System.out.println("startDate: " + startDate);

		Map<String, Object> rtnMap = new HashMap<>();

		try {

			Machine machine = new Machine();

			machine.setStartDate(startDate.isEmpty() ? null : startDate);        


			List<Machine> getMachineList = machineService.getMachineList(machine);

			//System.out.println("getMachineList Size: " + getMachineList.size());
			rtnMap.put("status", "success");
			rtnMap.put("last_page", 1);
			rtnMap.put("data", getMachineList);
		} catch (Exception e) {
			//System.out.println("Error occurred: " + e.getMessage());
			rtnMap.put("status", "error");
			rtnMap.put("message", e.getMessage());
		}

		return rtnMap;
	}


	//정기점검 계획/실적
	@RequestMapping(value = "/machine/checkPlan/update", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> saveNonProductManage(
			@ModelAttribute Machine machine,
			@RequestParam(value = "files", required = false) MultipartFile[] files) {

		Map<String, Object> rtnMap = new HashMap<>();

		try {

			machineService.updatecheckPlan(machine);


			if (files != null) {
				String uploadDir = "D:/GEOMET양식/정기점검 파일";

				File directory = new File(uploadDir);
				if (!directory.exists()) {
					directory.mkdirs(); 
				}

				for (MultipartFile file : files) {
					if (!file.isEmpty()) {
						String originalFilename = file.getOriginalFilename();
						File destination = new File(uploadDir + "/" + originalFilename);
						file.transferTo(destination);
					}
				}
			}

			rtnMap.put("result", "success");

		} catch (Exception e) {
			e.printStackTrace();
			rtnMap.put("result", "fail");
			rtnMap.put("message", e.getMessage());
		}

		return rtnMap;
	}
	//파일 다운로드
	@RequestMapping(value = "/downloadCk", method = RequestMethod.GET)
	public void downloadExcel(@RequestParam("filename") String filename,
			HttpServletResponse response) throws IOException {

		String baseDir = "D:/GEOMET양식/정기점검 파일/";

		//System.out.println("다운 주소 filename: " + filename);

		if (filename.contains("..") || filename.contains("/") || filename.contains("\\")) {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}

		File file = new File(baseDir + filename);
		//System.out.println("파일 전체 경로: " + file.getAbsolutePath());

		if (!file.exists()) {
			response.setStatus(HttpServletResponse.SC_NOT_FOUND);
			return;
		}

		String mimeType = Files.probeContentType(file.toPath());
		if (mimeType == null) {
			mimeType = "application/octet-stream";
		}
		response.setContentType(mimeType);
		response.setContentLengthLong(file.length());


		String encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");

		// 파일 다운로드 	
		// response.setHeader("Content-Disposition", "attachment; filename*=UTF-8''" + encodedFilename);

		//뷰어
		response.setHeader("Content-Disposition", "inline; filename*=UTF-8''" + encodedFilename);

		try (FileInputStream fis = new FileInputStream(file);
				OutputStream os = response.getOutputStream()) {
			byte[] buffer = new byte[1024];
			int len;
			while ((len = fis.read(buffer)) != -1) {
				os.write(buffer, 0, len);
			}
			os.flush();
		}
	}



	// 정기점검 계획/실적 엑셀
	@RequestMapping(value = "/machine/checkPlan/excel", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> nonProductManageExcel(@RequestParam(required = false) String startDate) {
		//System.out.println("정기점검 엑셀 다운로드 요청 params:");
		//System.out.println("startDate = " + startDate);

		Map<String, Object> rtnMap = new HashMap<>();

		// 날짜 및 파일명 생성
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd'_GEOMET양식_'HHmmss");
		Date time = new Date();
		String fileName = format.format(time) + ".xlsx";

		FileOutputStream fos = null;
		FileInputStream fis = null;
		String openPath = "D:/GEOMET양식/";
		String savePath = "D:/GEOMET양식/정기점검 계획/";

		// 받은 파라미터로 machine 조건 설정
		Machine machine = new Machine();
		machine.setStartDate(startDate);

		// 필터링된 데이터만 조회
		List<Machine> getMachineList = machineService.getMachineList(machine);
		//System.out.println("조회된 건수: " + (getMachineList != null ? getMachineList.size() : 0));

		if (getMachineList == null || getMachineList.isEmpty()) {
			rtnMap.put("error", "데이터 없음");
			return rtnMap;
		}

		try {
			fis = new FileInputStream(openPath + "08_01.설비관리_정기점검 계획실적.xlsx");
			XSSFWorkbook workbook = new XSSFWorkbook(fis);
			XSSFSheet sheet = workbook.getSheetAt(0);

			// 기존 스타일을 유지하면서 데이터만 삽입
			String[] fields = {"updated_at","item_type", "m1", "m2", "m3", "m4", "m5", "m6", "m7", "m8", "m9", "m10", "m11", "m12", "save_url", "remark" };

			int startRow = 9; // B10부터 시작 (row index는 0부터니까 9번 인덱스가 10번째 줄)
			int startCol = 1; // B열 (index 1)

			for (int i = 0; i < getMachineList.size(); i++) {
				Machine item = getMachineList.get(i);
				XSSFRow row = sheet.getRow(startRow + i);
				if (row == null) row = sheet.createRow(startRow + i);

				for (int j = 0; j < fields.length; j++) {
					XSSFCell cell = row.getCell(startCol + j);
					if (cell == null) cell = row.createCell(startCol + j);

					String value = "";
					try {
						Field field = Machine.class.getDeclaredField(fields[j]);
						field.setAccessible(true);
						Object fieldValue = field.get(item);
						value = (fieldValue != null) ? fieldValue.toString() : "";
					} catch (NoSuchFieldException | IllegalAccessException e) {
						value = "";
					}

					cell.setCellValue(value); // ✅ 스타일 유지
				}
			}

			workbook.setForceFormulaRecalculation(true);
			fos = new FileOutputStream(savePath + fileName);
			workbook.write(fos);
			workbook.close();
			fos.flush();

			rtnMap.put("data", savePath + fileName);

		} catch (Exception e) {
			e.printStackTrace();
			rtnMap.put("error", "엑셀 파일 생성 중 오류 발생");
		} finally {
			try {
				if (fis != null) fis.close();
				if (fos != null) fos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return rtnMap;
	}


	//설비 비가동현황(고장계획정지, 보수, 시간)
	@RequestMapping(value= "/machine/nonTime", method = RequestMethod.GET)
	public String nonTime(Model model) {
		return "/machine/nonTime.jsp"; // 
	}




	//비가동현황
	@RequestMapping(value = "/machine/nonTime/list", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getnonTimeList(
			@RequestParam(required = false) String startDate,
			@RequestParam(required = false) String endDate,
			@RequestParam(required = false) String equipment_name) {

		Map<String, Object> rtnMap = new HashMap<>();
		try {
			Machine machine = new Machine();
			machine.setStartDate(startDate);
			machine.setEndDate(endDate);
			machine.setEquipment_name(equipment_name);

			List<Machine> allList = machineService.getNonTimeDataList(machine);

			rtnMap.put("status", "success");
			rtnMap.put("data", allList);
			rtnMap.put("count", allList.size());


			//System.out.println("받은 equipment_name: " + equipment_name);
			//System.out.println("받은 startDate: " + startDate);
			//System.out.println("받은 endDate: " + endDate);
			//System.out.println("조회된 데이터 수: " + allList.size());


		} catch (Exception e) {
			e.printStackTrace();
			rtnMap.put("status", "error");
			rtnMap.put("message", e.getMessage());
		}

		return rtnMap;
	}

	//비가동현황
	@RequestMapping(value = "/machine/nonTime/view", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getnonTimeView(
			@RequestParam(required = false) String startDate,
			@RequestParam(required = false) String endDate,
			@RequestParam(required = false) String equipment_name) {

		Map<String, Object> rtnMap = new HashMap<>();
		try {
			Machine machine = new Machine();
			machine.setStartDate(startDate);
			machine.setEndDate(endDate);
			machine.setEquipment_name(equipment_name);

			List<Machine> allListView = machineService.getNonTimeDataView(machine);

			rtnMap.put("status", "success");
			rtnMap.put("data", allListView);
			rtnMap.put("count", allListView.size());


			//System.out.println("받qbqbqbqbq: " + equipment_name);

			//System.out.println("allListView조회된 데이터 수: " + allListView.size());


		} catch (Exception e) {
			e.printStackTrace();
			rtnMap.put("status", "error");
			rtnMap.put("message", e.getMessage());
		}

		return rtnMap;
	}


	// 비가동
	@RequestMapping(value = "/machine/nonTime/insert", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> saveNonTime(@ModelAttribute Machine machine) {
		Map<String, Object> rtnMap = new HashMap<>();

		try {
			// 서버에서 받아온 객체의 값을 출력
			//System.out.println("Received Machine object: " + machine);

			if (machine.getEquipment_name() == null || machine.getEquipment_name().trim().isEmpty()) {
				rtnMap.put("result", "fail");
				rtnMap.put("message", "설비명을 입력하시오!");
				return rtnMap;
			}

			// 실제 저장 로직 실행
			machineService.saveNonTime(machine);

			rtnMap.put("result", "success");
		} catch (Exception e) {
			rtnMap.put("result", "fail");
			rtnMap.put("message", "저장 중 오류가 발생했습니다: " + e.getMessage());
		}

		return rtnMap;
	}


	// 비가동
	@RequestMapping(value = "/machine/nonTime/update", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateNonTime(@ModelAttribute Machine machine) {
		Map<String, Object> rtnMap = new HashMap<>();


		System.out.println("=== Received Machine object (updateNonTime) ===");
		System.out.println("equipment_name: " + machine.getEquipment_name());
		System.out.println("info_list: " + machine.getInfo_list());
		System.out.println("start_time: " + machine.getStart_time());
		System.out.println("end_time: " + machine.getEnd_time());
		System.out.println("non_time_memo: " + machine.getNon_time_memo());
		System.out.println("non_time_idx: " + machine.getNon_time_idx());
		System.out.println("machine_code: " + machine.getMachine_code());
		System.out.println("===============================================");


		try {
			// 서버에서 받아온 객체의 값을 출력
			//System.out.println("Received Machine object updateNonTime: " + machine);

			if (machine.getEquipment_name() == null || machine.getEquipment_name().trim().isEmpty()) {
				rtnMap.put("result", "fail");
				rtnMap.put("message", "설비명을 입력하시오!");
				return rtnMap;
			}

			// 실제 저장 로직 실행
			machineService.updateNonTime(machine);

			rtnMap.put("result", "success");
		} catch (Exception e) {
			rtnMap.put("result", "fail");
			rtnMap.put("message", "저장 중 오류가 발생했습니다: " + e.getMessage());
		}

		return rtnMap;
	}



	// 비가동 삭제
	@RequestMapping(value = "/machine/nonTime/delete", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteNonTime(@RequestBody Map<String, String> requestData) {
		String non_time_idx = requestData.get("non_time_idx");
		System.out.println("받은 non_time_idx: " + non_time_idx);

		Map<String, Object> result = new HashMap<>();
		try {
			machineService.deleteNonTime(non_time_idx);
			result.put("result", "success");
		} catch (Exception e) {
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}






	//설비이력카드(돌발고장, 정기점검, 정기교체), 부품교체 이력관리, 스페어부품(안전보호구 포함)
	@RequestMapping(value= "/machine/repairStatus", method = RequestMethod.GET)
	public String repairStatus(Model model) {
		return "/machine/repairStatus.jsp"; // 
	}
	//설비이력카드(돌발고장, 정기점검, 정기교체), 부품교체 이력관리, 스페어부품(안전보호구 포함)
	@RequestMapping(value= "/machine/repairStatus_info", method = RequestMethod.GET)
	public String repairStatus_info(Model model) {
		return "/machine/repairStatus_info.jsp"; // 
	}

	// 설비이력카드
	@RequestMapping(value = "/machine/repairStatus/list", method = RequestMethod.POST)
	@ResponseBody
	public List<Machine> getRepairStatusList(@RequestBody Machine machine){


		return machineService.getRepairStatusList(machine);
	}


	@RequestMapping(value = "/machine/repairStatus/insert", method = RequestMethod.POST)
	@ResponseBody
	public String insertRepairStatus(@ModelAttribute Machine machine) {


		machineService.insertRepairStatus(machine); 

		return "success";
	}
	@RequestMapping(value = "/machine/repairStatus/delete", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delRepairStatus(@RequestBody Machine machine) {
		Map<String, Object> rtnMap = new HashMap<>();
		System.out.println("삭제 요청 받은 데이터: " + machine);

		if (machine.getId() == null) {
			rtnMap.put("data", "행 선택하세요");
			return rtnMap;
		}

		machineService.delRepairStatus(machine);

		rtnMap.put("data", "success");
		return rtnMap;
	}
	
	
	
	
	// 설비이력카드
	@RequestMapping(value = "/machine/repairStatus_info/list", method = RequestMethod.POST)
	@ResponseBody
	public List<Machine> getRepairStatusList_info(@RequestBody Machine machine){


		return machineService.getRepairStatusList_info(machine);
	}


	@RequestMapping(value = "/machine/repairStatus_info/delete", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delRepairStatus_info(@RequestBody Machine machine) {
		Map<String, Object> rtnMap = new HashMap<>();
		System.out.println("삭제 요청 받은 데이터: " + machine.getIdx());

		if (machine.getIdx() == null) {
			rtnMap.put("data", "행 선택하세요");
			return rtnMap;
		}

		machineService.delRepairStatus_info(machine);

		rtnMap.put("data", "success");
		return rtnMap;
	}
	

	@RequestMapping(value = "/machine/repairStatus_info/insert", method = RequestMethod.POST)
	@ResponseBody
	public String insertRepairStatus_info(@ModelAttribute Machine machine) {
		System.out.println("추가요청 받은 데이터: " + machine.getIdx());

		machineService.insertRepairStatus_info(machine); 

		return "success";
	}
	
	@RequestMapping(value = "/machine/repairStatus_info/update", method = RequestMethod.POST)
	@ResponseBody
	public String updateRepairStatus_info(@ModelAttribute Machine machine) {
	    if (machine.getIdx() == null) return "idx 없음";
	    machineService.updateRepairStatus_info(machine);
	    return "success";
	}

	
	
	

	//부품교체 이력
	@RequestMapping(value= "/machine/partStatus", method = RequestMethod.GET)
	public String partStatus(Model model) {
		return "/machine/partStatus.jsp"; 
	}

	//부품교체 이력
	@RequestMapping(value = "/machine/partStatus/list", method = RequestMethod.POST)
	@ResponseBody
	public List<Machine> getPartStatusList(Machine machine) {
		System.out.println(">>> 부품이력 mch_name: " + machine.getMch_name());
		System.out.println(">>> month: " + machine.getMonth());
		System.out.println(">>> 조조건: " + machine.getWhere_bt());
		return machineService.getPartStatusList(machine);
	}

	//부품교체 이력
	@RequestMapping(value = "/machine/partStatus/insert", method = RequestMethod.POST)
	@ResponseBody
	public String insertPartStatus(@ModelAttribute Machine machine) {


		machineService.insertPartStatus(machine); 

		return "success";
	}
	@RequestMapping(value = "/machine/partStatus/delete", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delPartStatus(@RequestBody Machine machine) {
		Map<String, Object> rtnMap = new HashMap<>();
		System.out.println("삭제 요청 받은 데이터: " + machine);

		if (machine.getNo() == null) {
			rtnMap.put("data", "행 선택하세요");
			return rtnMap;
		}

		machineService.delPartStatus(machine);

		rtnMap.put("data", "success");
		return rtnMap;
	}


	//스페어부품 관리대장

	@RequestMapping(value= "/machine/spareStatus", method = RequestMethod.GET)
	public String spareStatus(Model model) {
		return "/machine/spareStatus.jsp"; 
	}

	@RequestMapping(value = "/machine/spareStatus/list", method = RequestMethod.POST)
	@ResponseBody
	public List<Machine> getspareStatusList(Machine machine) {
		

		return machineService.getspareStatusList(machine);
	}

	@RequestMapping(value = "/machine/spareStatus/insert", method = RequestMethod.POST)
	@ResponseBody
	public String insertspareStatus(@ModelAttribute Machine machine) {


		machineService.insertspareStatus(machine); 

		return "success";
	}
	@RequestMapping(value = "/machine/spareStatus/delete", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delspareStatus(@RequestBody Machine machine) {
		Map<String, Object> rtnMap = new HashMap<>();
		System.out.println("삭제 요청 받은 데이터: " + machine);

		if (machine.getNo() == null) {
			rtnMap.put("data", "행 선택하세요");
			return rtnMap;
		}

		machineService.delspareStatus(machine);

		rtnMap.put("data", "success");
		return rtnMap;
	}


	//공무일지 관리

	@RequestMapping(value= "/machine/logStatus", method = RequestMethod.GET)
	public String logStatus(Model model) {
		return "/machine/logStatus.jsp"; 
	}

	@RequestMapping(value = "/machine/logStatus/list", method = RequestMethod.POST)
	@ResponseBody
	public List<Machine> getlogStatusList(Machine machine) {
		
		return machineService.getlogStatusList(machine);
	}

	@RequestMapping(value = "/machine/logStatus/insert", method = RequestMethod.POST)
	@ResponseBody
	public String insertlogStatus(@ModelAttribute Machine machine) {


		machineService.insertlogStatus(machine); 

		return "success";
	}
	@RequestMapping(value = "/machine/logStatus/delete", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> dellogStatus(@RequestBody Machine machine) {
		Map<String, Object> rtnMap = new HashMap<>();
		System.out.println("삭제 요청 받은 데이터: " + machine);

		if (machine.getNo() == null) {
			rtnMap.put("data", "행 선택하세요");
			return rtnMap;
		}

		machineService.dellogStatus(machine);

		rtnMap.put("data", "success");
		return rtnMap;
	}



	// 경보 모니터링 리스트 조회 (POST)

	@RequestMapping(value = "/machine/alarmMonitoring/list", method = RequestMethod.POST)
	@ResponseBody
	public List<Machine> getErrDataList(Machine machine) {
		String start = machine.getStart_time();
		String end = machine.getEnd_time();

		if (start != null && !start.contains(":")) {
			machine.setStart_time(start + " 00:00:00");
		}

		if (end != null && !end.contains(":")) {
			machine.setEnd_time(end + " 23:59:59");
		}

		System.out.println("start_time : " + machine.getStart_time());
		System.out.println("end_time   : " + machine.getEnd_time());
		System.out.println("mach_code  : " + machine.getMach_code());

		List<Machine> result = machineService.getErrDataList(machine);

		System.out.println("조회된 데이터 개수: " + (result != null ? result.size() : "null"));
		if (result != null && !result.isEmpty()) {
			System.out.println("첫번째 데이터: " + result.get(0).toString()); // toString() 오버라이딩 필요
		}

		return result;
	}


	@RequestMapping(value = "/machine/getErrAlarmRanking/list", method = RequestMethod.POST)
	@ResponseBody
	public List<Machine> getErrAlarmRanking(Machine machine) {
		String start = machine.getStart_time();
		String end = machine.getEnd_time();

		if (start != null && !start.contains(":")) {
			machine.setStart_time(start + " 00:00:00");
		}

		if (end != null && !end.contains(":")) {
			machine.setEnd_time(end + " 23:59:59");
		}

		System.out.println("start_time : " + machine.getStart_time());
		System.out.println("end_time   : " + machine.getEnd_time());
		System.out.println("mach_code  : " + machine.getMach_code());

		List<Machine> result = machineService.getErrAlarmRanking(machine);

		System.out.println("조회된 getErrAlarmRanking 개수: " + (result != null ? result.size() : "null"));
		if (result != null && !result.isEmpty()) {
			System.out.println("첫번째 데이터: " + result.get(0).toString()); // toString() 오버라이딩 필요
		}

		return result;
	}


	@RequestMapping(value= "/machine/mch_info", method = RequestMethod.GET)
	public String mch_info(Model model) {
		return "/machine/mch_info.jsp"; 
	}



	//설비 기준 정보
	@RequestMapping(value = "/machine/mch_info/list", method = RequestMethod.POST)
	@ResponseBody
	public List<Machine> getFacilityList(Machine machine) {  
		return machineService.getFacilityList(machine);
	}

	//설비 기준 정보
	@RequestMapping(value = "/machine/mch_info/insert", method = RequestMethod.POST)
	@ResponseBody
	public String insertFacility(@ModelAttribute Machine machine) {


		machineService.insertFacility(machine); 

		return "success";
	}
	@RequestMapping(value = "/machine/mch_info/delete", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteFacility(@RequestBody Machine machine) {
		Map<String, Object> rtnMap = new HashMap<>();
		System.out.println("삭제 요청 받은 데이터: " + machine);

		if (machine.getNo() == null) {
			rtnMap.put("data", "행 선택하세요");
			return rtnMap;
		}

		machineService.deleteFacility(machine);

		rtnMap.put("data", "success");
		return rtnMap;
	}

	//설비별 모니터링
	@RequestMapping(value = "/machine/detailMonitoring/list", method = RequestMethod.POST)
	@ResponseBody
	public List<Machine> detailMonitoringList(Machine machine) {
		List<Machine> result = machineService.getdetailMonitoring(machine);

		System.out.println("🔍 getdetailMonitoring result:");
		for (Machine m : result) {
			System.out.println("mach_code: " + m.getMach_code());
			System.out.println("target: " + m.getTarget());
			System.out.println("prodqty: " + m.getProdqty());
			System.out.println("rate: " + m.getRate());
			System.out.println("n_rate: " + m.getN_rate());
			System.out.println("c_rate: " + m.getC_rate());
			System.out.println("-------------");
		}

		return result;
	}

	// 통합모니터링 엑셀 다운로드
	@RequestMapping(value = "/machine/allMonitoring/excel", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> allMonitoringExcel(Machine machine) {
		System.out.println("통합모니터링 엑셀 다운로드 요청");
		//System.out.println("startDate = " + startDate);

		Map<String, Object> rtnMap = new HashMap<>();

		// 현재 시간 기반으로 파일명 생성
		SimpleDateFormat format = new SimpleDateFormat("'통합모니터링'_yyyyMMddHHmmss");
		Date time = new Date();
		String fileName = format.format(time) + ".xlsx";

		FileOutputStream fos = null;
		FileInputStream fis = null;

		String openPath = "D:/GEOMET양식/통합모니터링_양식/"; //엑셀 템플릿 파일 위치
		String savePath = "D:/GEOMET양식/통합모니터링/"; //엑셀 저장 위치

		//데이터 조회
		List<Machine> allList = machineService.getAllDataList(machine);

		if (allList == null || allList.isEmpty()) {
			System.out.println("allList = null");
			rtnMap.put("error", "데이터 없음");
			return rtnMap;
		}
		try {
			//엑셀 템플릿 불러오기, 첫 번째 시트를 기준으로 작업
			fis = new FileInputStream(openPath + "통합모니터링.xlsx");
			XSSFWorkbook workbook = new XSSFWorkbook(fis);

			//시트 
			XSSFSheet sheet = workbook.getSheetAt(0);

			/*
			 * //엑셀 스타일 정의(음수, 비가동 빨간색으로 입력) XSSFCellStyle redStyle =
			 * workbook.createCellStyle(); XSSFFont redFont = workbook.createFont();
			 * redFont.setColor(IndexedColors.RED.getIndex()); redStyle.setFont(redFont);
			 * 
			 * //설비상태 "가동"이면 초록색 XSSFCellStyle greenStyle = workbook.createCellStyle();
			 * XSSFFont greenFont = workbook.createFont();
			 * greenFont.setColor(IndexedColors.GREEN.getIndex());
			 * greenStyle.setFont(greenFont);
			 */

			//셀 생성, 기존 셀이 없으면 새로 만들기
			BiFunction<Row, Integer, Cell> getOrCreateCell = (r, c) -> {
				Cell cell = r.getCell(c);
				return (cell != null) ? cell : r.createCell(c);
			};

			// 날짜 오늘
			String today = new SimpleDateFormat("yyyy-MM-dd-HH-mm").format(new Date());

			XSSFRow dateRow1 = sheet.getRow(5);
			if (dateRow1 == null) dateRow1 = sheet.createRow(5);
			getOrCreateCell.apply(dateRow1, 13).setCellValue(today);
			getOrCreateCell.apply(dateRow1, 14).setCellValue(today);

			// 엑셀에 삽입할 필드
			String[] fields = {"facility_name", "d", "e", "f", "h", "i","j", "k", "l", "m", "n", "o","p", "q", "r", "s", "t", "u"};

			int startRow = 8; // 10행부터 시작
			int startCol = 0; // 첫 칼럼(A열)

			//데이터 삽입
			for (int i = 0; i < allList.size(); i++) {
				Machine item = allList.get(i);
				XSSFRow row = sheet.getRow(startRow + i);
				if (row == null) row = sheet.createRow(startRow + i);

				for (int j = 0; j < fields.length; j++) {

					//  셀 생성 유틸 적용 (이걸 써야 셀이 비어 있지 않음)
					XSSFCell cell = (XSSFCell) getOrCreateCell.apply(row, startCol + j);
					if (cell == null) cell = row.createCell(startCol + j);

					String value = "";
					try {
						//리플렉션으로 필드값 꺼내기
						Field field = Machine.class.getDeclaredField(fields[j]);
						field.setAccessible(true);
						Object fieldValue = field.get(item);
						value = (fieldValue != null) ? fieldValue.toString() : "";
					} catch (NoSuchFieldException | IllegalAccessException e) {
						value = "";
					}

					// 빈 문자열일 경우 "0"으로 대체
					if (value == null || value.trim().isEmpty()) {
						value = "0";
					}
					/*
					 * if (value.equals("비가동")) { XSSFCellStyle redMergedStyle =
					 * workbook.createCellStyle();
					 * redMergedStyle.cloneStyleFrom(cell.getCellStyle());
					 * redMergedStyle.setFont(redFont); cell.setCellStyle(redMergedStyle);
					 * cell.setCellValue(value); // 문자열 그대로 입력 continue; }else
					 * if(value.equals("가동")) { // 기존 셀 스타일 가져오기 XSSFCellStyle originalStyle =
					 * cell.getCellStyle();
					 * 
					 * // 새 스타일 생성 및 기존 스타일 복사 XSSFCellStyle greenMergedStyle =
					 * workbook.createCellStyle(); greenMergedStyle.cloneStyleFrom(originalStyle);
					 * // 테두리, 정렬 등 유지
					 * 
					 * // 초록색 글씨만 추가 greenMergedStyle.setFont(greenFont);
					 * 
					 * // 최종 스타일 적용 cell.setCellStyle(greenMergedStyle); continue; }
					 */

					/*
					 * try { double numValue = Double.parseDouble(value);
					 * 
					 * if (numValue < 0) { // 기존 셀 스타일 가져오기 XSSFCellStyle originalStyle =
					 * cell.getCellStyle();
					 * 
					 * // 새 스타일 생성 및 기존 스타일 복사 XSSFCellStyle redMergedStyle =
					 * workbook.createCellStyle(); redMergedStyle.cloneStyleFrom(originalStyle); //
					 * 테두리, 정렬 등 유지
					 * 
					 * // 빨간 글씨만 추가 redMergedStyle.setFont(redFont);
					 * 
					 * // 최종 스타일 적용 cell.setCellStyle(redMergedStyle);
					 * 
					 * // - 부호 제거 value = value.replace("-", ""); } } catch (NumberFormatException
					 * ignored) { // 숫자가 아니면 스타일 적용 안 함 }
					 */

					//셀에 값 입력(기존 스타일 유지됨)
					cell.setCellValue(value);
				}
			}

			//엑셀에 수식 있으면 다시 계산하도록 설정
			workbook.setForceFormulaRecalculation(true);

			// 파일 저장
			File outFile = new File(savePath + fileName);
			fos = new FileOutputStream(outFile);
			workbook.write(fos);
			workbook.close();
			fos.flush();

			// 클라이언트가 다운로드할 수 있도록 경로 반환
			rtnMap.put("filename", fileName);
			rtnMap.put("downloadPath",
					"/geomet/download_allMonitoring?filename=" + URLEncoder.encode(fileName, "UTF-8"));


		} catch (Exception e) {
			e.printStackTrace();
			rtnMap.put("error", "엑셀 파일 생성 중 오류 발생");
		} finally {
			try {
				if (fis != null) fis.close();
				if (fos != null) fos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return rtnMap;
	}

	// 엑셀 다운로드
	@RequestMapping(value = "/download_allMonitoring", method = RequestMethod.GET)
	public void downloadExcel123(@RequestParam("filename") String filename, HttpServletResponse response)
			throws IOException {

		// 파일이 저장될 경로
		String baseDir = "D:/GEOMET양식/통합모니터링/";

		// System.out.println("다운 주소 filename: " + filename);

		// 보안 체크
		if (filename.contains("..") || filename.contains("/") || filename.contains("\\")) {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}

		// 다운로드할 파일 객체 생성
		File file = new File(baseDir + filename);
		System.out.println("파일 전체 경로: " + file.getAbsolutePath());

		// 파일이 존재하지 않으면 에러 반환
		if (!file.exists()) {
			response.setStatus(HttpServletResponse.SC_NOT_FOUND);
			return;
		}

		// 파일 확장자 자동 추정
		String mimeType = Files.probeContentType(file.toPath());
		if (mimeType == null) {
			mimeType = "application/octet-stream";
		}
		response.setContentType(mimeType);
		response.setContentLengthLong(file.length());

		// 파일명 인코딩
		String encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");

		// 다운로드 되도록 브라우저에 알림
		response.setHeader("Content-Disposition", "attachment; filename*=UTF-8''" + encodedFilename);

		// 파일을 바이트 스트림으로 클라이언트에 전송
		try (FileInputStream fis = new FileInputStream(file); OutputStream os = response.getOutputStream()) {
			byte[] buffer = new byte[1024];
			int len;
			while ((len = fis.read(buffer)) != -1) {
				os.write(buffer, 0, len);
			}
			os.flush();
		}
	}
	@RequestMapping(value = "/machine/alarmList/excel", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> alarmListExcel(@RequestBody Machine machine) {
		System.out.println("경보발생빈도 엑셀 컨트롤러 도착");
		System.out.println("machine.getStart_time()"+machine.getStart_time());
		System.out.println("machine.getEnd_time()"+machine.getEnd_time());
		String start = machine.getStart_time();
		String end = machine.getEnd_time();

		Map<String, Object> rtnMap = new HashMap<>();

		// 날짜 및 파일명 생성
		SimpleDateFormat format = new SimpleDateFormat("'경보발생빈도'_yyyyMMddHHmmss");
		Date time = new Date();
		String fileName = format.format(time) + ".xlsx";

		FileOutputStream fos = null;
		FileInputStream fis = null;
		String openPath = "D:/GEOMET양식/";
		String savePath = "D:/GEOMET양식/경보발생빈도/";

		if (start != null && !start.contains(":")) {
			machine.setStart_time(start + " 00:00:00");
		}

		if (end != null && !end.contains(":")) {
			machine.setEnd_time(end + " 23:59:59");
		}

		System.out.println("start_time : " + machine.getStart_time());
		System.out.println("end_time   : " + machine.getEnd_time());
		System.out.println("mach_code  : " + machine.getMach_code());

		List<Machine> machineList = machineService.getErrAlarmRanking(machine);

		System.out.println("조회된 데이터 개수: " + (machineList != null ? machineList.size() : "null"));
		if (machineList != null && !machineList.isEmpty()) {
			System.out.println("첫번째 데이터: " + machineList.get(0).toString()); // toString() 오버라이딩 필요
		}
		if (machineList == null || machineList.isEmpty()) {
			rtnMap.put("error", "데이터 없음");
			return rtnMap;
		}

		try {
			fis = new FileInputStream(openPath + "경보발생빈도양식.xlsx");
			XSSFWorkbook workbook = new XSSFWorkbook(fis);
			XSSFSheet sheet = workbook.getSheetAt(0);

			XSSFCellStyle styleCenterBorder = workbook.createCellStyle();
			styleCenterBorder.setAlignment(HorizontalAlignment.CENTER);
			styleCenterBorder.setBorderTop(BorderStyle.THIN);
			styleCenterBorder.setBorderBottom(BorderStyle.THIN);
			styleCenterBorder.setBorderLeft(BorderStyle.THIN);
			styleCenterBorder.setBorderRight(BorderStyle.THIN);

			String[] fields = {
					"no", "facility_name", "err_code", "err_name", "alarm_count"};
			String facility_n = "";

			//시작, 끝 날짜와 설비명 넣기
			Machine firstItem = machineList.get(0);  // 첫 번째 데이터 기준
			if(machine.getMach_code().equals("ALL")) {
				facility_n = "전체";
			}else {
				facility_n = firstItem.getFacility_name(); // 실제 설비명
			}

			String startDate = machine.getStart_time();
			String endDate = machine.getEnd_time();

			// 시분초 제거 (예: "2025-07-28 00:00:00" → "2025-07-28")
			if (startDate != null && startDate.length() >= 10) {
				startDate = startDate.substring(0, 10);
			}
			if (endDate != null && endDate.length() >= 10) {
				endDate = endDate.substring(0, 10);
			}

			// G5 = 4행 6열 (인덱스 기준 0부터 시작)
			XSSFRow row5 = sheet.getRow(4);
			if (row5 == null) row5 = sheet.createRow(4);
			XSSFCell cellG5 = row5.getCell(3);
			if (cellG5 == null) cellG5 = row5.createCell(3);
			cellG5.setCellValue(startDate + " ~ " + endDate);

			// G6 = 5행 6열
			XSSFRow row6 = sheet.getRow(5);
			if (row6 == null) row6 = sheet.createRow(5);
			XSSFCell cellG6 = row6.getCell(3);
			if (cellG6 == null) cellG6 = row6.createCell(3);
			cellG6.setCellValue(facility_n);

			int startRow = 7; // 8
			int startCol = 0; // A

			for (int i = 0; i < machineList.size(); i++) {
				Machine item = machineList.get(i);
				XSSFRow row = sheet.createRow(startRow + i);

				for (int j = 0; j < fields.length; j++) {
					XSSFCell cell = row.createCell(startCol + j);
					String value = "";
					if ("no".equals(fields[j])) {
						value = String.valueOf(i + 1); // 행 번호 (1부터 시작)
					} else {
						try {
							Field field = Machine.class.getDeclaredField(fields[j]);
							field.setAccessible(true);
							Object fieldValue = field.get(item);
							value = (fieldValue != null) ? fieldValue.toString() : "";
						} catch (NoSuchFieldException | IllegalAccessException e) {
							value = "";
						}
					}

					cell.setCellValue(value);
					cell.setCellStyle(styleCenterBorder);
				}
			}

			workbook.setForceFormulaRecalculation(true);
			fos = new FileOutputStream(savePath + fileName);
			workbook.write(fos);
			workbook.close();
			fos.flush();

			// 클라이언트가 다운로드할 수 있도록 경로 반환
			rtnMap.put("filename", fileName);
			rtnMap.put("downloadPath",
					"/geomet/download_alarmList?filename=" + URLEncoder.encode(fileName, "UTF-8"));

		} catch (Exception e) {
			e.printStackTrace();
			rtnMap.put("error", "엑셀 파일 생성 중 오류 발생");
		} finally {
			try {
				if (fis != null) fis.close();
				if (fos != null) fos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return rtnMap;
	}

	//엑셀 다운로드
	@RequestMapping(value = "/download_alarmList", method = RequestMethod.GET)
	public void downloadExcelAlarmList(@RequestParam("filename") String filename,
			HttpServletResponse response) throws IOException {

		//파일이 저장될 경로
		String baseDir = "D:/GEOMET양식/경보발생빈도/";

		//System.out.println("다운 주소 filename: " + filename);

		//보안 체크
		if (filename.contains("..") || filename.contains("/") || filename.contains("\\")) {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}

		//다운로드할 파일 객체 생성
		File file = new File(baseDir + filename);
		System.out.println("파일 전체 경로: " + file.getAbsolutePath());

		//파일이 존재하지 않으면 에러 반환
		if (!file.exists()) {
			response.setStatus(HttpServletResponse.SC_NOT_FOUND);
			return;
		}

		//파일 확장자 자동 추정
		String mimeType = Files.probeContentType(file.toPath());
		if (mimeType == null) {
			mimeType = "application/octet-stream";
		}
		response.setContentType(mimeType);
		response.setContentLengthLong(file.length());

		//파일명 인코딩
		String encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");

		//다운로드 되도록 브라우저에 알림
		response.setHeader("Content-Disposition", "attachment; filename*=UTF-8''" + encodedFilename);

		//파일을 바이트 스트림으로 클라이언트에 전송
		try (FileInputStream fis = new FileInputStream(file);
				OutputStream os = response.getOutputStream()) {
			byte[] buffer = new byte[1024];
			int len;
			while ((len = fis.read(buffer)) != -1) {
				os.write(buffer, 0, len);
			}
			os.flush();
		}
	}
	@RequestMapping(value = "/machine/alarmMonitoring/excel", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> alarmMonitoringExcel(@RequestBody Machine machine) {
		System.out.println("경보모니터링 엑셀 컨트롤러 도착");
		System.out.println("machine.getStart_time()"+machine.getStart_time());
		System.out.println("machine.getEnd_time()"+machine.getEnd_time());
		String start = machine.getStart_time();
		String end = machine.getEnd_time();

		Map<String, Object> rtnMap = new HashMap<>();

		// 날짜 및 파일명 생성
		SimpleDateFormat format = new SimpleDateFormat("'경보모니터링'_yyyyMMddHHmmss");
		Date time = new Date();
		String fileName = format.format(time) + ".xlsx";

		FileOutputStream fos = null;
		FileInputStream fis = null;
		String openPath = "D:/GEOMET양식/";
		String savePath = "D:/GEOMET양식/경보모니터링/";

		if (start != null && !start.contains(":")) {
			machine.setStart_time(start + " 00:00:00");
		}

		if (end != null && !end.contains(":")) {
			machine.setEnd_time(end + " 23:59:59");
		}

		System.out.println("start_time : " + machine.getStart_time());
		System.out.println("end_time   : " + machine.getEnd_time());
		System.out.println("mach_code  : " + machine.getMach_code());

		List<Machine> machineList = machineService.getErrDataList(machine);

		System.out.println("조회된 데이터 개수: " + (machineList != null ? machineList.size() : "null"));
		if (machineList != null && !machineList.isEmpty()) {
			System.out.println("첫번째 데이터: " + machineList.get(0).toString()); // toString() 오버라이딩 필요
		}
		if (machineList == null || machineList.isEmpty()) {
			rtnMap.put("error", "데이터 없음");
			return rtnMap;
		}

		try {
			fis = new FileInputStream(openPath + "경보모니터링양식.xlsx");
			XSSFWorkbook workbook = new XSSFWorkbook(fis);
			XSSFSheet sheet = workbook.getSheetAt(0);

			XSSFCellStyle styleCenterBorder = workbook.createCellStyle();
			styleCenterBorder.setAlignment(HorizontalAlignment.CENTER);
			styleCenterBorder.setBorderTop(BorderStyle.THIN);
			styleCenterBorder.setBorderBottom(BorderStyle.THIN);
			styleCenterBorder.setBorderLeft(BorderStyle.THIN);
			styleCenterBorder.setBorderRight(BorderStyle.THIN);

			String[] fields = {
					"no", "mach_code", "facility_name", "line_cd", "err_code", "err_name",
					"start_time_formatted", "end_time_formatted", "remark"
			};
			String facility_n = "";
			//시작, 끝 날짜와 설비명 넣기
			Machine firstItem = machineList.get(0);  // 첫 번째 데이터 기준
			if(machine.getMach_code().equals("ALL")) {
				facility_n = "전체";
			}else {
				facility_n = firstItem.getFacility_name(); // 실제 설비명
			}

			String startDate = machine.getStart_time();
			String endDate = machine.getEnd_time();

			// 시분초 제거 (예: "2025-07-28 00:00:00" → "2025-07-28")
			if (startDate != null && startDate.length() >= 10) {
				startDate = startDate.substring(0, 10);
			}
			if (endDate != null && endDate.length() >= 10) {
				endDate = endDate.substring(0, 10);
			}

			// G5 = 4행 6열 (인덱스 기준 0부터 시작)
			XSSFRow row5 = sheet.getRow(4);
			if (row5 == null) row5 = sheet.createRow(4);
			XSSFCell cellG5 = row5.getCell(8);
			if (cellG5 == null) cellG5 = row5.createCell(8);
			cellG5.setCellValue(startDate + " ~ " + endDate);

			// G6 = 5행 6열
			XSSFRow row6 = sheet.getRow(5);
			if (row6 == null) row6 = sheet.createRow(5);
			XSSFCell cellG6 = row6.getCell(8);
			if (cellG6 == null) cellG6 = row6.createCell(8);
			cellG6.setCellValue(facility_n);

			int startRow = 7; // 8
			int startCol = 0; // A

			for (int i = 0; i < machineList.size(); i++) {
				Machine item = machineList.get(i);
				XSSFRow row = sheet.createRow(startRow + i);

				for (int j = 0; j < fields.length; j++) {
					XSSFCell cell = row.createCell(startCol + j);
					String value = "";
					if ("no".equals(fields[j])) {
						value = String.valueOf(i + 1); // 행 번호 (1부터 시작)
					} else {
						try {
							Field field = Machine.class.getDeclaredField(fields[j]);
							field.setAccessible(true);
							Object fieldValue = field.get(item);
							value = (fieldValue != null) ? fieldValue.toString() : "";
						} catch (NoSuchFieldException | IllegalAccessException e) {
							value = "";
						}
					}

					cell.setCellValue(value);
					cell.setCellStyle(styleCenterBorder);
				}
			}

			workbook.setForceFormulaRecalculation(true);
			fos = new FileOutputStream(savePath + fileName);
			workbook.write(fos);
			workbook.close();
			fos.flush();

			// 클라이언트가 다운로드할 수 있도록 경로 반환
			rtnMap.put("filename", fileName);
			rtnMap.put("downloadPath",
					"/geomet/download_alarmMonitoring?filename=" + URLEncoder.encode(fileName, "UTF-8"));

		} catch (Exception e) {
			e.printStackTrace();
			rtnMap.put("error", "엑셀 파일 생성 중 오류 발생");
		} finally {
			try {
				if (fis != null) fis.close();
				if (fos != null) fos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return rtnMap;
	}

	//엑셀 다운로드
	@RequestMapping(value = "/download_alarmMonitoring", method = RequestMethod.GET)
	public void downloadExcelAlarm(@RequestParam("filename") String filename,
			HttpServletResponse response) throws IOException {

		//파일이 저장될 경로
		String baseDir = "D:/GEOMET양식/경보모니터링/";

		//System.out.println("다운 주소 filename: " + filename);

		//보안 체크
		if (filename.contains("..") || filename.contains("/") || filename.contains("\\")) {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}

		//다운로드할 파일 객체 생성
		File file = new File(baseDir + filename);
		System.out.println("파일 전체 경로: " + file.getAbsolutePath());

		//파일이 존재하지 않으면 에러 반환
		if (!file.exists()) {
			response.setStatus(HttpServletResponse.SC_NOT_FOUND);
			return;
		}

		//파일 확장자 자동 추정
		String mimeType = Files.probeContentType(file.toPath());
		if (mimeType == null) {
			mimeType = "application/octet-stream";
		}
		response.setContentType(mimeType);
		response.setContentLengthLong(file.length());

		//파일명 인코딩
		String encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");

		//다운로드 되도록 브라우저에 알림
		response.setHeader("Content-Disposition", "attachment; filename*=UTF-8''" + encodedFilename);

		//파일을 바이트 스트림으로 클라이언트에 전송
		try (FileInputStream fis = new FileInputStream(file);
				OutputStream os = response.getOutputStream()) {
			byte[] buffer = new byte[1024];
			int len;
			while ((len = fis.read(buffer)) != -1) {
				os.write(buffer, 0, len);
			}
			os.flush();
		}
	}
	@RequestMapping(value = "/work/workReport/list1", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getList1(@ModelAttribute Machine machine) {
		//System.out.println("testTankList 컨트롤러 도착");
		//System.out.println("quality.getDate()" + quality.getDate());

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		String baseDateStr = machine.getStart_time();
		try {
			// 2. 날짜 형식을 정의합니다.
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

			// 3. String 형태의 날짜를 Date 객체로 변환합니다.
			Date baseDate = dateFormat.parse(baseDateStr);

			// 4. Calendar 객체를 사용해 날짜를 계산합니다.
			Calendar cal = Calendar.getInstance();
			cal.setTime(baseDate);

			// 5. 시작 날짜를 전날로 설정하고 시간을 08:00:00으로 맞춥니다.
			cal.add(Calendar.DATE, -1);
			cal.set(Calendar.HOUR_OF_DAY, 8);
			cal.set(Calendar.MINUTE, 0);
			cal.set(Calendar.SECOND, 0);
			Date startDate = cal.getTime();

			// 6. 종료 날짜를 오늘로 설정하고 시간을 07:59:00으로 맞춥니다.
			cal.setTime(baseDate); // 기준 날짜로 재설정
			cal.set(Calendar.HOUR_OF_DAY, 7);
			cal.set(Calendar.MINUTE, 59);
			cal.set(Calendar.SECOND, 0);
			Date endDate = cal.getTime();

			// 7. SimpleDateFormat을 사용하여 원하는 형식의 String으로 변환합니다.
			SimpleDateFormat fullDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
			String formattedStartDate = fullDateFormat.format(startDate);
			String formattedEndDate = fullDateFormat.format(endDate);

			// 8. Work 객체에 설정된 시작 및 종료 시간을 적용합니다.
			machine.setStart_time(formattedStartDate);
			machine.setEnd_time(formattedEndDate);

			// 디버깅을 위해 설정된 값 출력
			System.out.println("1번 설정된 시작 시간: " + machine.getStart_time());
			System.out.println("1번설정된 종료 시간: " + machine.getEnd_time());

			// 9. machineService를 호출하여 데이터를 가져옵니다.
			List<Work> data1 = machineService.workReport1(machine);
			System.out.println("data1.size() " + data1.size());

			rtnMap.put("data1", data1);

		} catch (Exception e) {
			e.printStackTrace();
			// 예외 처리 로직 추가 (예: 오류 메시지 반환)
		}
		return rtnMap;
	}


	@RequestMapping(value = "/work/workReport/list2", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getList2(@ModelAttribute Machine machine) {

		Map<String, Object> rtnMap = new HashMap<>();

		try {
			// 문자열로 들어온 start_time (ex: "2025-06-15")
			String startDateStr = machine.getStart_time();

			// LocalDate 변환
			LocalDate date = LocalDate.parse(startDateStr);

			// start_time = 하루 전날 08:00:00
			LocalDate startDate = date.minusDays(1);
			String finalStartTime = startDate.toString() + " 08:00:00";

			// end_time = 해당 날짜 07:59:00
			String finalEndTime = date.toString() + " 07:59:00";

			machine.setStart_time(finalStartTime);
			machine.setEnd_time(finalEndTime);

			//System.out.println("테이블2가공된 start_time = " + machine.getStart_time());
			//System.out.println("테이블2가공된 end_time   = " + machine.getEnd_time());

			// DB 조회
			List<Work> dataList = machineService.workReport2(machine);

			rtnMap.put("data3", dataList);

		} catch (Exception e) {
			e.printStackTrace();
			rtnMap.put("data3", Collections.emptyList());
		}

		return rtnMap;
	}





	@RequestMapping(value = "/work/workReport/list3", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getList3(@ModelAttribute Machine machine) {
		//System.out.println("testTankList 컨트롤러 도착");
		//System.out.println("quality.getDate()" + quality.getDate());

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		String baseDateStr = machine.getStart_time();
		try {
			// 2. 날짜 형식을 정의합니다.
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

			// 3. String 형태의 날짜를 Date 객체로 변환합니다.
			Date baseDate = dateFormat.parse(baseDateStr);

			// 4. Calendar 객체를 사용해 날짜를 계산합니다.
			Calendar cal = Calendar.getInstance();
			cal.setTime(baseDate);

			// 5. 시작 날짜를 전날로 설정하고 시간을 08:00:00으로 맞춥니다.
			cal.add(Calendar.DATE, -1);
			cal.set(Calendar.HOUR_OF_DAY, 8);
			cal.set(Calendar.MINUTE, 0);
			cal.set(Calendar.SECOND, 0);
			Date startDate = cal.getTime();

			// 6. 종료 날짜를 오늘로 설정하고 시간을 07:59:00으로 맞춥니다.
			cal.setTime(baseDate); // 기준 날짜로 재설정
			cal.set(Calendar.HOUR_OF_DAY, 7);
			cal.set(Calendar.MINUTE, 59);
			cal.set(Calendar.SECOND, 0);
			Date endDate = cal.getTime();

			// 7. SimpleDateFormat을 사용하여 원하는 형식의 String으로 변환합니다.
			SimpleDateFormat fullDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String formattedStartDate = fullDateFormat.format(startDate);
			String formattedEndDate = fullDateFormat.format(endDate);

			// 8. Work 객체에 설정된 시작 및 종료 시간을 적용합니다.
			machine.setStart_time(formattedStartDate);
			machine.setEnd_time(formattedEndDate);

			// 디버깅을 위해 설정된 값 출력
			//System.out.println("설정된 시작 시간: " + machine.getStart_time());
		//	System.out.println("설정된 종료 시간: " + machine.getEnd_time());

			// 9. machineService를 호출하여 데이터를 가져옵니다.
			List<Work> data3 = machineService.workReport3(machine);
			//System.out.println("getNonProductManageList.size() " + data3.size());

			rtnMap.put("data3", data3);

		} catch (Exception e) {
			e.printStackTrace();
			// 예외 처리 로직 추가 (예: 오류 메시지 반환)
		}
		return rtnMap;
	}
	
	@RequestMapping(value = "/work/workReport/list4", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getList4() {

	    Map<String, Object> rtnMap = new HashMap<>();

	    try {
	        // 전체 조회
	        List<Machine> data4 = machineService.workReport4();
	        System.out.println("data4 size: " + data4.size());
	        System.out.println("data4 content: " + data4);
	        rtnMap.put("data4", data4);

	    } catch (Exception e) {
	        e.printStackTrace();
	        rtnMap.put("data4", Collections.emptyList());
	    }

	    return rtnMap;
	}


	
	
	
	
	@RequestMapping(value = "/work/workReport/list2_nontime", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getList2_nonTime(@ModelAttribute Machine machine) {

	    Map<String, Object> rtnMap = new HashMap<>();

	    try {
	        // 받은 값 그대로 출력
	        System.out.println("list2_nontime 받은 start_time: " + machine.getStart_time());
	        System.out.println("list2_nontime 받은 end_time: " + machine.getEnd_time());

	        // end_time 하루 더하기
	        LocalDate endDate = LocalDate.parse(machine.getEnd_time());
	        LocalDate newEndDate = endDate.plusDays(1);
	        machine.setEnd_time(newEndDate.toString());

	        System.out.println("하루 더한 end_time: " + machine.getEnd_time());

	        // DB 조회
	        List<Work> dataList = machineService.workReport2_nonTime(machine);

	        // 조회된 행 갯수 출력
	        System.out.println("조회된 행 갯수: " + dataList.size());

	        rtnMap.put("data3", dataList);

	    } catch (Exception e) {
	        e.printStackTrace();
	        rtnMap.put("data3", Collections.emptyList());
	    }

	    return rtnMap;
	}


}
