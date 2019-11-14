package kr.co.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.project.domain.Project;
import kr.co.project.service.ProjectService;

@Controller
public class ProjectController {

	@Autowired
	private ProjectService projectService;
	
	//프로젝트 목록
	@RequestMapping(value="project/project", method=RequestMethod.GET)
	public String projectlist(Model model, HttpServletRequest request) {
		List<Project> projectlist = projectService.projectlist(request);
		model.addAttribute("projectlist", projectlist);
		return "project/project";
	}
	//프로젝트 등록 폼
	@RequestMapping(value="project/register", method=RequestMethod.GET)
	public String register() {
		return "project/register";
	}
	
	//프로젝트 등록
	@RequestMapping(value="project/register", method=RequestMethod.POST)
	public String register(MultipartHttpServletRequest request, RedirectAttributes attr) {
		projectService.register(request);
		attr.addFlashAttribute("pregistermsg", "프로젝트 등록 완료!");
		return "redirect:project";
	}
}
