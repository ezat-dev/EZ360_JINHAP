package com.geomet.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.geomet.domain.Condition;
import com.geomet.domain.Facility;
import com.geomet.domain.Permission;
import com.geomet.domain.Quality;
import com.geomet.domain.UserMenu;
import com.geomet.domain.Users;
import com.geomet.domain.Work;
import com.geomet.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	public static int USER_CODE = 0;
	public static String USER_NAME = "";
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	
	/*-----인원 및 안전관리-----*/
	//사용자 로그인 관리
	 @RequestMapping(value = "/user/login/check", method = RequestMethod.POST) 
	 @ResponseBody 
	 public Map<String, Object> userLoginCheck(@ModelAttribute Users users, HttpSession session) {
		 Map<String, Object> rtnMap = new HashMap<String, Object>();
		 
		 if("".equals(users.getUser_id())){
			 rtnMap.put("data","ID를 입력해주십시오!");
			 
			 return rtnMap;
		 }
		 
		 if("".equals(users.getUser_pw())){
			 rtnMap.put("data","PW를 입력해주십시오!");
			 
			 return rtnMap;
		 }
		 
		 Users loginUser = userService.userLoginCheck(users);
		 
		 if(loginUser == null) {
			 rtnMap.put("data","등록되지 않은 사용자입니다.");
			 
			 return rtnMap;			 
		 }
		 
		 
		// 로그인한 대상의 page정보 세션저장
		 Permission loginPermission = userService.userLoginPermission(loginUser);

		 // 세션에 저장
		 session.setAttribute("loginUser", loginUser);
		 System.out.println("세션 저장: loginUser = " + loginUser);

		 session.setAttribute("loginUserPage", loginPermission);
		 System.out.println("user_code: " + loginUser.getUser_code());
		 System.out.println("user_id: " + loginUser.getUser_id());
		 System.out.println("user_name: " + loginUser.getUser_name());
		 System.out.println("user_level: " + loginUser.getUser_level());

		 UserController.USER_CODE = Integer.parseInt(loginUser.getUser_code());
		 UserController.USER_NAME = loginUser.getUser_name(); 
		 // 반환용 맵 구성
		 rtnMap.put("data", loginUser);
		 rtnMap.put("loginUserPage", loginPermission);

		 return rtnMap;

	 }	
	
	 //로그인한 사용자의 메뉴셋팅
	 @RequestMapping(value = "/user/login/menuSetting", method = RequestMethod.POST) 
	 @ResponseBody 
	 public Map<String, Object> userLoginMenuSetting(HttpSession session) {
		 Map<String, Object> rtnMap = new HashMap<String, Object>();
		 
		 Permission pageData = (Permission)session.getAttribute("loginUserPage");
		 
		 rtnMap.put("data",pageData);
		 
		 return rtnMap;
	 }
	 
	 


	 
	 
	 
	 //로그인한 사용자의 메뉴저장
	 @RequestMapping(value = "/user/login/menuSave", method = RequestMethod.POST) 
	 @ResponseBody 
	 public Map<String, Object> userLoginMenuSave(
			 @RequestParam int user_code,
			 @RequestParam String menu_url,
			 @RequestParam String menu_name) {
		 Map<String, Object> rtnMap = new HashMap<String, Object>();
		 
		 UserMenu userMenu = new UserMenu();
		 userMenu.setUser_code(user_code);
		 userMenu.setMenu_url(menu_url);
		 userMenu.setMenu_name(menu_name);
		 
		 userService.userLoginMenuSave(userMenu);
		 
		 rtnMap.put("data","OK");
		 
		 return rtnMap;
	 }
	 
	 //로그인한 사용자의 메뉴저장
	 @RequestMapping(value = "/user/login/menuList", method = RequestMethod.POST) 
	 @ResponseBody 
	 public Map<String, Object> userLoginMenuList(
			 @RequestParam int user_code) {
		 Map<String, Object> rtnMap = new HashMap<String, Object>();
		 
		 UserMenu userMenu = new UserMenu();
		 userMenu.setUser_code(user_code);
		 
		 List<UserMenu> userMenuList = userService.userLoginMenuList(userMenu);
		 
		 rtnMap.put("data",userMenuList);
		 
		 return rtnMap;
	 }
	 
	 
	 
	 
	 
	 //로그인한 사용자의 메뉴삭제
	 @RequestMapping(value = "/user/login/menuRemove", method = RequestMethod.POST) 
	 @ResponseBody 
	 public Map<String, Object> userLoginMenuRemove(
			 @RequestParam int user_code,
			 @RequestParam String menu_url) {
		 
		 
		 	System.out.println("▶ user_code: " + user_code);
		    System.out.println("▶ menu_url: " + menu_url);
		 
		 Map<String, Object> rtnMap = new HashMap<String, Object>();
		 
		 UserMenu userMenu = new UserMenu();
		 userMenu.setUser_code(user_code);
		 userMenu.setMenu_url(menu_url);
		 
		 userService.userLoginMenuRemove(userMenu);
		 
		 rtnMap.put("data","OK");
		 
		 return rtnMap;
	 }
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 //사용자 등록 조회 
	 @RequestMapping(value = "/user/userInsert", method = RequestMethod.GET)
	 public String userInsertList(Users users) {
		 return "/user/userInsert.jsp";	       
	 }
	 
	// 전체 사용자목록 조회
	 @RequestMapping(value = "/user/userInsert/select", method = RequestMethod.POST)
	 @ResponseBody
	 public List<Users> userInsertSelect(Users users) {
	     // System.out.println("======= [userInsertSelect 호출됨] =======");
	     // System.out.println("user_name: " + users.getUser_name());
	     // System.out.println("startDate: " + users.getStartDate());
	     // System.out.println("=======================================");

	     List<Users> result = userService.userInsertSelect(users);

	     // System.out.println("======= [반환 데이터 목록] =======");
	     // for (Users u : result) {
	     //     System.out.println(
	     //         "ID: " + u.getUser_id() +
	     //         ", 이름: " + u.getUser_name() +
	     //         ", 입사일: " + u.getSt_day() +
	     //         ", 부서: " + u.getUser_busu()
	     //     );
	     // }
	     // System.out.println("총 개수: " + result.size());
	     // System.out.println("===================================");

	     return result;
	 }

	 @RequestMapping(value = "/user/userInsert/delete", method = RequestMethod.POST)
	 @ResponseBody
	 public String deleteUser(@RequestBody Users user) {
	     System.out.println("======= [deleteUser 호출됨] =======");
	     System.out.println("삭제 대상 user_code: " + user.getUser_code());
	     System.out.println("===================================");

	     try {
	    	 if(userService.deleteUser(user)) {
	    		 return "success";
	    	 }
	         return "fail";
	     } catch (Exception e) {
	         e.printStackTrace();
	         return "fail";
	     }
	 }
	 
	 //사용자 등록 입력
	 @RequestMapping(value = "/user/userInsert/insert", method = RequestMethod.POST)
	 @ResponseBody
	 public Map<String, Object> userInsertInsert(@ModelAttribute Users users) {
		 Map<String, Object> rtnMap = new HashMap<>();

		 //아이디 입력했는지		 
		 if("".equals(users.getUser_id())){
			 rtnMap.put("data","아이디를 입력해주십시오!");
			 
			 return rtnMap;
		 }
		 		 
		 //비밀번호 입력했는지		 
		 if("".equals(users.getUser_pw())){
			 rtnMap.put("data","비밀번호를 입력해주십시오!");
			 
			 return rtnMap;
		 }
		 
		 //동일한 사용자가 있는지
		 Users duplicateUser = userService.userDuplicateCheck(users);
		 
		 if(duplicateUser != null) {
			 rtnMap.put("data","이미 등록된 아이디입니다.");
			 
			 return rtnMap;			 
		 }
		 
		 userService.userInsertInsert(users);
		 
		 
		 return rtnMap; 
	 }
	 
	 //권한부여
	 @RequestMapping(value = "/user/userPermission", method = RequestMethod.GET)
	 public String userPermission(Users users) {
		 return "/user/userPermission.jsp";	       
	 }
	 
	 //사원별 권한등록 사용자 선택
	 @RequestMapping(value = "/user/userPermission/userSelectPermission", method = RequestMethod.POST)
	 @ResponseBody
	 public Map<String, Object> userPermissionUserSelectPerm(
			 @RequestParam(required = false) String  user_code){
		 Map<String, Object> rtnMap = new HashMap<String, Object>();
		 
		 Users users = new Users();
		 users.setUser_code(user_code);
		 
		 Permission selectPermission = userService.userLoginPermission(users);
		 
		 rtnMap.put("data", selectPermission);

		 return rtnMap;
	 }	 
	 
	 //사용자별 권한등록 사용자 선택 후 수정
	 @RequestMapping(value = "/user/userPermission/update", method = RequestMethod.POST)
	 @ResponseBody
	 public Map<String, Object> userPermissionUpdate(@ModelAttribute Permission permission){
		 Map<String, Object> rtnMap = new HashMap<String, Object>();

		 System.out.println(permission.getUser_code());
		 /*		 System.out.println(permission.getA01());
		 System.out.println(permission.getB01());
*/
		 userService.userPermissionUpdate(permission);
		 
		 return rtnMap;
	 }
	 
	 
	 //전체 사용자목록 조회
	 @RequestMapping(value = "/user/userPermission/userSelect", method = RequestMethod.POST) 
	 @ResponseBody 
	 public Map<String, Object> userPermissionUserSelect() {
		 Map<String, Object> rtnMap = new HashMap<String, Object>();
		 
		 List<Users> userList = userService.userPermissionUserSelect();
		 
		 List<HashMap<String, Object>> rtnList = new ArrayList<HashMap<String, Object>>();
		 for(int i=0; i<userList.size(); i++) {
			 HashMap<String, Object> rowMap = new HashMap<String, Object>();
			 rowMap.put("idx", (i+1));
			 rowMap.put("user_id", userList.get(i).getUser_id());
			 rowMap.put("user_busu", userList.get(i).getUser_busu());
			 rowMap.put("user_code", userList.get(i).getUser_code());
			 rowMap.put("user_jick", userList.get(i).getUser_jick());
			 rowMap.put("user_name", userList.get(i).getUser_name());
			 rtnList.add(rowMap);
		 }
		 
		 rtnMap.put("last_page",1);
		 rtnMap.put("data",rtnList);
		 
		 return rtnMap; 
	 }
	 
	 
	 @RequestMapping(value = "/user/info", method = RequestMethod.POST)
	 @ResponseBody
	 public Map<String, Object> getUserInfo(HttpSession session) {
	     Map<String, Object> result = new HashMap<>();
	     
	     // 세션에서 데이터 가져오기
	     Users loginUser = (Users) session.getAttribute("loginUser");
	     Permission loginPermission = (Permission) session.getAttribute("loginUserPage");

	 
	     if (loginUser != null) {
	         result.put("loginUser", loginUser);
	     }
	     if (loginPermission != null) {
	         result.put("loginUserPage", loginPermission);
	     }
	     
	     return result;
	 }


	 
	 
	//자격인증관리 및 교육계획 및 실적 포함 (안전환경, 실무, 설비)
    @RequestMapping(value= "/user/planManage", method = RequestMethod.GET)
    public String planManage(Model model) {
        return "/user/planManage.jsp"; // 
    }
    
    
    
    @RequestMapping(value = "/user/planManage/list", method = RequestMethod.POST)
    @ResponseBody
    public List<Users> getplanManageList(Users users) {

        return userService.getplanManageList(users);
    }

	
    @RequestMapping(value = "/user/planManage/insert", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> insertplanManage(
            @ModelAttribute Users users,
            @RequestParam(value = "file_url", required = false) MultipartFile[] files) {

        Map<String, Object> rtnMap = new HashMap<>();

        try {
  
            userService.insertplanManage(users);

       
            if (files != null) {
                String uploadDir = "D:/GEOMET양식/자격인증관리";

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
    
    
    
    @RequestMapping(value = "/user/planManage/delete", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> delplanManage(@RequestBody Users users) {
        Map<String, Object> rtnMap = new HashMap<>();
        System.out.println("삭제 요청 받은 데이터: " + users);

        if (users.getNo() == null) {
            rtnMap.put("data", "행 선택하세요");
            return rtnMap;
        }

        userService.delplanManage(users);

        rtnMap.put("data", "success");
        return rtnMap;
    }
    
    
    
    
    
    
    
    
    
	
	//작업자 근무현황 및 인수인계 포함
    @RequestMapping(value= "/user/workerManage", method = RequestMethod.GET)
    public String workerManage(Model model) {
        return "/user/workerManage.jsp"; // 
    }	
	//작업자 근무현황 및 인수인계 포함
    @RequestMapping(value= "/user/workerManage2", method = RequestMethod.GET)
    public String workerManage2(Model model) {
        return "/user/workerManage2.jsp"; // 
    }	
	
	//지게차, 청소차 점검일지
    @RequestMapping(value= "/user/carManage", method = RequestMethod.GET)
    public String carManage(Model model) {
        return "/user/carManage.jsp"; // 
    }
	
	//유해화학물질 취급시설 점검일지 및 순회 점검
    @RequestMapping(value= "/user/checkManage", method = RequestMethod.GET)
    public String checkManage(Model model) {
        return "/user/checkManage.jsp"; // 
    }	
	
	/*-----문서관리-----*/
	
	//관리계획서, 작업표준서, 설비점검일지, MSDS
    @RequestMapping(value= "/user/standardDocManage", method = RequestMethod.GET)
    public String standardDocManage(Model model) {
        return "/user/standardDocManage.jsp"; // 
    }	
	
	//사양별 대기통수 (각 공정별) 및 긴급품(로직 후공정 생산계획) 현황
    @RequestMapping(value= "/user/productDocManage", method = RequestMethod.GET)
    public String productDocManage(Model model) {
        return "/user/productDocManage.jsp"; // 
    }	
	
	//점검일정 준수 체크 시트
    @RequestMapping(value= "/user/checkDocManage", method = RequestMethod.GET)
    public String checkDocManage(Model model) {
        return "/user/checkDocManage.jsp"; // 
    }	
    
	
    
    
    @RequestMapping(value = "/user/equipment_name_select", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> equipment_name_select() {
        Map<String, Object> rtnMap = new HashMap<>();
        try {
            Facility facility = new Facility(); 

            List<Facility> equipment_name_select = userService.equipment_name_select(facility);

			/*
			 * System.out.println("equipment_name_select Size: " +
			 * equipment_name_select.size());
			 */

            rtnMap.put("status", "success");
            rtnMap.put("data", equipment_name_select);
        } catch (Exception e) {
            System.out.println("Error occurred: " + e.getMessage());
            rtnMap.put("status", "error");
            rtnMap.put("message", e.getMessage());
        }

        return rtnMap;
    }

    @RequestMapping(value = "/user/workerManage/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getworkDailyReportList(@RequestBody Users users) {
        System.out.println("받은 s_time 값: " + users.getS_time());

        Map<String, Object> result = new HashMap<>();
        List<?> table1 = userService.getWork_team_select(users);
        List<?> table2 = userService.getWork_schedule_select(users);

     //   System.out.println("table1 리턴값: " + table1);
     //   System.out.println("table2 리턴값: " + table2);

        result.put("table1", table1);
        result.put("table2", table2);
        return result;
    }

    @RequestMapping(value = "/user/workerManage/insert", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> work_handover_update(
        @RequestParam("id") Integer id,
        @RequestParam("column") String column,
        @RequestParam("value") String value) {

        Map<String, Object> rtnMap = new HashMap<>();

        System.out.println("== work_handover_update 요청값 ==");
        System.out.println("id: " + id);
        System.out.println("column: " + column);
        System.out.println("value: " + value);
        System.out.println("==============================");

        if (id == null) {
            rtnMap.put("error", "ID 입력 필요");
            return rtnMap;
        }

      
        Users users = new Users();
        users.setId(id);
        users.setColumn(column);  
        users.setValue(value);   

      
        userService.work_team_update(users);

        rtnMap.put("result", "success");
        return rtnMap;
    }
    @RequestMapping(
    	    value = "/user/workerManage/insertSchedule", 
    	    method = RequestMethod.POST,
    	    consumes = "application/json" 
    	)
    	@ResponseBody
    	public Map<String, Object> work_schedule_update(@RequestBody Users users) {
    	    Map<String, Object> rtn = new HashMap<>();

    	    System.out.println("=== updateWorkSchedule 요청값 ===");
    	    System.out.println("id: "         + users.getId());
    	    System.out.println("date: "       + users.getDate());
    	    System.out.println("shift_type: "+ users.getShift_type());
    	
    	    System.out.println("==============================");

    	    if (users.getId() == null) {
    	        rtn.put("error", "ID 필요");
    	        return rtn;
    	    }

    	
    	    userService.work_schedule_update(users);

    	    rtn.put("result", "success");
    	    return rtn;
    	}

    
    
    
    
    
    @RequestMapping(
    	    value = "/user/work_handover/insert", 
    	    method = RequestMethod.POST,
    	    consumes = "application/json" 
    	)
    	@ResponseBody
    	public Map<String, Object> work_handover_update(@RequestBody Users users) {
    	    Map<String, Object> rtn = new HashMap<>();

    	    System.out.println("=== 인수인계 요청값 ===");
    	    System.out.println("id: "         + users.getId());
    	   
    	
    	    System.out.println("==============================");

    	    if (users.getId() == null) {
    	        rtn.put("error", "ID 필요");
    	        return rtn;
    	    }

    	
    	    userService.work_handover_update(users);

    	    rtn.put("result", "success");
    	    return rtn;
    	}

    @RequestMapping(value = "/user/work_handover/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> work_handover_select(@RequestBody Users users) {
        System.out.println("받은 s_time 값: " + users.getS_time());

        Map<String, Object> result = new HashMap<>();
      
        List<?> table2 = userService.work_handover_select(users);

 
     //   System.out.println("table2 리턴값: " + table2);

        result.put("table2", table2);
        return result;
    }

    
    @RequestMapping(value = "/user/getCleanCar/List", method = RequestMethod.POST)
    @ResponseBody
    public List<Users> getCleanCar(Users users) {

        return userService.getCleanCar(users);
    }
    @RequestMapping(value = "/user/getForkCar/List", method = RequestMethod.POST)
    @ResponseBody
    public List<Users> getForkCar(Users users) {
        return userService.getForkCar(users);
    }
    
    @RequestMapping(value = "/user/getForkCar/insert", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> insertForkCar(@ModelAttribute Users users) {
        
        Map<String, Object> rtnMap = new HashMap<String, Object>();
        
        if(users.getCar_date() == null) {
        	rtnMap.put("data", "날짜 입력하시오!");
        	return rtnMap;
        }

        userService.insertForkCar(users); 
        
        return rtnMap;
    }
    @RequestMapping(value = "/user/getCleanCar/insert", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> insertCleanCar(@ModelAttribute Users users) {
        
        Map<String, Object> rtnMap = new HashMap<String, Object>();
        
        if(users.getCar_date() == null) {
        	rtnMap.put("data", "날짜 입력하시오!");
        	return rtnMap;
        }

        userService.insertCleanCar(users); 
        
        return rtnMap;
    }
    
    
    //
    @RequestMapping(value = "/user/standardDoc/list", method = RequestMethod.POST)
    @ResponseBody
    public List<Users>standardDocList(Users users) {
        /*
         * System.out.println(">>> test_mch_name: " + users.getMch_name());
         * System.out.println(">>> test_t_year: " + users.getT_year());
         */
        return userService.standardDocList(users);
    }

    @RequestMapping(value = "/user/standardDoc/insert", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> standardDocSaves(
        @RequestParam(value = "idx", required = false) String idx,
        @RequestParam("cr_date") String cr_date,
        @RequestParam("mch_name") String mch_name,
        @RequestParam(value = "memo", required = false) String memo,
        @RequestParam(value = "box1", required = false) MultipartFile box1,
        @RequestParam(value = "box2", required = false) MultipartFile box2,
        @RequestParam(value = "box3", required = false) MultipartFile box3,
        @RequestParam(value = "box4", required = false) MultipartFile box4
    ) {
        Map<String, Object> rtnMap = new HashMap<>();
        String basePath = "D:/GEOMET양식/문서관리/";

        try {
            Users users = new Users();
            users.setIdx(idx);
            users.setCr_date(cr_date);
            users.setMch_name(mch_name);
            users.setMemo(memo);

            if (box1 != null && !box1.isEmpty()) {
                String origName = box1.getOriginalFilename();
                box1.transferTo(new File(basePath + origName));
                users.setBox1(origName);
            }
            if (box2 != null && !box2.isEmpty()) {
                String origName = box2.getOriginalFilename();
                box2.transferTo(new File(basePath + origName));
                users.setBox2(origName);
            }
            if (box3 != null && !box3.isEmpty()) {
                String origName = box3.getOriginalFilename();
                box3.transferTo(new File(basePath + origName));
                users.setBox3(origName);
            }
            if (box4 != null && !box4.isEmpty()) {
                String origName = box4.getOriginalFilename();
                box4.transferTo(new File(basePath + origName));
                users.setBox4(origName);
            }

            userService.standardDocSaves(users);

            rtnMap.put("result", "success");
        } catch (Exception e) {
            e.printStackTrace();
            rtnMap.put("result", "fail");
            rtnMap.put("message", "DB 저장 실패: " + e.getMessage());
        }
        return rtnMap;
    }
    @RequestMapping(value = "/user/standardDoc/del", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> standardDocDel(@RequestBody Users users) {
        Map<String, Object> rtnMap = new HashMap<>();

        if (users.getIdx() == null) {
            rtnMap.put("data", "행 선택하세요");
            return rtnMap;
        }

        userService.standardDocDel(users);

        rtnMap.put("data", "success"); 
        return rtnMap;
    }

    @RequestMapping(value = "/download_standardDoc", method = RequestMethod.GET)
    public void downloadExcel(@RequestParam("filename") String filename,
                              HttpServletResponse response) throws IOException {

        String baseDir = "D:/GEOMET양식/문서관리/";

       
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
    
    
    
    
    
    
    
    
    @RequestMapping(value = "/user/CheckManage/List", method = RequestMethod.POST)
    @ResponseBody
    public List<Users> getCheckManageList(Users users) {
        return userService.getCheckManageList(users);
    }
    
    @RequestMapping(value = "/user/CheckManage/insert", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateCheckManage(@ModelAttribute Users users) {
        
        Map<String, Object> rtnMap = new HashMap<String, Object>();
        
        if(users.getCk_date() == null) {
        	rtnMap.put("ck_data", "날짜 입력하시오!");
        	return rtnMap;
        }

        userService.updateCheckManage(users); 
        
        return rtnMap;
    }
    
    //전체없음
    @RequestMapping(value = "/user/userPermission/allNo", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> allNo(@RequestBody Users users) {
        Map<String, Object> rtnMap = new HashMap<>();
        System.out.println("전체없음 요청 받은 user_code: " + users.getUser_code());

        boolean result = userService.allNo(users);
        System.out.println("result" + result);

        rtnMap.put("data", result);
        return rtnMap;
    }
    
    //권한 초기화
    @RequestMapping(value = "/user/userPermission/allNull", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> allNull(@RequestBody Users users) {
        Map<String, Object> rtnMap = new HashMap<>();
        System.out.println("전체없음 요청 받은 user_code: " + users.getUser_code());

        boolean result = userService.allNull(users);
        System.out.println("result" + result);

        rtnMap.put("data", result);
        return rtnMap;
    }
    
	 //사용자 정보수정
	 @RequestMapping(value = "/user/userInsert/update", method = RequestMethod.POST)
	 @ResponseBody
	 public Map<String, Object> userUpdate(@ModelAttribute Users users) {
		 Map<String, Object> rtnMap = new HashMap<>();
		 System.out.println("수정 users.getUser_name(): "+users.getUser_name());
 
		 userService.userInsertInsert(users);
		 
		 return rtnMap; 
	 }
    
	 //자격인증관리 자격인증평가표 다운로드
		@RequestMapping(value = "/download_file", method = RequestMethod.GET)
		public void downloadFile(@RequestParam("filename") String filename, HttpServletResponse response)
				throws IOException {
			System.out.println("자격인증관리 컨트롤러 도착");

			String baseDir = "D:/GEOMET양식/자격인증관리/";

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
}

