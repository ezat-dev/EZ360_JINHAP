package com.geomet.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.geomet.domain.Condition;
import com.geomet.domain.Facility;
import com.geomet.domain.Permission;
import com.geomet.domain.UserMenu;
import com.geomet.domain.Users;
import com.geomet.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
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
		 
		 
		 //로그인한 대상의 page정보 세션저장
		 Permission loginPermission = userService.userLoginPermission(loginUser);
		 session.setAttribute("loginUser",loginUser);
		 session.setAttribute("loginUserPage",loginPermission);
		 
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
	 
	 //전체 사용자목록 조회
	 @RequestMapping(value = "/user/userInsert/select", method = RequestMethod.POST) 
	 @ResponseBody 
	 public Map<String, Object> userInsertSelect() {
		 Map<String, Object> rtnMap = new HashMap<String, Object>();
		 
		 List<Users> userList = userService.userInsertSelect();
		 
		 List<HashMap<String, Object>> rtnList = new ArrayList<HashMap<String, Object>>();
		 for(int i=0; i<userList.size(); i++) {
			 HashMap<String, Object> rowMap = new HashMap<String, Object>();
			 rowMap.put("idx", (i+1));
			 rowMap.put("user_id", userList.get(i).getUser_id());
			 rowMap.put("user_busu", userList.get(i).getUser_busu());
			 rowMap.put("user_level", userList.get(i).getUser_level());
			 rowMap.put("user_code", userList.get(i).getUser_code());
			 rowMap.put("user_jick", userList.get(i).getUser_jick());
			 rowMap.put("user_name", userList.get(i).getUser_name());
			 rtnList.add(rowMap);
		 }
		 
		 rtnMap.put("last_page",1);
		 rtnMap.put("data",rtnList);
		 
		 return rtnMap; 
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
			 @RequestParam(required = false) int user_code){
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
/*
		 System.out.println(permission.getUser_code());
		 System.out.println(permission.getA01());
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
	 
	 
	 

	 
	 
	//자격인증관리 및 교육계획 및 실적 포함 (안전환경, 실무, 설비)
    @RequestMapping(value= "/user/planManage", method = RequestMethod.GET)
    public String planManage(Model model) {
        return "/user/planManage.jsp"; // 
    }
	
	//작업자 근무현황 및 인수인계 포함
    @RequestMapping(value= "/user/workerManage", method = RequestMethod.GET)
    public String workerManage(Model model) {
        return "/user/workerManage.jsp"; // 
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

            System.out.println("equipment_name_select Size: " + equipment_name_select.size());

            rtnMap.put("status", "success");
            rtnMap.put("data", equipment_name_select);
        } catch (Exception e) {
            System.out.println("Error occurred: " + e.getMessage());
            rtnMap.put("status", "error");
            rtnMap.put("message", e.getMessage());
        }

        return rtnMap;
    }


}

