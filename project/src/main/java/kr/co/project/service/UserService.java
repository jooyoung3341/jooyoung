package kr.co.project.service;

import javax.servlet.http.HttpServletRequest;

import kr.co.project.domain.User;

public interface UserService {

	//회원가입
	public void signup(HttpServletRequest request);
	
	//id 중복 확인
	public String idCheck(HttpServletRequest request);
	
	//로그인
	public User login(HttpServletRequest request);
}
