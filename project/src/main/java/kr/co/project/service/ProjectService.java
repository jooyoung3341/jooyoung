package kr.co.project.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.project.domain.Project;

public interface ProjectService {

	//프로젝트 등록
	//파일업로드를 할 떄는 HttpServletRequest 대신에 MultipartHttpServletRequest를 사용
	public void register(MultipartHttpServletRequest request);
	
	//프로젝트 목록
	public List<Project> projectlist(HttpServletRequest request);
}