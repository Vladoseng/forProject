package com.example.demo.dao;

import java.util.List;

import javax.sql.DataSource;

import com.example.demo.model.Project;
import com.example.demo.model.AppUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class SendAssumeDAO extends JdbcDaoSupport{

	@Autowired
	public SendAssumeDAO(DataSource dataSource)
	{
		this.setDataSource(dataSource);
	}
	
	public void updateProjectsAssume(List<Project> assume)
	{
		//String sql = "INSERT INTO assume_projects (Project_Id, Project_Name, Spent_Hours) values = (?,?,?)";
		//this.getJdbcTemplate().update(sql, 1, "Name", 5);
		for(Project project : assume)
		{
			try {
				String sql = "INSERT INTO assume_projects (Project_Id, Project_Name, Spent_Hours) values (?,?,?)";
				this.getJdbcTemplate().update(sql, project.getProject_Id(), project.getProject_Name(), project.getSpent_Hours());
			}
			catch (DuplicateKeyException e)
			{
				String sql = "UPDATE assume_projects set Project_Id= ?, Project_Name= ?, Spent_Hours= ? where Project_Id = ?";
				this.getJdbcTemplate().update(sql, project.getProject_Id(), project.getProject_Name(), project.getSpent_Hours(), project.getProject_Id());
				continue;
			}			
		}			
	}
	
	public void updateWorkersAssume(List<AppUser> assume)
	{
		for(AppUser worker : assume)
		{
			try {
				String sql = "INSERT INTO assume_workers (User_Id, User_Name, Total_Hours) values (?,?,?)";
				this.getJdbcTemplate().update(sql, worker.getUserId(), worker.getUserName(), worker.getTotalHours());
			}
			catch(DuplicateKeyException e)
			{
				String sql = "UPDATE assume_meworkers set User_Id= ?, User_Name= ?, Total_Hours= ? where User_Id = ?";
				this.getJdbcTemplate().update(sql, worker.getUserId(), worker.getUserName(), worker.getTotalHours(), worker.getUserId());
				continue;
			}
			
		}
	}
	
}
