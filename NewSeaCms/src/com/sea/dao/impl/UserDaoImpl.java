package com.sea.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.sea.dao.UserDao;
import com.sea.model.User;
import com.sea.util.DBUtil;

@SuppressWarnings("unchecked")
@Component("u")
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao{

	public void save(User u) {      
		this.getHibernateTemplate().save(u);
	}
	
	public boolean findUserByPhone(String phone) {
		String hql="from User u where u.phone=?";
		List<User> users = this.list(hql, phone);
		if(users!=null && users.size()>0){
			return true;
		}
		return false;
	}

	@Override
	public void delete(int id) {
		User u = this.load(id);
 		this.delete(u);
	}

	@Override
	public List<User> getUsers() {
		String hql="from User u order by u.id";
		return this.list(hql);
	}
	
	

}
