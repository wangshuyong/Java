package com.sea.dao;

import java.util.List;

import com.sea.model.User;

public interface UserDao extends BaseDao<User> {

	public User findUserById(int id);
	public List<User> findUserByPhone(String phone);
	void delete(int id);
	public List<User> getUsers();
	List<User> userLogin(String phone, String pwd);
	public List<User> listUserByPage(int startRows,int pageSize);
}
