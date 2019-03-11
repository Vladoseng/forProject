package com.example.demo.model;

public class AppUser {
	
	private Long userId;
    private String userName;
    private String encrytedPassword;
    
    private int totalHours = 0;
 
    private int Role;
    
    public AppUser() {
 
    }
 
    public AppUser(Long userId, String userName, String encrytedPassword) {
        this.userId = userId;
        this.userName = userName;
        this.encrytedPassword = encrytedPassword;
    }
 
    
    public int getRole()
    {
    	return Role;
    }
    public void setRole(int Role)
    {
    	this.Role=Role;
    }
    
    public Long getUserId() {
        return userId;
    }
 
    public void setUserId(Long userId) {
        this.userId = userId;
    }
 
    public String getUserName() {
        return userName;
    }
 
    public void setUserName(String userName) {
        this.userName = userName;
    }
 
    public String getEncrytedPassword() {
        return encrytedPassword;
    }
 
    public void setEncrytedPassword(String encrytedPassword) {
        this.encrytedPassword = encrytedPassword;
    }
    
    public int getTotalHours()
    {
    	 return totalHours;
    }
    public void setTotalHours(int totalHouts)
    {
    	this.totalHours = totalHouts;
    }
    
    public void changeHours(int hours)
    {
    	this.totalHours += hours;
    }
    
    @Override
    public String toString()
    {
    	return this.userName + "/" + this.encrytedPassword;
    }
}
