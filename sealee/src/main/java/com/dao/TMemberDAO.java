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
import com.model.TMember;
import com.server.BaseHibernateDAO;
import com.web.form.AdminUserForm;
import com.web.form.MemberForm;



public class TMemberDAO {
	BaseHibernateDAO bh = new BaseHibernateDAO();
	Session session = bh.getSession();
	
	/**
	 * �û���½
	 */
	public TMember login(MemberForm form){
		TMember member = new TMember();
		boolean flag=false;
		Transaction tt = session.beginTransaction();
		try{
			Query query = session.createQuery("from TMember a where a.username=:username and a.password=:password");
			query.setString("username",form.getUsername());
			query.setString("password",form.getPassword());
			List list = query.list();
			tt.commit();
//			System.out.print(list.size());
//			System.out.print(form.getUsername());
//			System.out.print(form.getPassword());
			if(list.size()==1){
				flag=true;
				member = (TMember)list.get(0);
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

		return member;
		
	}
	
	/**
	 * ��ȡҪ�༭���û���Ϣ
	 */
	public TMember getUserInfo(String id){
		Transaction tt = session.beginTransaction();
		TMember member = new TMember();
		try{
			Query query = session.createQuery("from TMember a where a.id=? ");
			query.setString(0,id);
			List list = query.list();
			member = (TMember)list.get(0);
			tt.commit();
		}catch(HibernateException e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return member;
	}
	
	/**
	 * �û��༭
	 */
	
	public void doEdit(MemberForm memberForm) {
		Transaction tt = session.beginTransaction();
		try{
			Query query = session.createQuery("from TMember a where a.id=?");
			query.setString(0,memberForm.getId());
			TMember member = (TMember)query.list().get(0);
			
			member.setUsername(memberForm.getUsername());
			member.setPassword(memberForm.getPassword());
			member.setPetname(memberForm.getPetname());
			member.setEmail(memberForm.getEmail());
			member.setBirthday(memberForm.getBirthday());
			member.setBodily_form(memberForm.getBodily_form());
			member.setStature(memberForm.getStature());
			member.setWork_type(memberForm.getWork_type());
			member.setArea(memberForm.getArea());
			member.setAddress(memberForm.getAddress());
			member.setIs_show(memberForm.getIs_show());
			member.setMy_index(memberForm.getMy_index());
			member.setQq(memberForm.getQq());
			member.setPhone(memberForm.getPhone());
			member.setSummary(memberForm.getShow());
			member.setSex(memberForm.getSex());
			
			session.update(member);
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
	 * @param username
	 * @author Administrator
	 * @return null
	 */
	public void doUpdateIntegral(String username){
		Session session = bh.getSession();
		Transaction tt = session.beginTransaction();
		try{
			Query query = session.createQuery("from TMember a where a.username=?");
			query.setString(0,username);
			TMember member = (TMember)query.list().get(0);
			member.setIntegral(member.getIntegral()+2);
			session.update(member);
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
	 * �»�Աע��
	 */
	public TMember doNew(MemberForm memberForm){
		Transaction tt = session.beginTransaction();
		TMember member = new TMember();
		java.util.UUID id = UUID.randomUUID();
    	boolean flag = false;
		try{
//			member.setId(id);
			member.setUsername(memberForm.getUsername());
			member.setPassword(memberForm.getPassword());
			member.setPetname(memberForm.getPetname());
			member.setSex(memberForm.getSex());
			member.setEmail(memberForm.getEmail());
//			member.setArea(memberForm.getArea());
			
			session.save(member);
			tt.commit();
			flag=true;
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
//			session.flush();
			session.close();
			return member;

	}
	
	/**
	 * ��֤�»�Ա�ʻ��Ƿ����
	 */
	public boolean isExist(MemberForm form){
		boolean blog = false;
		Transaction tt = session.beginTransaction();
		try{
			Query query = session.createQuery("from TMember a where a.username=? ");
			query.setString(0,form.getUsername());
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
	 * ɾ���û�
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
