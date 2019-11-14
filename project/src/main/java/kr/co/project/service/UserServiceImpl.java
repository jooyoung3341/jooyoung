package kr.co.project.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.co.project.dao.UserDao;
import kr.co.project.domain.User;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	
	//스프링 시큐리티에서 기본적으로 사용하는 암호화 방식으로 암호화가 될 떄 마다 새로운 값을 생성
	@Autowired
	private BCryptPasswordEncoder passEncoder;
	
	//회원가입
	@Override
	public void signup(HttpServletRequest request) {
		//rawPass 암호화 되지 않은 암호
		String rawPass = request.getParameter("pw");
		String id = request.getParameter("id");
		//암호화된 암호
		String pw = passEncoder.encode(rawPass);
		String email = request.getParameter("email");

		User user = new User();
		user.setId(id);
		user.setPw(pw);
		user.setEmail(email);

		
		userDao.signup(user);
	}

	//id 중복확인
	@Override
	public String idCheck(HttpServletRequest request) {
		String id = request.getParameter("id");
		return userDao.idCheck(id);
	}

	//로그인
	@Override
	public User login(HttpServletRequest request) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		User user = userDao.login(id);

		if(user != null) {
			//matches 메서드는 입력한 패스워드와 저장된 패스워드를 비교하고, 같다면 true 틀리면 false를 리턴
			boolean passMatch = passEncoder.matches(pw, user.getPw());
			if(passMatch == false) {
				user = null;
			}
		}
		
		return user;
	}

}
