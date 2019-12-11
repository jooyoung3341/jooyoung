package kr.co.project.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.project.dao.ProjectDao;
import kr.co.project.domain.Project;
import kr.co.project.domain.User;

@Service
public class ProjectServiceImpl implements ProjectService {

	@Autowired
	private ProjectDao projectDao;

	@Override
	public void register(MultipartHttpServletRequest request) {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		//로그인 한 유저의 id 가져오기 
		HttpSession session= request.getSession();
		User user = (User) session.getAttribute("user");
		String id = user.getId();
		
		//파일업로드
		MultipartFile image = request.getFile("image");
		/*
		 * 파일을 저장할 경로 만들기
		 * 파일은 절대경로로만 저장이 가능
		 * 프로젝트 내의 image 디렉토리의 절대 경로를 만들기
		*/
		//getRealPath("/"); 는 webapp폴더까지를 의미
		@SuppressWarnings("deprecation")
		String uploadPath = request.getRealPath("resources/image");
		//UUID : 중복되지 않은 고유한 키 값
		UUID uid = UUID.randomUUID();
		//getOriginalFilename() : 업로드 한 파일의 실제 이름을 구함
		String filename = image.getOriginalFilename();
		//중복된 이름 방지를위해 앞에 고유값 붙힘
		filename = uid + "_" + filename;
		String filepath = uploadPath + "\\" + filename;
		Project project = new Project();
		File f = new File(filepath);
			try {
				//파일 전송 - 파일 업로드
				image.transferTo(f);
				project.setId(id);
				project.setTitle(title);
				project.setContent(content);
				project.setImage(filename);
				projectDao.register(project);
			} catch (Exception e) {
				System.out.println(e);
			}
	}

	//프로젝트 목록
	@Override
	public List<Project> projectlist(HttpServletRequest request) {
		List<Project> projectlist = projectDao.projectlist();
		return projectlist;
	}

	//프로젝트 상세보기
	@Override
	public Project detail(HttpServletRequest request) {
		String pno = request.getParameter("pno");
		return projectDao.detail(Integer.parseInt(pno));
	}
	
	//프로젝스 수정 폼
	@Override
	public Project updateView(HttpServletRequest request) {
		String pno = request.getParameter("pno");
		
		//데이터 가져오는 메소드 호출해서 리턴
		return projectDao.detail(Integer.parseInt(pno));
	}
	
	//프로젝트 수정
	@Override
	public void update(MultipartHttpServletRequest request) {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String pno = request.getParameter("pno");
		MultipartFile image = request.getFile("image");
		String uploadPath = request.getRealPath("resources/image");
		UUID uid = UUID.randomUUID();
		String filename = image.getOriginalFilename();
		filename = uid + "_" + filename;
		String filepath = uploadPath + "\\" + filename;
		Project project = new Project();
		File f = new File(filepath);
		try {
			image.transferTo(f);
			project.setTitle(title);
			project.setContent(content);
			project.setImage(filename);
			project.setPno(Integer.parseInt(pno));
		} catch (Exception e) {
			System.out.println(e);
		}
		projectDao.update(project);		
	}

}
