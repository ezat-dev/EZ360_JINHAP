package com.geomet.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.BiFunction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
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

import com.geomet.domain.Quality;
import com.geomet.domain.UserLog;
import com.geomet.domain.Users;
import com.geomet.service.ExcelServiceTestInfo;
import com.geomet.service.QualityService;
import com.geomet.service.UserService;

@Controller
public class QualityController {

	@Autowired
	private QualityService qualityService;
    @Autowired
    private ExcelServiceTestInfo excelServiceTestInfo; 
    @Autowired
    private UserService UserService;

	/*-----품질관리-----*/

	// 온도균일성 테스트
	@RequestMapping(value = "/quality/tusTest", method = RequestMethod.GET)
	public String tusTest(Model model) {
		return "/quality/tusTest.jsp"; //
	}

	// 온도균일성 테스트 - 조회
	@RequestMapping(value = "/quality/tustest/selectList", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> tusTestSelect() {
		Map<String, Object> rtnMap = new HashMap<String, Object>();

		rtnMap.put("last_page", 1);
		rtnMap.put("data", "");

		return rtnMap;
	}

	// 내식성 테스트 - SST, CCT, 부착량 시험, 내수 밀착성, 설비별 가열잔분, 탈지액 분석
	@RequestMapping(value = "/quality/resistTest", method = RequestMethod.GET)
	public String resistTest(Model model) {
		return "/quality/resistTest.jsp"; //
	}

	// 수입검사 - 쇼트볼, 신액입고분
	@RequestMapping(value = "/quality/inTest", method = RequestMethod.GET)
	public String inTest(Model model) {
		return "/quality/inTest.jsp"; //
	}

	// 욕액분석, 사용액 분석, 이코팅, 방청
	@RequestMapping(value = "/quality/liquidAnalyze", method = RequestMethod.GET)
	public String liquidAnalyze(Model model) {
		return "/quality/liquidAnalyze.jsp"; //
	}

	// 부적합품 관리
	@RequestMapping(value = "/quality/nonProductManage", method = RequestMethod.GET)
	public String nonProductManage(Model model) {
		return "/quality/nonProductManage.jsp"; //
	}

	// 부적합품 관리 리스트
	@RequestMapping(value = "/quality/nonProductManage/list", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> corrStatusList(@RequestParam String equipment_name, @RequestParam String startDate,
			@RequestParam String endDate) {
		/*
		 * System.out.println("Received request:");
		 * System.out.println("부적합equipment_name: " + equipment_name);
		 * System.out.println("부적합startDate: " + startDate);
		 * System.out.println("부적합endDate: " + endDate);
		 */

		Map<String, Object> rtnMap = new HashMap<>();
		try {

			Quality quality = new Quality();
			quality.setEquipment_name(equipment_name.isEmpty() ? null : equipment_name);
			quality.setStartDate(startDate.isEmpty() ? null : startDate);
			quality.setEndDate(endDate.isEmpty() ? null : endDate);

			List<Quality> getNonProductManageList = qualityService.getNonProductManageList(quality);

			// System.out.println("getqualityInfoList Size: " +
			// getNonProductManageList.size());
			rtnMap.put("status", "success");
			rtnMap.put("last_page", 1);
			rtnMap.put("data", getNonProductManageList);
		} catch (Exception e) {
			System.out.println("Error occurred: " + e.getMessage());
			rtnMap.put("status", "error");
			rtnMap.put("message", e.getMessage());
		}

		return rtnMap;
	}

	// 부적합품 관리
	@RequestMapping(value = "/quality/nonProductManage/insert", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> saveNonProductManage(@ModelAttribute Quality quality) {
		Map<String, Object> rtnMap = new HashMap<>();

		qualityService.saveNonProductManage(quality);

		rtnMap.put("result", "success");
		return rtnMap;
	}

	// 부적합품 관리
	@RequestMapping(value = "/quality/nonProductManage/del", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delNonProductManage(@RequestBody Quality quality) {
		Map<String, Object> rtnMap = new HashMap<>();

		if (quality.getNo() == null) {
			rtnMap.put("data", "행 선택하세요");
			return rtnMap;
		}

		qualityService.delNonProductManage(quality);

		rtnMap.put("data", "success");
		return rtnMap;
	}

	// 부적합품 관리 엑셀
	@RequestMapping(value = "/quality/nonProductManage/excel", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> nonProductManageExcel(@RequestParam(required = false) String equipment_name,
			@RequestParam(required = false) String startDate, @RequestParam(required = false) String endDate) {
		System.out.println("엑셀 다운로드 요청 params:");
		System.out.println("equipment_name = " + equipment_name);
		System.out.println("startDate = " + startDate);
		System.out.println("endDate = " + endDate);

		Map<String, Object> rtnMap = new HashMap<>();

		// 날짜 및 파일명 생성
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd'_GEOMET양식_'HHmmss");
		Date time = new Date();
		String fileName = format.format(time) + ".xlsx";

		FileOutputStream fos = null;
		FileInputStream fis = null;
		String openPath = "D:/GEOMET양식/";
		String savePath = "D:/GEOMET양식/부적합품 관리/";

		// 받은 파라미터로 Quality 조건 설정
		Quality quality = new Quality();
		quality.setEquipment_name(equipment_name);
		quality.setStartDate(startDate);
		quality.setEndDate(endDate);

		// 필터링된 데이터만 조회
		List<Quality> nonProductManageInfoList = qualityService.getNonProductManageList(quality);

		System.out.println("조회된 건수: " + (nonProductManageInfoList != null ? nonProductManageInfoList.size() : 0));

		if (nonProductManageInfoList == null || nonProductManageInfoList.isEmpty()) {
			rtnMap.put("error", "데이터 없음");
			return rtnMap;
		}

		try {
			fis = new FileInputStream(openPath + "04_05.품질관리_부적합품 관리_0401변경.xlsx");
			XSSFWorkbook workbook = new XSSFWorkbook(fis);
			XSSFSheet sheet = workbook.getSheetAt(0);

			XSSFCellStyle styleCenterBorder = workbook.createCellStyle();
			styleCenterBorder.setAlignment(HorizontalAlignment.CENTER);
			styleCenterBorder.setBorderTop(BorderStyle.THIN);
			styleCenterBorder.setBorderBottom(BorderStyle.THIN);
			styleCenterBorder.setBorderLeft(BorderStyle.THIN);
			styleCenterBorder.setBorderRight(BorderStyle.THIN);

			String[] fields = { "no", "defect_date", "defect_type", "equipment", "product_no", "product_name",
					"defect_lot", "worker", "action", "selection_method", "action_date", "defect_quantity", "cause",
					"improvement", "yn_a", "yn_b", "start_date" };

			int startRow = 5; // 엑셀 6행
			int startCol = 1; // B열

			for (int i = 0; i < nonProductManageInfoList.size(); i++) {
				Quality item = nonProductManageInfoList.get(i);
				XSSFRow row = sheet.createRow(startRow + i);

				for (int j = 0; j < fields.length; j++) {
					XSSFCell cell = row.createCell(startCol + j);
					String value = "";

					try {
						Field field = Quality.class.getDeclaredField(fields[j]);
						field.setAccessible(true);
						Object fieldValue = field.get(item);
						value = (fieldValue != null) ? fieldValue.toString() : "";
					} catch (NoSuchFieldException | IllegalAccessException e) {
						value = "";
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

			rtnMap.put("data", savePath + fileName);

		} catch (Exception e) {
			e.printStackTrace();
			rtnMap.put("error", "엑셀 파일 생성 중 오류 발생");
		} finally {
			try {
				if (fis != null)
					fis.close();
				if (fos != null)
					fos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return rtnMap;
	}

	@RequestMapping(value = "/quality/tusTest/list", method = RequestMethod.POST)
	@ResponseBody
	public List<Quality> getqualityList(Quality quality) {
		/*
		 * System.out.println(">>> test_mch_name: " + quality.getMch_name());
		 * System.out.println(">>> test_t_year: " + quality.getT_year());
		 */
		return qualityService.getqualityList(quality);
	}

	@RequestMapping(value = "/quality/tusTest/insert", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> savetusTest(@ModelAttribute Quality quality,
			@RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile) {
		Map<String, Object> rtnMap = new HashMap<>();

		if (quality.getT_month() != null && quality.getT_month().length() >= 4) {
			String year = quality.getT_month().substring(0, 4);
			quality.setT_year(year);
		}

		if (quality.getT_min() != null) {
			try {
				int tMin = Integer.parseInt(quality.getT_min().trim());
				quality.setT_result(tMin >= 10 ? "합격" : "불합격");
			} catch (NumberFormatException e) {
				quality.setT_result("불합격");
			}
		} else {
			quality.setT_result("불합격");
		}

		if (uploadFile != null && !uploadFile.isEmpty()) {
			try {
				String originalFilename = uploadFile.getOriginalFilename();
				String savePath = "D:/GEOMET양식/온도균일성/";

				File dir = new File(savePath);
				if (!dir.exists())
					dir.mkdirs();

				File dest = new File(savePath + originalFilename);
				uploadFile.transferTo(dest);

				quality.setT_url(originalFilename);

			} catch (IOException e) {
				e.printStackTrace();
				rtnMap.put("result", "fail");
				rtnMap.put("message", "파일 저장 실패");
				return rtnMap;
			}
		}

		qualityService.savetusTest(quality);

		System.out.println(">>> mch_name: " + quality.getMch_name());
		System.out.println(">>> id: " + quality.getId());
		System.out.println(">>> t_result: " + quality.getT_result());
		System.out.println(">>> test_t_year: " + quality.getT_year());
		System.out.println(">>> t_url: " + quality.getT_url());

		rtnMap.put("result", "success");
		return rtnMap;
	}

	@RequestMapping(value = "/quality/tusTest/del", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deltusTest(@RequestBody Quality quality) {
		Map<String, Object> rtnMap = new HashMap<>();

		if (quality.getId() == null) {
			rtnMap.put("data", "행 선택하세요");
			return rtnMap;
		}

		qualityService.deltusTest(quality);

		rtnMap.put("data", "success");
		return rtnMap;
	}

	@RequestMapping(value = "/download_tusTest", method = RequestMethod.GET)
	public void downloadExcel(@RequestParam("filename") String filename, HttpServletResponse response)
			throws IOException {

		String baseDir = "D:/GEOMET양식/온도균일성/";

		if (filename.contains("..") || filename.contains("/") || filename.contains("\\")) {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}

		File file = new File(baseDir + filename);

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

		response.setHeader("Content-Disposition", "attachment; filename*=UTF-8''" + encodedFilename);

		try (FileInputStream fis = new FileInputStream(file); OutputStream os = response.getOutputStream()) {
			byte[] buffer = new byte[1024];
			int len;
			while ((len = fis.read(buffer)) != -1) {
				os.write(buffer, 0, len);
			}
			os.flush();
		}
	}

	// 수입검사 조회
	@RequestMapping(value = "/quality/g1/list", method = RequestMethod.GET)
	@ResponseBody
	public List<Quality> getIncomingTestList(Quality quality) {
		System.out.println("getIncomingTestList 컨트롤러 도착");
		System.out.println("quality.getPage()" + quality.getPage());
		System.out.println("quality.getIn_day()" + quality.getIn_day());
		System.out.println(quality);

		// 날짜가 비어 있으면 오늘 날짜로 설정
		if (quality.getIn_day() == null || quality.getIn_day().trim().isEmpty()) {
			String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
			quality.setIn_day(today);
			System.out.println("in_day 기본값 설정: " + today);
		}

		return qualityService.getIncomingTestList(quality);
	}

	// 수입검사 추가, 수정, 파일 업로드
	@RequestMapping(value = "/quality/inTest/insert", method = RequestMethod.POST)
	@ResponseBody
	public boolean insertInTest(@RequestBody Quality quality,
			@RequestParam(value = "file_url", required = false) MultipartFile[] files, HttpSession session) {
		System.out.println("insertInTest 컨트롤러 도착");
		System.out.println("quality.getNo(): " + quality.getNo());

		//파일 수정할 때 삭제할 기존 파일 
		String oldFileName = null;
		Quality existing = qualityService.getIncomingTest(quality);
		if (existing != null) {
			oldFileName = existing.getFile_name();
		}

		//현재시간(파일명에 추가)
		String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date());
		System.out.println("timeStamp: " + timeStamp);

		Users user = (Users) session.getAttribute("loginUser");
		String userId = user.getUser_id();
		quality.setUpdate_id(userId);

		try {
			if (files != null) {
				String uploadDir = "D:/GEOMET양식/정기점검 파일";

				File directory = new File(uploadDir);
				if (!directory.exists()) {
					directory.mkdirs();
				}

				//  기존 파일 삭제
				if (oldFileName != null && !oldFileName.isEmpty()) {
					File oldFile = new File(uploadDir + "/" + oldFileName);
					if (oldFile.exists()) {
						boolean deleted = oldFile.delete();
						System.out.println("기존 파일 삭제 여부: " + deleted);
					}
				}

				//새 파일 업로드
				for (MultipartFile file : files) {
					if (!file.isEmpty()) {
						String originalFilename = file.getOriginalFilename();

						// 현재 시간(파일명에 추가할거)
						String timestamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date());

						// 확장자 분리
						String ext = "";
						int dotIndex = originalFilename.lastIndexOf('.');
						if (dotIndex > 0) {
							ext = originalFilename.substring(dotIndex); // ".pdf", ".xlsx" 등
							originalFilename = originalFilename.substring(0, dotIndex); // 확장자 제외한 이름
						}

						// 새 파일명 생성
						String savedFilename = originalFilename + "_" + timestamp + ext;

						// 파일 저장
						File destination = new File(uploadDir + "/" + savedFilename);
						file.transferTo(destination);

						//db 저장되도록 file_name 갱신
						quality.setFile_name(savedFilename);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

		if (quality.getNo() == null || quality.getNo().equals("")) {
			return qualityService.insertIncoming(quality);
		} else {
			return qualityService.updateIncoming(quality);
		}
	}
	
	//수입검사 업데이트
	@RequestMapping("/quality/inTest/update")
	@ResponseBody
	public boolean updateCell(@RequestBody Quality quality, HttpSession session) {
		System.out.println("업데이트 컨트롤러 도착");


	    Users user = (Users) session.getAttribute("loginUser");
	    if (user != null) {
	        quality.setUpdate_id(user.getUser_id());
	    }

	    return qualityService.updateIncoming(quality);
	}

	// 수입검사 삭제
	@RequestMapping(value = "/quality/inTest/delete", method = RequestMethod.POST)
	@ResponseBody
	public boolean deleteInTest(@RequestBody Quality quality, HttpSession session) {
		System.out.println("deleteInTest 컨트롤러 도착");
		System.out.println(quality);

		return qualityService.deleteIncoming(quality);
	}

	// 파일 다운로드
	@RequestMapping(value = "/downloadKK", method = RequestMethod.GET)
	public void downloadExcel1(@RequestParam("file_name") String filename, HttpServletResponse response)
			throws IOException {
		System.out.println("파일 다운 컨트롤러 도착");

		// 다운받을 파일 경로
		String baseDir = "D:/GEOMET양식/정기점검 파일/";

		// System.out.println("다운 주소 filename: " + filename);

		// 보안 체크
		if (filename.contains("..") || filename.contains("/") || filename.contains("\\")) {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}

		// 경로에 파일명 붙여서 파일 객체 생성
		File file = new File(baseDir + filename);
		// System.out.println("파일 전체 경로: " + file.getAbsolutePath());

		// 해당 파일 있는지 확인, 파일 존재하지 않으면 404 반환
		if (!file.exists()) {
			response.setStatus(HttpServletResponse.SC_NOT_FOUND);
			return;
		}

		// 파일 타입 자동 추정(못찾으면 일반 이진파일 타입 사용)
		String mimeType = Files.probeContentType(file.toPath());
		if (mimeType == null) {
			mimeType = "application/octet-stream";
		}

		// 응답 헤더에 콘텐츠 타입과 파일 크기를 설정
		response.setContentType(mimeType);
		response.setContentLengthLong(file.length());

		// 공백이나 한글 등 파일명 처리
		String encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");

		// attachment: 바로 다운로드
		// inline: 브라우저에서 바로 열림
		// response.setHeader("Content-Disposition", "attachment; filename*=UTF-8''" +
		// encodedFilename);

		response.setHeader("Content-Disposition", "inline; filename*=UTF-8''" + encodedFilename);

		// 파일을 스트림으로 읽어서 반환
		try (FileInputStream fis = new FileInputStream(file); OutputStream os = response.getOutputStream()) {
			byte[] buffer = new byte[1024];
			int len;
			while ((len = fis.read(buffer)) != -1) {
				os.write(buffer, 0, len);
			}
			os.flush();
		}
	}

	// 파일 하나씩 다운
	@RequestMapping(value = "/downloadFiles", method = RequestMethod.GET)
	public void downloadSingleFile(@RequestParam("filename") String filename, HttpServletResponse response)
			throws IOException {
		System.out.println("파일 여러게 다운 컨트롤러 도착");
		System.out.println("filename: " + filename);

		String baseDir = "D:/GEOMET양식/정기점검 파일/";

		// 보안 체크
		if (filename.contains("..") || filename.contains("/") || filename.contains("\\")) {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}

		// 경로에 파일명 붙여서 파일 객체 생성
		File file = new File(baseDir + filename);
		if (!file.exists()) {
			response.setStatus(HttpServletResponse.SC_NOT_FOUND);
			return;
		}

		// MIME 타입 설정
		String mimeType = Files.probeContentType(file.toPath());
		if (mimeType == null) {
			mimeType = "application/octet-stream";
		}

		response.setContentType(mimeType);
		response.setContentLengthLong(file.length());

		String encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
		response.setHeader("Content-Disposition", "attachment; filename*=UTF-8''" + encodedFilename);

		try (FileInputStream fis = new FileInputStream(file); OutputStream os = response.getOutputStream()) {
			byte[] buffer = new byte[1024];
			int len;
			while ((len = fis.read(buffer)) != -1) {
				os.write(buffer, 0, len);
			}
			os.flush();
		}
	}

	// 수입검사 엑셀 다운로드
	@RequestMapping(value = "/quality/inTest/excel", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> inTestExcel(@RequestBody Quality quality) {
		System.out.println("수입검사 엑셀 다운로드 요청");
		System.out.println("quality.getPage():" + quality.getPage());
		System.out.println("quality.getIn_day():" + quality.getIn_day());
		//System.out.println("startDate = " + startDate);

		Map<String, Object> rtnMap = new HashMap<>();
		
		String page = quality.getPage();

/*		// 현재 시간 기반으로 파일명 생성
		SimpleDateFormat format = new SimpleDateFormat(page + "_yyyyMMdd'_수입검사_'HHmmss");
		Date time = new Date();
		String fileName = format.format(time) + ".xlsx";*/
		
		//프론트에서 날짜 데이터 안받아오면 오늘 날짜로 설정
		if (quality.getIn_day() == null || quality.getIn_day().trim().isEmpty()) {
			String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
			quality.setIn_day(today);
			System.out.println("in_day 기본값 설정: " + today);
		}
		
		String fileName = page + "-" + quality.getIn_day() + ".xlsx";

		FileOutputStream fos = null;
		FileInputStream fis = null;

		String openPath = "D:/엑셀테스트/"; //엑셀 템플릿 파일 위치
		String savePath = "D:/엑셀테스트/수입검사/"; //엑셀 저장 위치

		// 받은 파라미터로 machine 조건 설정

		//        machine.setStartDate(startDate);
		//        Machine machine = new Machine();
		//데이터 조회

		
		List<Quality> allList = qualityService.getIncomingTestList(quality);
		if (allList == null || allList.isEmpty()) {
			System.out.println("allList = null");
			rtnMap.put("error", "데이터 없음");
			return rtnMap;
		}
		if(quality.getPage().equals("G1")) {
			try {
				//엑셀 템플릿 불러오기, 첫 번째 시트를 기준으로 작업
				fis = new FileInputStream(openPath + "G1.xlsx");
				XSSFWorkbook workbook = new XSSFWorkbook(fis);
				XSSFSheet sheet = workbook.getSheetAt(0);

				//엑셀 스타일 정의(음수는 빨간색으로 입력)
				XSSFCellStyle redStyle = workbook.createCellStyle();
				XSSFFont redFont = workbook.createFont();
				redFont.setColor(IndexedColors.RED.getIndex());
				redStyle.setFont(redFont);

				//셀 생성, 기존 셀이 없으면 새로 만들기
				BiFunction<Row, Integer, Cell> getOrCreateCell = (r, c) -> {
					Cell cell = r.getCell(c);
					return (cell != null) ? cell : r.createCell(c);
				};

				// 오늘 날짜를  Q5, R5에 쓰기
				String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
				XSSFRow dateRow = sheet.getRow(4);
				if (dateRow == null) dateRow = sheet.createRow(4);
				getOrCreateCell.apply(dateRow, 16).setCellValue(today);  // Q열
				getOrCreateCell.apply(dateRow, 17).setCellValue(today);  // R열

				// 엑셀에 삽입할 필드
				String[] fields = {"no", "in_day", "supplier", "medicine", "lot", "nv", "color", "sensuality1", "sensuality2", "confirm", "file_name", "writer", "confirmer"};

				int startRow = 7; // 8행부터 시작
				int startCol = 0; // 첫 칼럼(A열)

				//데이터 삽입
				for (int i = 0; i < allList.size(); i++) {
					Quality item = allList.get(i);
					XSSFRow row = sheet.getRow(startRow + i);
					if (row == null) row = sheet.createRow(startRow + i);

					for (int j = 0; j < fields.length; j++) {

						//  셀 생성 유틸 적용 (이걸 써야 셀이 비어 있지 않음)
						XSSFCell cell = (XSSFCell) getOrCreateCell.apply(row, startCol + j);
						if (cell == null) cell = row.createCell(startCol + j);

						String value = "";
						try {
							//리플렉션으로 필드값 꺼내기
							Field field = Quality.class.getDeclaredField(fields[j]);
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

						try {
							double numValue = Double.parseDouble(value);

							if (numValue < 0) {
								// 기존 셀 스타일 가져오기
								XSSFCellStyle originalStyle = cell.getCellStyle();

								// 새 스타일 생성 및 기존 스타일 복사
								XSSFCellStyle redMergedStyle = workbook.createCellStyle();
								redMergedStyle.cloneStyleFrom(originalStyle); // 테두리, 정렬 등 유지

								// 빨간 글씨만 추가
								redMergedStyle.setFont(redFont);

								// 최종 스타일 적용
								cell.setCellStyle(redMergedStyle);

								// - 부호 제거
								value = value.replace("-", "");
							}
						} catch (NumberFormatException ignored) {
							// 숫자가 아니면 스타일 적용 안 함
						}

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
						"/geomet/download_inTest?filename=" + URLEncoder.encode(fileName, "UTF-8"));


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
		}else if(quality.getPage().equals("G2")) {
			try {
				//엑셀 템플릿 불러오기, 첫 번째 시트를 기준으로 작업
				fis = new FileInputStream(openPath + "G2.xlsx");
				XSSFWorkbook workbook = new XSSFWorkbook(fis);
				XSSFSheet sheet = workbook.getSheetAt(0);

				//엑셀 스타일 정의(음수는 빨간색으로 입력)
				XSSFCellStyle redStyle = workbook.createCellStyle();
				XSSFFont redFont = workbook.createFont();
				redFont.setColor(IndexedColors.RED.getIndex());
				redStyle.setFont(redFont);

				//셀 생성, 기존 셀이 없으면 새로 만들기
				BiFunction<Row, Integer, Cell> getOrCreateCell = (r, c) -> {
					Cell cell = r.getCell(c);
					return (cell != null) ? cell : r.createCell(c);
				};

				// 오늘 날짜를  Q5, R5에 쓰기
				String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
				XSSFRow dateRow = sheet.getRow(4);
				if (dateRow == null) dateRow = sheet.createRow(4);
				getOrCreateCell.apply(dateRow, 16).setCellValue(today);  // Q열
				getOrCreateCell.apply(dateRow, 17).setCellValue(today);  // R열

				// 엑셀에 삽입할 필드
				String[] fields = {"no", "in_day", "supplier", "medicine", "lot", "ph", "specipic_gravity", "color", "sensuality1", "sensuality2", "confirm", "file_name", "writer", "confirmer"};

				int startRow = 7; // 8행부터 시작
				int startCol = 0; // 첫 칼럼(A열)

				//데이터 삽입
				for (int i = 0; i < allList.size(); i++) {
					Quality item = allList.get(i);
					XSSFRow row = sheet.getRow(startRow + i);
					if (row == null) row = sheet.createRow(startRow + i);

					for (int j = 0; j < fields.length; j++) {

						//  셀 생성 유틸 적용 (이걸 써야 셀이 비어 있지 않음)
						XSSFCell cell = (XSSFCell) getOrCreateCell.apply(row, startCol + j);
						if (cell == null) cell = row.createCell(startCol + j);

						String value = "";
						try {
							//리플렉션으로 필드값 꺼내기
							Field field = Quality.class.getDeclaredField(fields[j]);
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

						try {
							double numValue = Double.parseDouble(value);

							if (numValue < 0) {
								// 기존 셀 스타일 가져오기
								XSSFCellStyle originalStyle = cell.getCellStyle();

								// 새 스타일 생성 및 기존 스타일 복사
								XSSFCellStyle redMergedStyle = workbook.createCellStyle();
								redMergedStyle.cloneStyleFrom(originalStyle); // 테두리, 정렬 등 유지

								// 빨간 글씨만 추가
								redMergedStyle.setFont(redFont);

								// 최종 스타일 적용
								cell.setCellStyle(redMergedStyle);

								// - 부호 제거
								value = value.replace("-", "");
							}
						} catch (NumberFormatException ignored) {
							// 숫자가 아니면 스타일 적용 안 함
						}

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
						"/geomet/download_inTest?filename=" + URLEncoder.encode(fileName, "UTF-8"));


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

		}else if(quality.getPage().equals("ML(G)")) {
			try {
				//엑셀 템플릿 불러오기, 첫 번째 시트를 기준으로 작업
				fis = new FileInputStream(openPath + "ML(G).xlsx");
				XSSFWorkbook workbook = new XSSFWorkbook(fis);
				XSSFSheet sheet = workbook.getSheetAt(0);

				//엑셀 스타일 정의(음수는 빨간색으로 입력)
				XSSFCellStyle redStyle = workbook.createCellStyle();
				XSSFFont redFont = workbook.createFont();
				redFont.setColor(IndexedColors.RED.getIndex());
				redStyle.setFont(redFont);

				//셀 생성, 기존 셀이 없으면 새로 만들기
				BiFunction<Row, Integer, Cell> getOrCreateCell = (r, c) -> {
					Cell cell = r.getCell(c);
					return (cell != null) ? cell : r.createCell(c);
				};

				// 오늘 날짜를  Q5, R5에 쓰기
				String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
				XSSFRow dateRow = sheet.getRow(4);
				if (dateRow == null) dateRow = sheet.createRow(4);
				getOrCreateCell.apply(dateRow, 16).setCellValue(today);  // Q열
				getOrCreateCell.apply(dateRow, 17).setCellValue(today);  // R열

				// 엑셀에 삽입할 필드
				String[] fields = {"no", "in_day", "supplier", "medicine", "lot", "ph", "specipic_gravity", "visicosity", "color", "nv", "confirm", "file_name", "writer", "confirmer"};

				int startRow = 7; // 8행부터 시작
				int startCol = 0; // 첫 칼럼(A열)

				//데이터 삽입
				for (int i = 0; i < allList.size(); i++) {
					Quality item = allList.get(i);
					XSSFRow row = sheet.getRow(startRow + i);
					if (row == null) row = sheet.createRow(startRow + i);

					for (int j = 0; j < fields.length; j++) {

						//  셀 생성 유틸 적용 (이걸 써야 셀이 비어 있지 않음)
						XSSFCell cell = (XSSFCell) getOrCreateCell.apply(row, startCol + j);
						if (cell == null) cell = row.createCell(startCol + j);

						String value = "";
						try {
							//리플렉션으로 필드값 꺼내기
							Field field = Quality.class.getDeclaredField(fields[j]);
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

						try {
							double numValue = Double.parseDouble(value);

							if (numValue < 0) {
								// 기존 셀 스타일 가져오기
								XSSFCellStyle originalStyle = cell.getCellStyle();

								// 새 스타일 생성 및 기존 스타일 복사
								XSSFCellStyle redMergedStyle = workbook.createCellStyle();
								redMergedStyle.cloneStyleFrom(originalStyle); // 테두리, 정렬 등 유지

								// 빨간 글씨만 추가
								redMergedStyle.setFont(redFont);

								// 최종 스타일 적용
								cell.setCellStyle(redMergedStyle);

								// - 부호 제거
								value = value.replace("-", "");
							}
						} catch (NumberFormatException ignored) {
							// 숫자가 아니면 스타일 적용 안 함
						}

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
						"/geomet/download_inTest?filename=" + URLEncoder.encode(fileName, "UTF-8"));


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

		}
		else if(quality.getPage().equals("ML(H)")) {
			try {
				//엑셀 템플릿 불러오기, 첫 번째 시트를 기준으로 작업
				fis = new FileInputStream(openPath + "ML(H).xlsx");
				XSSFWorkbook workbook = new XSSFWorkbook(fis);
				XSSFSheet sheet = workbook.getSheetAt(0);

				//엑셀 스타일 정의(음수는 빨간색으로 입력)
				XSSFCellStyle redStyle = workbook.createCellStyle();
				XSSFFont redFont = workbook.createFont();
				redFont.setColor(IndexedColors.RED.getIndex());
				redStyle.setFont(redFont);

				//셀 생성, 기존 셀이 없으면 새로 만들기
				BiFunction<Row, Integer, Cell> getOrCreateCell = (r, c) -> {
					Cell cell = r.getCell(c);
					return (cell != null) ? cell : r.createCell(c);
				};

				// 오늘 날짜를  Q5, R5에 쓰기
				String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
				XSSFRow dateRow = sheet.getRow(4);
				if (dateRow == null) dateRow = sheet.createRow(4);
				getOrCreateCell.apply(dateRow, 16).setCellValue(today);  // Q열
				getOrCreateCell.apply(dateRow, 17).setCellValue(today);  // R열

				// 엑셀에 삽입할 필드
				String[] fields = {"no", "in_day", "supplier", "medicine", "lot", "ph", "specipic_gravity", "color", "nv", "sensuality2", "confirm", "writer", "confirmer"};

				int startRow = 7; // 8행부터 시작
				int startCol = 0; // 첫 칼럼(A열)

				//데이터 삽입
				for (int i = 0; i < allList.size(); i++) {
					Quality item = allList.get(i);
					XSSFRow row = sheet.getRow(startRow + i);
					if (row == null) row = sheet.createRow(startRow + i);

					for (int j = 0; j < fields.length; j++) {

						//  셀 생성 유틸 적용 (이걸 써야 셀이 비어 있지 않음)
						XSSFCell cell = (XSSFCell) getOrCreateCell.apply(row, startCol + j);
						if (cell == null) cell = row.createCell(startCol + j);

						String value = "";
						try {
							//리플렉션으로 필드값 꺼내기
							Field field = Quality.class.getDeclaredField(fields[j]);
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

						try {
							double numValue = Double.parseDouble(value);

							if (numValue < 0) {
								// 기존 셀 스타일 가져오기
								XSSFCellStyle originalStyle = cell.getCellStyle();

								// 새 스타일 생성 및 기존 스타일 복사
								XSSFCellStyle redMergedStyle = workbook.createCellStyle();
								redMergedStyle.cloneStyleFrom(originalStyle); // 테두리, 정렬 등 유지

								// 빨간 글씨만 추가
								redMergedStyle.setFont(redFont);

								// 최종 스타일 적용
								cell.setCellStyle(redMergedStyle);

								// - 부호 제거
								value = value.replace("-", "");
							}
						} catch (NumberFormatException ignored) {
							// 숫자가 아니면 스타일 적용 안 함
						}

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
						"/geomet/download_inTest?filename=" + URLEncoder.encode(fileName, "UTF-8"));


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

		}
		else if(quality.getPage().equals("PLUS")) {
			try {
				//엑셀 템플릿 불러오기, 첫 번째 시트를 기준으로 작업
				fis = new FileInputStream(openPath + "PLUS.xlsx");
				XSSFWorkbook workbook = new XSSFWorkbook(fis);
				XSSFSheet sheet = workbook.getSheetAt(0);

				//엑셀 스타일 정의(음수는 빨간색으로 입력)
				XSSFCellStyle redStyle = workbook.createCellStyle();
				XSSFFont redFont = workbook.createFont();
				redFont.setColor(IndexedColors.RED.getIndex());
				redStyle.setFont(redFont);

				//셀 생성, 기존 셀이 없으면 새로 만들기
				BiFunction<Row, Integer, Cell> getOrCreateCell = (r, c) -> {
					Cell cell = r.getCell(c);
					return (cell != null) ? cell : r.createCell(c);
				};

				// 오늘 날짜를  Q5, R5에 쓰기
				String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
				XSSFRow dateRow = sheet.getRow(4);
				if (dateRow == null) dateRow = sheet.createRow(4);
				getOrCreateCell.apply(dateRow, 16).setCellValue(today);  // Q열
				getOrCreateCell.apply(dateRow, 17).setCellValue(today);  // R열

				// 엑셀에 삽입할 필드
				String[] fields = {"no", "in_day", "supplier", "medicine", "lot", "ph", "specipic_gravity", "visicosity", "color", "nv", "confirm", "writer", "confirmer"};

				int startRow = 7; // 8행부터 시작
				int startCol = 0; // 첫 칼럼(A열)

				//데이터 삽입
				for (int i = 0; i < allList.size(); i++) {
					Quality item = allList.get(i);
					XSSFRow row = sheet.getRow(startRow + i);
					if (row == null) row = sheet.createRow(startRow + i);

					for (int j = 0; j < fields.length; j++) {

						//  셀 생성 유틸 적용 (이걸 써야 셀이 비어 있지 않음)
						XSSFCell cell = (XSSFCell) getOrCreateCell.apply(row, startCol + j);
						if (cell == null) cell = row.createCell(startCol + j);

						String value = "";
						try {
							//리플렉션으로 필드값 꺼내기
							Field field = Quality.class.getDeclaredField(fields[j]);
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

						try {
							double numValue = Double.parseDouble(value);

							if (numValue < 0) {
								// 기존 셀 스타일 가져오기
								XSSFCellStyle originalStyle = cell.getCellStyle();

								// 새 스타일 생성 및 기존 스타일 복사
								XSSFCellStyle redMergedStyle = workbook.createCellStyle();
								redMergedStyle.cloneStyleFrom(originalStyle); // 테두리, 정렬 등 유지

								// 빨간 글씨만 추가
								redMergedStyle.setFont(redFont);

								// 최종 스타일 적용
								cell.setCellStyle(redMergedStyle);

								// - 부호 제거
								value = value.replace("-", "");
							}
						} catch (NumberFormatException ignored) {
							// 숫자가 아니면 스타일 적용 안 함
						}

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
						"/geomet/download_inTest?filename=" + URLEncoder.encode(fileName, "UTF-8"));


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

		}
		else if(quality.getPage().equals("K-BLACK")) {
			try {
				//엑셀 템플릿 불러오기, 첫 번째 시트를 기준으로 작업
				fis = new FileInputStream(openPath + "K-BLACK.xlsx");
				XSSFWorkbook workbook = new XSSFWorkbook(fis);
				XSSFSheet sheet = workbook.getSheetAt(0);

				//엑셀 스타일 정의(음수는 빨간색으로 입력)
				XSSFCellStyle redStyle = workbook.createCellStyle();
				XSSFFont redFont = workbook.createFont();
				redFont.setColor(IndexedColors.RED.getIndex());
				redStyle.setFont(redFont);

				//셀 생성, 기존 셀이 없으면 새로 만들기
				BiFunction<Row, Integer, Cell> getOrCreateCell = (r, c) -> {
					Cell cell = r.getCell(c);
					return (cell != null) ? cell : r.createCell(c);
				};

				// 오늘 날짜를  Q5, R5에 쓰기
				String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
				XSSFRow dateRow = sheet.getRow(4);
				if (dateRow == null) dateRow = sheet.createRow(4);
				getOrCreateCell.apply(dateRow, 16).setCellValue(today);  // Q열
				getOrCreateCell.apply(dateRow, 17).setCellValue(today);  // R열

				// 엑셀에 삽입할 필드
				String[] fields = {"no", "in_day", "supplier", "medicine", "lot", "ph", "specipic_gravity", "visicosity", "color", "nv", "confirm", "writer", "confirmer"};

				int startRow = 7; // 8행부터 시작
				int startCol = 0; // 첫 칼럼(A열)

				//데이터 삽입
				for (int i = 0; i < allList.size(); i++) {
					Quality item = allList.get(i);
					XSSFRow row = sheet.getRow(startRow + i);
					if (row == null) row = sheet.createRow(startRow + i);

					for (int j = 0; j < fields.length; j++) {

						//  셀 생성 유틸 적용 (이걸 써야 셀이 비어 있지 않음)
						XSSFCell cell = (XSSFCell) getOrCreateCell.apply(row, startCol + j);
						if (cell == null) cell = row.createCell(startCol + j);

						String value = "";
						try {
							//리플렉션으로 필드값 꺼내기
							Field field = Quality.class.getDeclaredField(fields[j]);
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

						try {
							double numValue = Double.parseDouble(value);

							if (numValue < 0) {
								// 기존 셀 스타일 가져오기
								XSSFCellStyle originalStyle = cell.getCellStyle();

								// 새 스타일 생성 및 기존 스타일 복사
								XSSFCellStyle redMergedStyle = workbook.createCellStyle();
								redMergedStyle.cloneStyleFrom(originalStyle); // 테두리, 정렬 등 유지

								// 빨간 글씨만 추가
								redMergedStyle.setFont(redFont);

								// 최종 스타일 적용
								cell.setCellStyle(redMergedStyle);

								// - 부호 제거
								value = value.replace("-", "");
							}
						} catch (NumberFormatException ignored) {
							// 숫자가 아니면 스타일 적용 안 함
						}

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
						"/geomet/download_inTest?filename=" + URLEncoder.encode(fileName, "UTF-8"));


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

		}
		return rtnMap;
	}
	
    //엑셀 다운로드
    @RequestMapping(value = "/download_inTest", method = RequestMethod.GET)
    public void downloadExcel123(@RequestParam("filename") String filename,
          HttpServletResponse response) throws IOException {

       //파일이 저장될 경로
       String baseDir = "D:/엑셀테스트/수입검사/";

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

    
    // 양산품 표면적 기준정보 -----------------0725
    @RequestMapping(value= "/quality/test_info", method = RequestMethod.GET)
    public String test_info(Model model) {
        return "/quality/test_info.jsp"; // 
    }	
    //기준정보 리스트
    @RequestMapping(value = "/quality/test_info/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> workDetailList(
            @RequestParam String coating_nm,
            @RequestParam String group_id,
            @RequestParam String item_cd,
            @RequestParam String item_nm
    ) {
        Map<String, Object> rtnMap = new HashMap<>();

        String now = java.time.LocalDateTime.now().format(java.time.format.DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        System.out.println("기준정보 조회시간"+ now );
        System.out.println("=================================");

        try {
            Quality qualityInfo = new Quality();

            qualityInfo.setCoating_nm(coating_nm.isEmpty() ? null : coating_nm); 
            qualityInfo.setGroup_id(group_id.isEmpty() ? null : group_id); 
            qualityInfo.setItem_cd(item_cd.isEmpty() ? null : item_cd);        
            qualityInfo.setItem_nm(item_nm.isEmpty() ? null : item_nm); 

            List<Quality> test_infoList = qualityService.getTest_infoList(qualityInfo);

            rtnMap.put("status", "success");
            rtnMap.put("last_page", 1);
            rtnMap.put("data", test_infoList);
        } catch (Exception e) {
            System.out.println("Error occurred: " + e.getMessage());
            rtnMap.put("status", "error");
            rtnMap.put("message", e.getMessage());
        }

        return rtnMap;
    }

    
    //양산품 기준정보 추가
    @RequestMapping(value = "/quality/test_info/insert", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> saveDivisionWeight(@ModelAttribute Quality quality) {

        Map<String, Object> rtnMap = new HashMap<>();


        // USER_NAME을 USER_ID에 저장
        quality.setUser_id(UserController.USER_NAME);

        // 현재 시간 (yyyyMMddHHmm 포맷) → UPD_DT에 저장
        String nowTime = java.time.LocalDateTime.now().format(
            java.time.format.DateTimeFormatter.ofPattern("yyyyMMddHHmm")
        );
        quality.setUpd_dt(nowTime);

        // 유효성 검사
        if (quality.getItem_cd() == null || quality.getItem_cd().trim().isEmpty()) {
            rtnMap.put("success", false);
            rtnMap.put("message", "도금 품번을 입력하시오!");
            return rtnMap;
        }

        // 저장 수행
        qualityService.saveTest_infoList(quality);

        // 로그 설정 및 저장
        UserLog userLog = new UserLog();
        userLog.setUserCode(UserController.USER_CODE);
        userLog.setPageCode("d06");
        userLog.setWorkDesc("추가");
        userLog.setWorkUrl("/quality/test_info/insert");
        userLog.setFileName("없음");

        // 올바른 서비스 객체 사용
        UserService.insertUserLog(userLog); 

        // 로그 출력
        String now = java.time.LocalDateTime.now().format(
            java.time.format.DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")
        );
        System.out.println("========== [양상품 기준정보 추가 요청 시간: " + now + "] ==========");
        System.out.println("USER_CODE  : " + UserController.USER_CODE);
        System.out.println("USER_NAME  : " + UserController.USER_NAME);
        System.out.println("WorkDesc   : " + userLog.getWorkDesc());

        // 저장된 객체를 그대로 반환 (Tabulator에 추가하기 위해)
        rtnMap.put("success", true);
        // rtnMap.put("data", quality); // 필요 시 주석 해제

        return rtnMap;
    }



    
    @RequestMapping(value = "/quality/test_info/del", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> delTest_info(@RequestBody Quality quality) {
        Map<String, Object> rtnMap = new HashMap<>();

        if (quality.getItem_cd() == null) {
            rtnMap.put("data", "행 선택하세요");
            return rtnMap;
        }

        UserLog userLog = new UserLog();
        userLog.setUserCode(UserController.USER_CODE);
        userLog.setPageCode("c05");
        userLog.setWorkDesc("삭제");
        userLog.setWorkUrl("/quality/test_info/del");
        userLog.setFileName("없음"); 
        UserService.insertUserLog(userLog); 

        qualityService.delTest_infoList(quality);
        Quality standardInfo = new Quality();
        List<Quality> test_infoList = qualityService.getTest_infoList(standardInfo);

        rtnMap.put("status", "success");
        rtnMap.put("last_page", 1);
        rtnMap.put("data", test_infoList);
        rtnMap.put("data", "success");
        return rtnMap;
    }

    //기준정보 엑섹 저장
    @RequestMapping(value = "/quality/test_info/excel_out", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> divisionWeightExcel(HttpServletRequest request) {
        Map<String, Object> rtnMap = new HashMap<>();
        Quality qualityInfo = new Quality();


        UserLog userLog = new UserLog();
        userLog.setUserCode(UserController.USER_CODE);
        userLog.setPageCode("d06");
        userLog.setWorkDesc("엑셀저장");
        userLog.setWorkUrl("/quality/test_info/excel_out");
        userLog.setFileName("양산품_표면적_기준정보"); 
        UserService.insertUserLog(userLog); 
        
        
        
        String fileName = "양산품_표면적_기준정보.xlsx";

        
        
        FileOutputStream fos = null;
        FileInputStream fis = null;
        String openPath = "D:/GEOMET양식/";
        String savePath = "D:/GEOMET양식/양산품_표면적_기준정보/";

        List<Quality> test_infoList = qualityService.getTest_infoList(qualityInfo);

		/*
		 * // 받아온 데이터 개수 출력 //system.out.println("getquality Size: " +
		 * (quality != null ? quality.size() : 0));
		 */
        if (test_infoList == null || test_infoList.isEmpty()) {
            rtnMap.put("error", "데이터 없음");
            return rtnMap;
        }

        try {
            fis = new FileInputStream(openPath + "양산품_표면적_기준정보.xlsx");
            XSSFWorkbook workbook = new XSSFWorkbook(fis);
            XSSFSheet sheet = workbook.getSheetAt(0);

            XSSFCellStyle styleCenterBorder = workbook.createCellStyle();
            styleCenterBorder.setAlignment(HorizontalAlignment.CENTER);
            styleCenterBorder.setBorderTop(BorderStyle.THIN);
            styleCenterBorder.setBorderBottom(BorderStyle.THIN);
            styleCenterBorder.setBorderLeft(BorderStyle.THIN);
            styleCenterBorder.setBorderRight(BorderStyle.THIN);



            String[] fields = {
                "group_id",
                "item_cd",
                "item_nm",
                "coating_nm",
                "sample_f",
                "area_g",
                "total_area_h",

            };


            int startRow = 6;

            for (int i = 0; i < test_infoList.size(); i++) {
                Quality item = test_infoList.get(i);
                XSSFRow row = sheet.createRow(startRow + i);

                XSSFCell indexCell = row.createCell(0);
                indexCell.setCellValue(i + 1);
                indexCell.setCellStyle(styleCenterBorder);

                StringBuilder logOutput = new StringBuilder("Row " + (i + 1) + " | ");

                for (int j = 0; j < fields.length; j++) {
                    XSSFCell cell = row.createCell(j + 1);

                    String value = "";
                    try {
                        Field field = Quality.class.getDeclaredField(fields[j]);
                        field.setAccessible(true);
                        Object fieldValue = field.get(item);
                        value = (fieldValue != null) ? fieldValue.toString() : "";
                    } catch (NoSuchFieldException | IllegalAccessException e) {
                        value = "";
                    }

                    cell.setCellValue(value);
                    cell.setCellStyle(styleCenterBorder);

                    // 로그 출력용 문자열 추가
                    logOutput.append(fields[j]).append(": ").append(value).append(", ");
                }
                
                // 각 행별 데이터 출력
              //  //system.out.println(logOutput.toString());
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
    
    
    
    
    
    
    
    
    
    @RequestMapping(value = "/download_test_info", method = RequestMethod.GET)
    public void downloadExcel(HttpServletResponse response) throws IOException {
        // 고정된 파일명과 경로
        String baseDir = "D:/GEOMET양식/양산품_표면적_기준정보/";
        String fileName = "양산품_표면적_기준정보.xlsx";

        File file = new File(baseDir + fileName);

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

        String encodedFilename = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");

        response.setHeader("Content-Disposition", "attachment; filename*=UTF-8''" + encodedFilename);

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

    
    
    
	
	  // 기준정보 엑셀 인풋
	  
	  @RequestMapping(value = "/quality/test_info/excel_in", method =
	  RequestMethod.POST)
	  
	  @ResponseBody public Map<String, Object> importExcel(@RequestParam("file")
	  MultipartFile file) { Map<String, Object> rtnMap = new HashMap<>();
	  
	  if (file.isEmpty()) { rtnMap.put("success", false); rtnMap.put("error",
	  "파일이 비어 있습니다."); return rtnMap; }
	  
	  
	  UserLog userLog = new UserLog();
	  userLog.setUserCode(UserController.USER_CODE); userLog.setPageCode("d06");
	  userLog.setWorkDesc("엑셀 업로드");
	  userLog.setWorkUrl("/quality/test_info/excelFileInput");
	  userLog.setFileName("양산품_표면적_기준정보"); UserService.insertUserLog(userLog);
	  
	  try {
	        List<Quality> importedData = excelServiceTestInfo.parseExcelFile(file);

	        for (Quality quality : importedData) {
	            qualityService.saveTest_infoList(quality);
	        }

	        rtnMap.put("success", true);
	        rtnMap.put("message", "엑셀 데이터가 성공적으로 업로드되었습니다.");

	    } catch (IllegalArgumentException e) {
	        e.printStackTrace();
	        rtnMap.put("success", false);
	        rtnMap.put("error", e.getMessage());

	    } catch (Exception e) {
	        e.printStackTrace();
	        rtnMap.put("success", false);
	        rtnMap.put("error", "엑셀 파일 처리 중 오류가 발생했습니다.");
	    }

	    return rtnMap;
	}
	  
		// 약품투입기준자료 페이지 이동
		@RequestMapping(value = "/quality/medicineStandard", method = RequestMethod.GET)
		public String medicineStandard(Model model) {
			return "/quality/medicineStandard.jsp"; //
		}
		
	    //약품투입기준자료 리스트1
		@RequestMapping(value = "/quality/getMedicineListStandardList1", method = RequestMethod.POST)
	    @ResponseBody
	    public List<Quality> getFacilityList(Quality quality) { 
//			System.out.println("getMedicineListStandardList1 컨트롤러 도착");
			List<Quality> datas = qualityService.getMedicineList1(quality);
			for(Quality v: datas) {
				System.out.println(v);
			}
	        return datas;
	    }
		// 약품투입기준자료 리스트2
		@RequestMapping(value = "/quality/getMedicineListStandardList2", method = RequestMethod.POST)
	    @ResponseBody
	    public List<Quality> getFacilityList2(Quality quality) { 
//			System.out.println("getMedicineListStandardList2 컨트롤러 도착");
			List<Quality> datas = qualityService.getMedicineList2(quality);
			for(Quality v: datas) {
				System.out.println(v);
			}
	        return datas;
	    }
		
		//약품투입기준자료 업데이트
		@RequestMapping(value = "/quality/medicineStandard/update", method = RequestMethod.POST)
	    @ResponseBody
	    public boolean updateMedicineStandard(@RequestBody Quality quality) {
//			System.out.println("업데이트 컨트롤러 도착");
//			System.out.println("quality.getNum()" + quality.getNum());
			return qualityService.updateMedicineStandard(quality);
		}
	 
	    //테스트 관리대장 리스트
		@RequestMapping(value = "/quality/getTestManageList", method = RequestMethod.POST)
	    @ResponseBody
	    public List<Quality> getTestManageList(Quality quality) { 
			System.out.println("테스트 관리대장 리스트");
			List<Quality> datas = qualityService.getTestManageList(quality);
			for(Quality v: datas) {
//				System.out.println(v);
			}
	        return datas;
	    }
		
		// 테스트 관리대장 페이지 이동
		@RequestMapping(value = "/quality/testManage", method = RequestMethod.GET)
		public String testManage(Model model) {
			return "/quality/testManage.jsp"; 
		}
		
		//테스트 관리대장 업데이트
		@RequestMapping(value = "/quality/testManage/update", method = RequestMethod.POST)
	    @ResponseBody
	    public boolean updatetestManage(@RequestBody Quality quality) {
			/*
			 * System.out.println("업데이트 컨트롤러 도착"); System.out.println("quality.getNumber()"
			 * + quality.getNumber());
			 */
			return qualityService.updateTestManage(quality);
		}
		
		//테스트 관리대장 파일 업로드(그냥 업데이트와 데이터 전송 방식이 달라 나눔)
		@RequestMapping(value = "/quality/testManage/updateFile", method = RequestMethod.POST)
		@ResponseBody
		public boolean updatetestManageFile(@ModelAttribute Quality quality,
		                              @RequestParam(value = "file", required = false) MultipartFile file,
		                              @RequestParam("targetField") String targetField) {
			/*
			 * System.out.println("업데이트 컨트롤러 도착");
			 * System.out.println("quality.getNumber(): " + quality.getNumber());
			 * System.out.println("targetField: " + targetField);
			 */
		    
		    String originalFilename = null;
		    
		    // 파일 처리 로직 (저장 등)
		    if (file != null && !file.isEmpty()) {
				try {
					originalFilename = file.getOriginalFilename();
					String savePath = "D:/GEOMET양식/테스트 관리대장/";

					File dir = new File(savePath);
					if (!dir.exists())
						dir.mkdirs();

					File dest = new File(savePath + originalFilename);
					file.transferTo(dest);
					
				} catch (IOException e) {
					e.printStackTrace();
					return false;
				}
		    }
		    
		    if (originalFilename != null) {
		        switch (targetField) {
		            case "sst3":
		                quality.setSst3(originalFilename);
		                break;
		            case "cct3":
		                quality.setCct3(originalFilename);
		                break;
		            case "contact3":
		                quality.setContact3(originalFilename);
		                break;
		            case "gattach3":
		                quality.setGattach3(originalFilename);
		                break;
		            case "after_attach3":
		                quality.setAfter_attach3(originalFilename);
		                break;
		            case "heat3":
		                quality.setHeat3(originalFilename);
		                break;
		            case "clean3":
		                quality.setClean3(originalFilename);
		                break;
		            case "shot3":
		                quality.setShot3(originalFilename);
		                break;
		            default:
		                // 매칭되는 필드가 없을 경우의 처리
		                System.out.println("매칭되는 필드가 없습니다: " + targetField);
		                return false;
		        }
		    }
		    
		    return qualityService.updateTestManage(quality);
		}
		
	    @RequestMapping(value="/quality/openFile", method=RequestMethod.GET)
	    public void viewPdf(@RequestParam("filename") String filename,
	                        HttpServletResponse resp) throws Exception {

	        if (filename.contains("..") || filename.contains("/") || filename.contains("\\")) {
	            resp.sendError(HttpServletResponse.SC_BAD_REQUEST);
	            return;
	        }

	        Path base = Paths.get("D:/GEOMET양식/테스트 관리대장");
	        Path file = base.resolve(filename).normalize();
	        if (!Files.exists(file) || !Files.isRegularFile(file)) {
	            resp.sendError(HttpServletResponse.SC_NOT_FOUND);
	            return;
	        }

	        resp.setContentType("application/pdf");
	        // inline으로 브라우저 뷰어에서 열기
	        String encoded = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
	        resp.setHeader("Content-Disposition", "inline; filename*=UTF-8''" + encoded);
	        resp.setHeader("X-Content-Type-Options", "nosniff");

	        try (InputStream in = Files.newInputStream(file);
	             OutputStream out = resp.getOutputStream()) {
	            byte[] buf = new byte[8192];
	            int len;
	            while ((len = in.read(buf)) != -1) out.write(buf, 0, len);
	            out.flush();
	        }
	    }
	 
    
}
