package com.example.demo.model;

public class Project {
	
	private Long Project_Id;
	private String Project_Name;
	private int Spent_Hours = 0;	
	
	public Project() {}
	
	public Project(Long Project_Id, String Project_Name)
	{
		this.Project_Id = Project_Id;
		this.Project_Name = Project_Name;
		//this.Spent_Hours = Spent_Hours;
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
		this.Project_Name=Project_Name;
	}
	public int getSpent_Hours()
	{
		return Spent_Hours;
	}
	public void setSpent_Hours(int Spent_Hours)
	{
		this.Spent_Hours=Spent_Hours;
	}
	
	public void changeHours(int hours)
	{
		this.Spent_Hours += hours;
	}

}
