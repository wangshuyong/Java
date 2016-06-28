package com.dao;



import java.util.*;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import com.server.BaseHibernateDAO;
/**
 * 
 * @author bluedreams66
 *
 */
public class PagerDAO {
	
	/**
	 * ��ȡ��ʾҳ����ȡ��¼
	 */
	public List  findWithPage(int pageSize,int startRow,String sql) throws HibernateException{
		List vehicleList = null;
		Transaction tx = null;
		BaseHibernateDAO bh = new BaseHibernateDAO();
		Session session = bh.getSession();
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery(sql);
			query.setFirstResult(startRow);
			query.setMaxResults(pageSize);
			vehicleList = query.list();
			tx.commit();
		}catch(HibernateException e){
			e.printStackTrace();
			if (tx != null) {
				tx.rollback();
			}
		}finally{
			//session.flush();
			session.close();
		}
		
		return vehicleList;	
	}
	
	/**
	 * ��ȡ��¼����
	 */
	public int getRows(String query) throws HibernateException{
		int totalRows =0;
		Transaction tx = null;
		BaseHibernateDAO bh = new BaseHibernateDAO();
		Session session = bh.getSession();	
		try{
			tx = session.beginTransaction();
			Integer _totalRows = Integer.parseInt(session.createQuery(query).uniqueResult().toString());
			if(_totalRows!=null){
				totalRows = _totalRows.intValue();
			}
			tx.commit();
		}catch(HibernateException e){
			e.printStackTrace();
			if (tx != null) {
				tx.rollback();
			}
		}finally{
			session.close();
		}
		return totalRows;
	}
	
	/**
	 * ��ȡ�������������м�¼
	 */
	public List  findAllPage(String sql) throws HibernateException{
		List vehicleList = null;
		Transaction tx = null;
		BaseHibernateDAO bh = new BaseHibernateDAO();
		Session session = bh.getSession();
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery(sql);
			System.out.println(sql);
			vehicleList = query.list();
			tx.commit();
		}catch(HibernateException e){
			e.printStackTrace();
			if (tx != null) {
				tx.rollback();
			}
		}finally{
			//session.flush();
			session.close();
		}
		
		return vehicleList;	
	}
}
