package com.example.demo.dao;

import java.util.List;
import javax.sql.DataSource;
import com.example.demo.model.WorkoutModel;
import com.example.demo.mapper.workoutMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class WorkoutDAO extends JdbcDaoSupport{

	@Autowired
	public WorkoutDAO(DataSource dataSource)
	{
		this.setDataSource(dataSource);
	}
	
	public void createWorkout(Long User_Id, Long Project_Id, String Project_Name)
	{
		String sql = "Insert into workout(User_Id, Project_Id, Project_Name) values(?,?,?)";
		this.getJdbcTemplate().update(sql, User_Id, Project_Id, Project_Name);
	}
	
	public void updateWorkoutHours(WorkoutModel workout, int hours)
	{
		String sql = "update workout set Spent_Hours=? where id=?";
		this.getJdbcTemplate().update(sql, workout.getSpent_Hours()+hours, workout.getWorkout_Id());
	}
	
	public WorkoutModel findWorkoutById(long workout_id)
	{
		String sql = workoutMapper.BASE_SQL + " where w.id=?";
		Object[] params = new Object[] {workout_id};
		workoutMapper mapper = new workoutMapper();
		
		try {
			WorkoutModel workout = this.getJdbcTemplate().queryForObject(sql, params, mapper);
			return workout;
		}
		catch(EmptyResultDataAccessException e)
		{
			return null;
		}
	}
	
	public List<WorkoutModel> findWorkoutByWorkerId(Long User_Id)
	{
		String sql = workoutMapper.BASE_SQL + " where w.User_Id=?";
		
		Object[] params = new Object[] {User_Id};
		
		workoutMapper mapper = new workoutMapper();
		
		try 
		{
			List<WorkoutModel> workoutInfo = this.getJdbcTemplate().query(sql, params, mapper);
			return workoutInfo;
		}
		catch(EmptyResultDataAccessException e)
		{
			return null;
		}		
	}
	
	public List<WorkoutModel> findWorkoutByProjectId(Long Project_Id)
	{
		String sql = workoutMapper.BASE_SQL + " where w.Project_Id=?";
		
		Object[] params = new Object[] {Project_Id};
		
		workoutMapper mapper = new workoutMapper();
		
		try 
		{
			List<WorkoutModel> workoutInfo = this.getJdbcTemplate().query(sql, params, mapper);
			return workoutInfo;
		}
		catch(EmptyResultDataAccessException e)
		{
			return null;
		}		
	}
	
	public List<WorkoutModel> getWorkoutsList()
	{
		String sql = workoutMapper.BASE_SQL;
		
		Object[] params = new Object[] {};
		
		workoutMapper mapper = new workoutMapper();
		
		List<WorkoutModel> list = this.getJdbcTemplate().query(sql, params, mapper);
		
		return list;
	}
	
}
