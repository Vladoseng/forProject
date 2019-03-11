package com.example.demo.dao;

import java.util.List;
import javax.sql.DataSource;
import com.example.demo.model.Calendar;
import com.example.demo.mapper.CalendarMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class CalendarDAO extends JdbcDaoSupport{

	@Autowired
	public  CalendarDAO(DataSource dataSource)
	{
		this.setDataSource(dataSource);
	}
	
	public List<Calendar> getCalendar()
	{
		String sql = CalendarMapper.BASE_SQL;
		Object[] params = new Object[] {};
		CalendarMapper mapper = new CalendarMapper();
		
		List<Calendar> list = this.getJdbcTemplate().query(sql, params, mapper);
		
		return list;
	}
	
}
