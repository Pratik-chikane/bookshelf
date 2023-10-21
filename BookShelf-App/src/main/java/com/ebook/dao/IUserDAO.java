package com.ebook.dao;

import java.util.List;

import com.ebook.entity.User;

public interface IUserDAO {
	public boolean userRegister(User user);

	public User login(String email, String password);

	public List<User> getAllUsers();

	public boolean checkPassword(int id, String ps);
	
	public boolean updateProfile(User u);
	
	public boolean uniqueUser(String email);
}
