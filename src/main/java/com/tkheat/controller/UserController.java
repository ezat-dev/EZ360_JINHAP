package com.tkheat.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tkheat.domain.Users;
import com.tkheat.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	/*사용자 로그인*/
	@RequestMapping(value="/user/login", method=RequestMethod.POST)
	@ResponseBody
	public String login(@ModelAttribute Users users, HttpServletRequest request, HttpServletResponse response) {
		//로그인을 클릭한 사용자의 아이디와 비밀번호가 같을 때
		Users loginUser = userService.getLoginUser(users);
		
		String result = "";
		/*
		System.out.println(users);
		System.out.println(users.getUser_id());
		System.out.println(users.getUser_pw());
		
		  if(loginUser == null) { result = "fail"; return result; }else { //사용자가 로그인 했을
		  때 Users menuCount = userService.userMenuSelectCount(users);
		  
		  if(menuCount == null) { //선택한 메뉴가 없는 사용자 result =
		  "/tkheat/user/userMenuNoSelect"; }else { //선택한 메뉴가 있는 사용자 result =
		  "/tkheat/user/usersMenuOkSelect"; } }
		 */

		request.getSession().setAttribute("user", loginUser);

		return result;
	}	
	
	//로그아웃
	@RequestMapping(value="/user/logout", method=RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		Users users = (Users)session.getAttribute("user");
		if(users != null) {
			session.removeAttribute("user");
			session.invalidate();
		}
		return "redirect:/";
	}	
	
	/*메뉴를 클릭했을때 각 사용자가 선택한 메뉴 저장*/
	@RequestMapping(value="/user/userMenuClick", method=RequestMethod.POST)
	@ResponseBody
	public String userMenuClick(HttpServletRequest request, HttpServletResponse response, 
			HttpSession session, @RequestParam String menu, @RequestParam String link) {
		String result = "N";
		Users users = (Users)session.getAttribute("user");
		StringBuffer desc = new StringBuffer();
		
//		users.setMenu_name(menu);
//		users.setMenu_url(link);
		
		if(users != null) {
			userService.userMenuClick(users);
			
			result = "Y";
		}
		
		desc.append("userMenuClick = 아이디:"+users.getUser_id()+"// 이름:"+users.getUser_name()+"// 메뉴명:"+menu+"// URL:"+link);
		logger.info("사용자 탭추가- {}",desc.toString());
		
		return result;
	}
	
	/*메뉴를 선택한적이 없는 사용자를 이동시키는 메서드*/
	@RequestMapping(value="/user/userMenuNoSelect", method = RequestMethod.GET)
	public String userMenuNoSelect(Model model) {
		
		model.addAttribute("user", new Users());
		
		return "/include/noMenuUser.jsp";
	}
	
	/*메뉴를 선택한적이 있는 사용자를 이동시키는 메서드*/
	@RequestMapping(value="/user/usersMenuOkSelect", method = RequestMethod.GET)
	public String usersMenuOkSelect(Model model, HttpSession session) {
		Users users = (Users)session.getAttribute("user");
		
		model.addAttribute("user", new Users());
		/*사용자가 이미 선택한 메뉴가 있다면 side메뉴바가 보이지 않도록*/
		Users menuCount = userService.userMenuSelectCount(users);

		
		
		session.setAttribute("menuCount", menuCount);
		
		List<Users> userMenu = userService.menuList(users);
		
		model.addAttribute("tabList",userMenu);
		return "/include/sidebar.jsp";
	}
	
	
	
	/*메뉴 닫기버튼을 클릭했을 때 해당 메뉴가 삭제가 되도록*/
	@RequestMapping(value="/user/userMenuDelete", method=RequestMethod.POST)
	@ResponseBody
	public String userMenuDelete(HttpServletRequest request, HttpServletResponse response, 
			HttpSession session, @RequestParam String name) {
		String result = "N";
		Users users = (Users)session.getAttribute("user");
//		users.setMenu_name(name);
		
		if(users != null) {
			userService.userMenuDelete(users);
			
			result = "Y";
		}
		
		return result;
	}
}

