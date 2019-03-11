package com.example.demo.utils;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class EncrytedPasswordUtils {
	
	// Encryte Password with BCryptPasswordEncoder
	public static String encryptePassword(String password)
	{
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder.encode(password);
	}
	
	public String EncryptePassword(String password)
	{
		//String password = "123";
		String encryptedPassword = encryptePassword(password);
		
		System.out.println("Encryted Password: " + encryptedPassword);
		
		return encryptedPassword;
	}

}
