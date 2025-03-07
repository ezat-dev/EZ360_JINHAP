package com.jinhap.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jinhap.domain.Permission;
import com.jinhap.domain.Users;
import com.jinhap.service.ManagementService;

@Controller
public class ManagementController {
	
	 @Autowired
	 private ManagementService managementService;

	 @RequestMapping(value = "/management/login", method = RequestMethod.GET)
	    public String login(Users users) {
	        return "/management/login.jsp";
	       
	    }
	 
	 @RequestMapping(value = "/management/sideBar", method = RequestMethod.GET)
	    public String sideBar(Users users) {
	        return "/include/sideBar.jsp";
	       
	    }
	 
	 //거래처등록 화면 로드
	 @RequestMapping(value = "/management/cutumInsert", method = RequestMethod.GET)
	 public String custumInsert(Users users) {
		 
		 return "/management/cutumInsert.jsp";
	 }	 
	 
	 
	 //전체 거래처목록 조회
	 @RequestMapping(value = "/management/authority/cutumList", method = RequestMethod.POST) 
	 @ResponseBody 
	 public Map<String, Object> getCutumUserList() {
		 Map<String, Object> rtnMap = new HashMap<String, Object>();
		 /*		 
		 List<Corp> userList = managementService.getCorpList();
		 
		 List<HashMap<String, Object>> rtnList = new ArrayList<HashMap<String, Object>>();
		 for(int i=0; i<userList.size(); i++) {
			 HashMap<String, Object> rowMap = new HashMap<String, Object>();
			 rowMap.put("idx", (i+1));
			 rowMap.put("user_no", userList.get(i).getUser_no());
			 rowMap.put("user_buso", userList.get(i).getUser_buso());
			 rowMap.put("user_jick", userList.get(i).getUser_jick());
			 rowMap.put("user_name", userList.get(i).getUser_name());
			 rowMap.put("user_code", userList.get(i).getUser_code());
			 
			 rtnList.add(rowMap);
		 }

		 rtnMap.put("last_page",1);
		 rtnMap.put("data",rtnList);
*/		 
		 return rtnMap; 
	 }
	 
	 
	 //사원별 권한등록 화면 로드
	 @RequestMapping(value = "/management/authority", method = RequestMethod.GET)
	 public String authority(Users users) {
		 
		 return "/management/authority.jsp";	       
	 }
	 	 
	 //사원별 권한등록 사용자 선택
	 @RequestMapping(value = "/management/authority/userSelect", method = RequestMethod.POST)
	 @ResponseBody
	 public Map<String, Object> authorityUserSelect(
			 @RequestParam(required = false) int user_code){
		 Map<String, Object> rtnMap = new HashMap<String, Object>();
		 
		 Permission permission = new Permission();
		 permission.setUser_code(user_code);
		 
		 Permission selectPermission = managementService.authorityUserSelect(permission);
		 
		 rtnMap.put("data", selectPermission);

		 return rtnMap;
	 }
	 
	 //사원별 권한등록 사용자 선택 후 수정
	 @RequestMapping(value = "/management/authority/userSelectSave", method = RequestMethod.POST)
	 @ResponseBody
	 public Map<String, Object> authorityUserSelectSave(@ModelAttribute Permission permission){
		 Map<String, Object> rtnMap = new HashMap<String, Object>();
/*
		 System.out.println(permission.getUser_code());
		 System.out.println(permission.getA01());
		 System.out.println(permission.getB01());
*/
		 managementService.authorityUserSelectSave(permission);
		 
		 return rtnMap;
	 }	 

	 
	 @RequestMapping(value = "/management/userinsert", method = RequestMethod.GET)
	 public String userinsert(Users users) {
		 return "/management/userinsert.jsp";	       
	 }
	 
	 //전체 사용자목록 조회
	 @RequestMapping(value = "/management/authority/userList", method = RequestMethod.POST) 
	 @ResponseBody 
	 public Map<String, Object> getUserList() {
		 Map<String, Object> rtnMap = new HashMap<String, Object>();
		 
		 List<Users> userList = managementService.getUserList();
		 
		 List<HashMap<String, Object>> rtnList = new ArrayList<HashMap<String, Object>>();
		 for(int i=0; i<userList.size(); i++) {
			 HashMap<String, Object> rowMap = new HashMap<String, Object>();
			 rowMap.put("idx", (i+1));
			 rowMap.put("user_no", userList.get(i).getUser_no());
			 rowMap.put("user_buso", userList.get(i).getUser_buso());
			 rowMap.put("user_jick", userList.get(i).getUser_jick());
			 rowMap.put("user_name", userList.get(i).getUser_name());
			 rowMap.put("user_code", userList.get(i).getUser_code());
			 
			 rtnList.add(rowMap);
		 }
		 
		 rtnMap.put("last_page",1);
		 rtnMap.put("data",rtnList);
		 
		 return rtnMap; 
	 }
	 
	 
	 
	 @RequestMapping(value = "/management/authority/big_Page", method = RequestMethod.POST)
	 @ResponseBody
	 public List<Users> getBigPageList() {

		 return managementService.getBigPageList(); 
	 }
	 
	 @RequestMapping(value = "/management/authority/small_page", method = RequestMethod.POST)
	 @ResponseBody
	 public List<Users> getSmallPage(@RequestBody Map<String, String> requestData) {
	     String pageBig = requestData.get("page_big"); 
	     System.out.println("받은 page_big: " + pageBig);  

	    
	     return managementService.getSmallPageList(pageBig); 
	 }
	 
	
	 

}

