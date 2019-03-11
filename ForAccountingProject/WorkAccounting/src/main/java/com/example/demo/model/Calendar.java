package com.example.demo.model;

public class Calendar {

	public String Date;
	public String DayName;
	public String WorkFlag;
	
	public Calendar(String Date, String DayName, String WorkFlag)
	{
		this.Date = Date;
		this.DayName = DayName;
		this.WorkFlag = WorkFlag;
	}
	
	public void setDate(String Date)
	{
		this.Date = Date;
	}
	public String getDate()
	{
		return Date;
	}
	
	public void setDayName(String DayName)
	{
		this.DayName = DayName;
	}
	public String getDayName()
	{
		return DayName;
	}
	
	public void setWorkFlag(String WorkFlag)
	{
		this.WorkFlag = WorkFlag;
	}
	public String getWorkFlag()
	{
		return WorkFlag;
	}	
}
