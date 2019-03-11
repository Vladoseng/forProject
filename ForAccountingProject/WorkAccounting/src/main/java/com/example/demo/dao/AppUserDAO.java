package com.example.demo.dao;

import java.util.List;

import javax.sql.DataSource;

import com.example.demo.mapper.AppUserMapper;
import com.example.demo.model.AppUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class AppUserDAO extends JdbcDaoSupport {

	@Autowired
	public AppUserDAO(DataSource dataSource)
	{
		this.setDataSource(dataSource);
	}
	
	public AppUser findUserById(long id)
	{
		String sql = AppUserMapper.BASE_SQL + " where u.User_Id=? ";
		
		Object[] params = new Object[] {id};
		AppUserMapper mapper = new AppUserMapper();
		try {
			AppUser workerInfo = this.getJdbcTemplate().queryForObject(sql, params,mapper);
			return workerInfo;
		} catch(EmptyResultDataAccessException e)
		{
			return null;
		}
		
	}
	
	public AppUser findUserAccount(String userName)
	{
		// Select .. from App_User u Where u.User_Name = ?
		String sql = AppUserMapper.BASE_SQL + " where u.User_Name=? ";
		
		Object[] params = new Object[] {userName};
		AppUserMapper mapper = new AppUserMapper();
		try {
			AppUser userInfo = this.getJdbcTemplate().queryForObject(sql, params, mapper);
			return userInfo;
		} catch (EmptyResultDataAccessException e)
		{
			return null;
		}		
	}
	
	public List<AppUser> getWorkersList()
	{
		String sql = AppUserMapper.BASE_SQL;
		
		Object[] params = new Object[] {};
		
		AppUserMapper mapper = new AppUserMapper();
		
		List<AppUser> list = this.getJdbcTemplate().query(sql, params,mapper);
		
		return list;
	}
	
	public void addWorker(Long id, String name, String password)
	{
		String sql = "Insert into users(User_Id, User_Name, Encrypted_Password) values (?,?,?)";
		this.getJdbcTemplate().update(sql, id, name, password);
	}
	
}
