package kr.co.project.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.project.dao.GuestbookDao;
import kr.co.project.domain.Guestbook;

@Service
public class GuestbookServiceImpl implements GuestbookService {

	@Autowired
	private GuestbookDao guestbookDao;

	//방명록 등록
	@Override
	public boolean register(HttpServletRequest request) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar time = Calendar.getInstance();
		
		boolean result = false;
		
		String id = request.getParameter("id");
		String content = request.getParameter("content");
		System.out.println(content);
		String insert_date = format.format(time.getTime());
		
		Guestbook guestbook = new Guestbook();
		guestbook.setId(id);
		guestbook.setContent(content);
		guestbook.setInsert_date(insert_date);
		
		int r = guestbookDao.register(guestbook);
		
		if(r > 0)
			result = true;
		return result;
	}

	//방명록 목록
	@Override
	public List<Guestbook> guestbooklist(HttpServletRequest request) {
		/* List<Guestbook> guestbooklist = guestbookDao.guestbooklist(); */
		return guestbookDao.guestbooklist(); 
	}
}
