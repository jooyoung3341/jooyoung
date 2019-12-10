package kr.co.project.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import kr.co.project.domain.User;

@Component
public class AdminInterceptor implements HandlerInterceptor {

	/*
	 * true를 리턴하면 Controller로 넘어가고
	 * false를 리턴하면 Controller로 넘어가지 않음
	 * Controller가 처리하기 전에 호출되는 메소드
	*/
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		User user = (User)session.getAttribute("user");
		/*
		 * if(session.getAttribute("user") == null) { String contextPath =
		 * request.getContextPath();
		 * 
		 * response.sendRedirect(contextPath + "/"); return false; }
		 */
		if(!session.getAttribute("id").equals("admin")) {
			String contextPath = request.getContextPath();
			
			response.sendRedirect(contextPath + "/");
			return false;
		}
		
		return true;
	}

	//Controller가 사용자의 요청을 정상적으로 처리하고 난 후 호출되는 메소드
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	//Controller에서 예외 발생 여부에 상관없이 호출되는 메소드
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}

}
