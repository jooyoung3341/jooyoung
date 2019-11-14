package kr.co.project.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.project.service.UserService;

@RestController
public class UserJsonController {
	
	@Autowired
	private UserService userService;
	
	//id 중복 확인
	
	@RequestMapping(value="user/idcheck")
	public Map<String, Object> idCheck(HttpServletRequest request ){
		String id = userService.idCheck(request);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", id == null);
		System.out.println(map);
		return map;
	}
}
