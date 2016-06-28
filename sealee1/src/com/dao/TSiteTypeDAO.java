package com.dao;


import java.util.List;
import java.util.UUID;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.model.TSiteType;
import com.server.BaseHibernateDAO;
import com.web.form.SiteTypeForm;

public class TSiteTypeDAO {
	BaseHibernateDAO bh = new BaseHibernateDAO();
	Session session = bh.getSession();
	
	/**
	 * 新增类型
	 */
	public void doNew(SiteTypeForm typeForm){
		Transaction tt = session.beginTransaction();
		try{
//			java.util.UUID tempId = UUID.randomUUID();
//			String id = tempId.toString();
			TSiteType type = new TSiteType();
//			type.setId(id);
			type.setName(typeForm.getName());
			type.setName_value(typeForm.getName_value());
			type.setType_level(typeForm.getType_level());
			session.save(type);
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
	 * 获取待编辑类型信息
	 */
	public TSiteType getInfo(String id){
		BaseHibernateDAO bh = new BaseHibernateDAO();
		Session session = bh.getSession();
		Transaction tt = session.beginTransaction();
		TSiteType typeinfo = new TSiteType();
		try{
			Query query = session.createQuery("from TSiteType a where a.id=? ");
			query.setString(0,id);
			List list = query.list();
			typeinfo = (TSiteType)list.get(0);
			tt.commit();
		}catch(HibernateException e){
			e.printStackTrace();
			try{
				if(tt!=null){
					tt.rollback();
				}
			}catch(Exception ex){
				ex.printStackTrace();
			}
		}finally{
			session.close();
		}
		return typeinfo;
	}
	/**
	 * 获取待类型名称
	 */
	public TSiteType getTypeName(String id){
		BaseHibernateDAO bh = new BaseHibernateDAO();
		Session session = bh.getSession();
		Transaction tt = session.beginTransaction();
		TSiteType typeinfo = new TSiteType();
		try{
			Query query = session.createQuery("from TSiteType a where a.name_value=? ");
			query.setString(0,id);
			List list = query.list();
			typeinfo = (TSiteType)list.get(0);
			tt.commit();
		}catch(HibernateException e){
			e.printStackTrace();
			try{
				if(tt!=null){
					tt.rollback();
				}
			}catch(Exception ex){
				ex.printStackTrace();
			}
		}finally{
			session.close();
		}
		return typeinfo;
	}
	
	/**
	 * 修改类型
	 */
	public void doEdit(SiteTypeForm typeForm){
		Transaction tt = session.beginTransaction();
		try{
			Query query = session.createQuery("from TSiteType a where a.id=?");
			query.setString(0,typeForm.getId());
			TSiteType type = (TSiteType)query.list().get(0);
			type.setName(typeForm.getName());
			type.setName_value(typeForm.getName_value());
			type.setType_level(typeForm.getType_level());
			session.update(type);
			tt.commit();
		}catch(HibernateException e){
			e.printStackTrace();
			try{
				if(tt!=null){
					tt.rollback();
				}
			}catch(Exception ex){
				ex.printStackTrace();
			}
		}finally{
			session.flush();
			session.close();
		}
	}
	/**
	 * 删除类型
	 */
	public void doDelete(String id){
		Transaction tt = session.beginTransaction();
		try{
			Query query = session.createQuery("delete TSiteType a where a.id=? ");
			query.setString(0,id);
			query.executeUpdate();
			tt.commit();
		}catch(HibernateException e){
			e.printStackTrace();
			try{
				if(tt!=null){
					tt.rollback();
				}
			}catch(Exception ex){
				ex.printStackTrace();
			}
		}finally{
			session.flush();
			session.close();
		}
	}
}
