package kr.co.project.service;

import javax.servlet.http.HttpServletRequest;

public interface GuestbookService {

	//방명록 등록
	public boolean register(HttpServletRequest request);
}
