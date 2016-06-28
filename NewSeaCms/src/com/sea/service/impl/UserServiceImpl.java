package com.sea.service.impl;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Component;
import com.sea.dao.UserDao;
import com.sea.model.User;
import com.sea.service.UserService;
@Component("userService")
public class UserServiceImpl implements UserService{
	private UserDao userDao;

	public UserDao getUserDao() {
		return userDao;
	}
    @Resource(name="u")
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public boolean exists(User u) {
		return userDao.findUserByPhone(u.getPhone());
	}

	@Override
	public String addUser(User u) {
		if(!exists(u)){
			userDao.save(u);
			return "success";
		}else
			return "fail";
	}
	@Override
	public void deleteUser(int id) {
			userDao.delete(id);
	}
	@Override
	public List<User> listUser(int pageSize,int startRows) {
		String hql ="from User u order by u.id desc";
		List <User> list = userDao.queryForPage(hql, pageSize, startRows);
		return list;
	}
	
	public int getUserCount(){
		String hql = "from User";
		return userDao.getAllRowCount(hql);
	}
	@Override
	public User getUser(int id) {
		User user = userDao.load(id);
		return user;
	}
	@Override
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		userDao.update(user);
	}
	
	
}
