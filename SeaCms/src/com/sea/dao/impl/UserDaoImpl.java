package com.sea.dao.impl;

import java.util.List;
import org.hibernate.Query;
import org.springframework.stereotype.Component;
import com.sea.dao.UserDao;
import com.sea.model.User;

@Component("userDao")
@SuppressWarnings("unchecked")
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao{

	public void save(User u) {      
		this.getHibernateTemplate().save(u);
	}
	@Override
	public User findUserById(int id) {
		User user = this.load(id);
		return user;
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
	
	@Override
	public List<User> userLogin(String phone, String pwd) {
		String hql="from User u where u.phone=? and u.password=?";
		Query q = this.getSessionFactory().openSession().createQuery(hql);
		q.setParameter(0, phone);
		q.setParameter(1, pwd);
		return q.list();
	}
	
	@Override
	public List<User> findUserByPhone(String phone) {
		String hql="from User u where u.phone=?";
		return this.list(hql,phone);
	}
	
	@Override
	public List<User> listUserByPage(int startRows,int pageSize) {
		String hql ="from User u order by u.id desc";
		List <User> list = super.queryForPage(hql, startRows, pageSize);
		return list;
	}
	
}
