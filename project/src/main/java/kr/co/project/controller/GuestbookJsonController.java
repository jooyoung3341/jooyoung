package kr.co.project.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.project.service.GuestbookService;

@RestController
public class GuestbookJsonController {

	@Autowired
	private GuestbookService guestbookService;
	
	//방명록 쓰기
	@RequestMapping(value="guestbook/register", method=RequestMethod.POST)
	public Map<String, Object> register(HttpServletRequest request){
		boolean result = guestbookService.register(request);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", result);
		return map;
		
	}
}
