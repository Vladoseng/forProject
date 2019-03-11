package com.example.demo.dao;

import java.util.List;
import javax.sql.DataSource;
import com.example.demo.model.Project;
import com.example.demo.mapper.projectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class ProjectDAO extends JdbcDaoSupport{
	
	@Autowired
	public ProjectDAO(DataSource dataSource)
	{
		this.setDataSource(dataSource);
	}
	
	public Project findProjectById(Long Project_Id)
	{
		String sql = projectMapper.BASE_SQL + " where p.Project_Id=?";
		
		Object[] params = new Object[] {Project_Id};
		projectMapper mapper = new projectMapper();
		try
		{
			Project project =this.getJdbcTemplate().queryForObject(sql, params, mapper);
			return project;
		}
		catch(EmptyResultDataAccessException e)
		{
			return null;
		}
	}
	
	public List<Project> getProjectsList()
	{
		String sql = projectMapper.BASE_SQL;
		
		Object[] params = new Object[] {};
		
		projectMapper mapper = new projectMapper();
		
		List<Project> list = this.getJdbcTemplate().query(sql, params, mapper);
		
		return list;
	}
	
	public void addProject(Long id, String name)
	{
		String sql = "Insert into projects(Project_Id, Project_Name) values (?,?)";
		this.getJdbcTemplate().update(sql, id, name);
	}

}
