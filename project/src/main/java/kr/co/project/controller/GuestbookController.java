package kr.co.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.project.domain.Project;
import kr.co.project.service.GuestbookService;

@Controller
public class GuestbookController {

	@Autowired
	private GuestbookService guestbookService;
	
	//방명록 목록
	@RequestMapping(value="guestbook/guestbook", method=RequestMethod.GET)
	public String guestbooklist(Model model, HttpServletRequest request) {
		return "guestbook/guestbook";
	}


}