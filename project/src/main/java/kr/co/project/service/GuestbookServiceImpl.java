package kr.co.project.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.project.dao.GuestbookDao;

@Service
public class GuestbookServiceImpl implements GuestbookService {

	@Autowired
	private GuestbookDao guestbookDao;

	@Override
	public boolean register(HttpServletRequest request) {
		boolean result = false;
		
		String id = request.getParameter("id");
		String content = request.getParameter("content");
		return false;
	}
}
