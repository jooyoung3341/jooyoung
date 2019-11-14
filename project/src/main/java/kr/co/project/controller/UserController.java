package kr.co.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.project.domain.User;
import kr.co.project.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	//회원가입 폼 이동
	@RequestMapping(value="user/signup", method=RequestMethod.GET)
	public String signup() {
		return "user/signup";
	}
	
	//회원가입
	@RequestMapping(value="user/signup", method=RequestMethod.POST)
	public String signup(HttpServletRequest request, RedirectAttributes attr) {
		userService.signup(request);
		attr.addFlashAttribute("signupmsg", "회원가입이 완료되었습니다.");
		return "redirect:/";
	}
	
	//로그인 폼 이동
	@RequestMapping(value="user/login", method=RequestMethod.GET)
	public String login() {
		return "user/login";
	}
	
	//로그인
	@RequestMapping(value="user/login", method=RequestMethod.POST)
	public String login(HttpServletRequest request, RedirectAttributes attr, HttpSession session) {
		User user = userService.login(request);
		
		if(user == null) {
			attr.addFlashAttribute("loginmsg", "아이디 비밀번호 확인바랍니다.");
			return "redirect:/user/login";
		}else
			session.setAttribute("user", user);
			return "redirect:/";
	}
	
	//로그아웃
	@RequestMapping(value="user/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
