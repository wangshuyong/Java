package com.sea.service;

import java.util.List;

import com.sea.model.User;

public interface UserService {
	
	public boolean exists(User u);
	public String addUser(User u);
	public void deleteUser(int id);
	public List<User> listUser(int offset,int length);
	public int getUserCount();
	public User getUser(int id);
	public void updateUser(User user);
}
