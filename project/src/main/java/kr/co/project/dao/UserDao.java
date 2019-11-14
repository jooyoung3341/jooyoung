package kr.co.project.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.project.domain.User;

@Repository
public class UserDao {

	@Autowired
	private SqlSession sqlSession;
	
	//회원가입
	public int signup(User user) {
		return sqlSession.insert("user.signup", user);
	}

	//id 중복확인
	public String idCheck(String id) {
		return sqlSession.selectOne("user.idcheck", id);
	}
	
	//로그인
	public User login(String id) {
		return sqlSession.selectOne("user.login", id);
	}
}

