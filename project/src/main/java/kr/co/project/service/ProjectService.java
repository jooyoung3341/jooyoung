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
	
	//프로젝트 상세보기
	public Project detail(HttpServletRequest request);
	
	//프로젝트 수정 폼
	public Project updateView(HttpServletRequest request);
	
	//프로젝트 수정
	public void update(MultipartHttpServletRequest request);
}
