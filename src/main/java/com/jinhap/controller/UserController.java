package com.jinhap.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jinhap.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	
	/*-----인원 및 안전관리-----*/
	
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
}

