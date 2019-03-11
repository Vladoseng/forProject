package com.example.demo.model;



public class assumeForm {
	
	private Long Worker_Id;
	private String Worker_Name;
	private int Worker_Spent_Hours;
	
	private Long Project_Id;
	private String Project_Name;
	private int Project_Spent_Time;
	
	public assumeForm(Long Worker_Id, String Worker_Name, int Worker_Spent_Hours, Long Project_Id, String Project_Name, int Project_Spent_Time)
	{
		this.Worker_Id = Worker_Id;
		this.Worker_Name = Worker_Name;
		this.Worker_Spent_Hours = Worker_Spent_Hours;
		
		this.Project_Id = Project_Id;
		this.Project_Name = Project_Name;
		this.Project_Spent_Time = Project_Spent_Time;
	}

	public Long getWorker_Id()
	{
		return Worker_Id;
	}
	public void setWorker_Id(Long Worker_Id)
	{
		this.Worker_Id = Worker_Id;
	}
	
	public String getWorker_Name()
	{
		return Worker_Name;
	}
	public void setWorker_Name(String Worker_Name)
	{
		this.Worker_Name = Worker_Name;
	}
	
	public int getWorker_Spent_Hours()
	{
		return Worker_Spent_Hours;
	}
	public void setWorker_Spent_Hours(int Worker_Spent_Hours)
	{
		this.Worker_Spent_Hours = Worker_Spent_Hours;
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
	
	public int getProject_Spent_Time()
	{
		return Project_Spent_Time;
	}
	public void setProject_Spent_Time(int Project_Spent_Time)
	{
		this.Project_Spent_Time = Project_Spent_Time;
	}
}
