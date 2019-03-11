package com.example.demo.model;

//Workout it is the information about users' projects and how long time they were been working on it
public class WorkoutModel {
	
	private Long Workout_Id;
	private Long User_Id;
	private Long Project_Id;
	private String Project_Name;
	private int Spent_Hours;
	
	public WorkoutModel(){}
	
	public WorkoutModel(Long Workout_Id,Long User_Id, Long Project_Id, String Project_Name,int Spent_Hours)
	{
		this.Workout_Id = Workout_Id;
		this.User_Id = User_Id;
		this.Project_Id = Project_Id;
		this.Project_Name = Project_Name;
		this.Spent_Hours = Spent_Hours;
	}
	
	public Long getWorkout_Id()
	{
		return Workout_Id;
	}
	public void setWorkout_Id(Long Workout_Id)
	{
		this.Workout_Id = Workout_Id;
	}
	
	public Long getUser_Id()
	{
		return User_Id;
	}
	public void setUser_Id(Long User_Id)
	{
		this.User_Id = User_Id;
	}
	
	public Long getProject_Id()
	{
		return Project_Id;
	}
	public void setProject_Id(Long Project_Id)
	{
		this.Project_Id = Project_Id;
	}
	
	public String getProject_Name()
	{
		return Project_Name;
	}
	public void setProject_Name(String Project_Name)
	{
		this.Project_Name = Project_Name;
	}
	
	public int getSpent_Hours()
	{
		return Spent_Hours;
	}
	public void setSpent_Hours(int Spent_Hours)
	{
		this.Spent_Hours = Spent_Hours;
	}
	
}
