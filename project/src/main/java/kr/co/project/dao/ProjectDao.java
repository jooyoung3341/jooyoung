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
	public void register(Project project) {
		sqlSession.insert("project.register", project);
	}
	
	//프로젝트 목록
	public List<Project> projectlist(){
		return sqlSession.selectList("project.projectlist");
	}
	
	//프로젝트 상세보기
	public Project detail(int pno) {
		return sqlSession.selectOne("project.detail", pno);
	}
	
	//프로젝트 수정
	public void update(Project project) {
		sqlSession.update("project.update", project);
	}
	
	//프로젝트 삭제
	public void delete(int pno) {
		sqlSession.delete("project.delete", pno);
	}
}
