package com.example.demo.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.example.demo.model.Project;
import org.springframework.jdbc.core.RowMapper;

public class projectMapper implements RowMapper<Project>{
	
	public static final String BASE_SQL = "Select p.Project_Id, p.Project_Name from projects p";
	
	@Override
	public Project mapRow(ResultSet rs, int rowNum) throws SQLException
	{
		Long Project_Id = rs.getLong("Project_Id");
		String Project_Name = rs.getString("Project_Name");
		//int Spent_Hours = rs.getInt("Spent_Hours");
		
		return new Project(Project_Id, Project_Name);
	}

}
