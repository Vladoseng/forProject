package com.example.demo.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.example.demo.model.WorkoutModel;
import org.springframework.jdbc.core.RowMapper;

public class workoutMapper implements RowMapper<WorkoutModel>{
	
	public static final String BASE_SQL ="Select w.id, w.User_Id, w.Project_Id, w.Project_Name, w.Spent_Hours from workout w";

	@Override
	public WorkoutModel mapRow(ResultSet rs, int rowNum) throws SQLException
	{
		Long Workout_Id = rs.getLong("id");
		Long User_Id = rs.getLong("User_Id");
		Long Project_Id = rs.getLong("Project_Id");
		String Project_Name = rs.getString("Project_Name");
		int Spent_Time = rs.getInt("Spent_Hours");
		
		return new WorkoutModel(Workout_Id, User_Id, Project_Id, Project_Name, Spent_Time);
	}
}
