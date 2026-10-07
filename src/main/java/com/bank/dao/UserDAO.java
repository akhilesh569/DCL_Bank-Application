package com.bank.dao;

import java.util.List;

import com.bank.dto.User;

public interface UserDAO {
	
	void addUser(User u);
	
	void updateUser(User u);
	
	void deleteUserById(Integer id);
	
	User getUserByMailAndPassword(String mail , String password);
	
	User getUserByMail(String mail);
	
	User getUserById(Integer id);
	
	List<User> getAllUser();
	
}
