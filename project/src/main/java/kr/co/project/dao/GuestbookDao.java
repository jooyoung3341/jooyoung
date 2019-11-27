package kr.co.project.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.project.domain.Guestbook;

@Repository
public class GuestbookDao {

	@Autowired
	private SqlSession sqlSession;
	
	//방명록 등록
	public int register(Guestbook guestbook) {
		return sqlSession.insert("questbook.register", guestbook);
	}
}
