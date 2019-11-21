package kr.co.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.project.domain.Project;

@Repository
public class ProjectDao {

	@Autowired
	private SqlSession sqlSession;
	
	//프로젝트 등록
	public int register(Project project) {
		return sqlSession.insert("project.register", project);
	}
	
	//프로젝트 목록
	public List<Project> projectlist(){
		return sqlSession.selectList("project.projectlist");
	}
	
	//프로젝트 상세보기
	public Project detail(int pno) {
		return sqlSession.selectOne("project.detail", pno);
	}
}
