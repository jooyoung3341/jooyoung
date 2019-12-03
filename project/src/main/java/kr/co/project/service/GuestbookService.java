package kr.co.project.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.co.project.domain.Guestbook;

public interface GuestbookService {

	//방명록 등록
	public boolean register(HttpServletRequest request);
	
	//방명록 목록
	public List<Guestbook> guestbooklist(HttpServletRequest request);
}
