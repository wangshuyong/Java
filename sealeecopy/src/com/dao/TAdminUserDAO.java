package com.dao;

/**
 * 
 * @author bluedreams66
 *
 */

import java.util.List;
import java.util.UUID;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import com.model.TAdminUser;
import com.server.BaseHibernateDAO;
import com.web.form.AdminUserForm;



public class TAdminUserDAO {
	BaseHibernateDAO bh = new BaseHibernateDAO();
	Session session = bh.getSession();
	
	/**
	 * 用户登陆
	 */
	public boolean login(AdminUserForm userForm){
		boolean blog = false;
		Transaction tt = session.beginTransaction();
		try{
			Query query = session.createQuery("from TAdminUser a where a.username=? and a.password=?");
			query.setString(0,userForm.getUsername());
			query.setString(1,userForm.getPassword());
			List list = query.list();
			tt.commit();
			if(list.size()==1){
				blog = true;				
			}
		}catch(HibernateException e){
			e.printStackTrace();
			 try {
		        if (tt != null) {
		          tt.rollback();
		        }
			 } catch (Exception ex1) {
		        ex1.printStackTrace();
		     }
			 
		}
		session.flush();
		session.close();
		return blog;
	}
	
	/**
	 * 获取要编辑的用户信息
	 */
	public TAdminUser getUserInfo(String id){
		Transaction tt = session.beginTransaction();
		TAdminUser adminuser = new TAdminUser();
		try{
			Query query = session.createQuery("from TAdminUser a where a.id=? ");
			query.setString(0,id);
			List list = query.list();
			adminuser = (TAdminUser)list.get(0);
			tt.commit();
		}catch(HibernateException e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return adminuser;
	}
	
	/**
	 * 用户编辑
	 */
	
	public void doEdit(AdminUserForm userForm){
		Transaction tt = session.beginTransaction();
		try{
			Query query = session.createQuery("from TAdminUser a where a.id=?");
			query.setString(0,userForm.getId());
			TAdminUser user = (TAdminUser)query.list().get(0);
			user.setUsername(userForm.getUsername());
			user.setPassword(userForm.getPassword());
			user.setPower(userForm.getPower());
			session.update(user);
			tt.commit();		
		}catch(HibernateException e){
			e.printStackTrace();
			 try {
		        if (tt != null) {
		          tt.rollback();
		        }
			 } catch (Exception ex1) {
		        ex1.printStackTrace();
		     }
			 
		}finally{
			session.flush();
			session.close();
		}
	}
	
	/**
	 * 添加新用户
	 */
	public void doNew(AdminUserForm userForm){
		Transaction tt = session.beginTransaction();
		try{
			java.util.UUID tempId = UUID.randomUUID();
			String id = tempId.toString();
			TAdminUser user = new TAdminUser();
			user.setId(id);
			user.setUsername(userForm.getUsername());
			user.setPassword(userForm.getPassword());
			user.setPower(userForm.getPower());
			session.save(user);
			tt.commit();		
		}catch(HibernateException e){
			e.printStackTrace();
			 try {
		        if (tt != null) {
		          tt.rollback();
		        }
			 } catch (Exception ex1) {
		        ex1.printStackTrace();
		     }
			 
		}finally{
			session.flush();
			session.close();
		}		
	}
	/**
	 * 删除用户
	 */
	public void doDelete(String id){
		Transaction tt = session.beginTransaction();
		try{
			Query query = session.createQuery("delete TAdminUser a where a.id=? ");
			query.setString(0,id);
			query.executeUpdate();
			tt.commit();
		}catch(HibernateException e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		
	}
	
}
