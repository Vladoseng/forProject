package com.example.demo.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import com.example.demo.model.Calendar;
import org.springframework.jdbc.core.RowMapper;

public class CalendarMapper implements RowMapper<Calendar>{

	public static final String BASE_SQL = "Select c.db_date, c.day_name, c.weekend_flag from calendar c";
	
	@Override
	public Calendar mapRow(ResultSet rs, int rowNum) throws SQLException
	{
		String Date = rs.getString("db_date");
		String DayName = rs.getString("day_name");
		String WeekendFlag = rs.getString("weekend_flag");
		
		return new Calendar(Date, DayName, WeekendFlag);
	}
}
