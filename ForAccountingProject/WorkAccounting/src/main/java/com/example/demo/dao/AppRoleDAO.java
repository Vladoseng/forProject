package com.example.demo.dao;

import java.util.List;

import javax.sql.DataSource;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class AppRoleDAO extends JdbcDaoSupport{

	@Autowired
	public AppRoleDAO(DataSource dataSource)
	{
		this.setDataSource(dataSource);
	}
	
	public List<String> getRoleNames(Long userId)
	{
		String sql = "Select r.Role_Name from user_role ur, app_role r where ur.Role_Id = r.Role_Id and ur.User_Id = ?";
		
		Object[] params = new Object[] {userId};
		
		List<String> roles = this.getJdbcTemplate().queryForList(sql, params, String.class);
		
		return roles;
	}
	
	public void createRole(Long userId, int roleId)
	{
		String sql = "Insert into user_role(user_id, role_id) values (?,?)";
		this.getJdbcTemplate().update(sql, userId, roleId);
	}
	
}
