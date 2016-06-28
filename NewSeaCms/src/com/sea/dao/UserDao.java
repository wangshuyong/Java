package com.sea.dao;

import java.util.List;

import com.sea.model.User;

public interface UserDao extends BaseDao<User> {

	boolean findUserByPhone(String phone);
	void delete(int id);
	public List<User> getUsers();
}
