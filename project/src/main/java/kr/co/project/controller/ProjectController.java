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
	
	//프로젝트 수정 폼
	@RequestMapping(value="project/update", method=RequestMethod.GET)
	public String update(HttpServletRequest request, Model model) {
		Project project = projectService.updateView(request);
		model.addAttribute("project", project);
		return "project/update";
	}
	
	//프로젝트 수정
	@RequestMapping(value="project/update", method=RequestMethod.POST)
	public String update(MultipartHttpServletRequest request) {
		projectService.update(request);
		return "redirect:project";
	}
	
	//프로젝트 삭제 폼
	@RequestMapping(value="project/delete", method=RequestMethod.GET)
	public String delete() {
		return "project/delete";
	}
	
	//프로젝트 삭제
	@RequestMapping(value="project/delete", method=RequestMethod.POST)
	public String delete(HttpServletRequest request) {
		projectService.delete(request);
		return "redirect:project";
	}
}
