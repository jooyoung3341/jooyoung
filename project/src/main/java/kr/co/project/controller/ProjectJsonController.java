package kr.co.project.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.project.domain.Project;
import kr.co.project.service.ProjectService;

@RestController
public class ProjectJsonController {
	
	@Autowired
	private ProjectService projectService;
	
	//프로젝트 상세보기
	@RequestMapping(value="project/detail", method=RequestMethod.GET)
	public Project detail(HttpServletRequest request) {
		Project project = projectService.detail(request);
		return project;
	}
	
}
