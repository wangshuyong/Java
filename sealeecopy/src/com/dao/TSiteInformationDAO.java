package com.dao;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.model.TSiteInformation;
import com.server.BaseHibernateDAO;
import com.web.form.SiteInformationForm;

public class TSiteInformationDAO {
	
	BaseHibernateDAO bh = new BaseHibernateDAO();
	Session session = bh.getSession();
	
	/**
	 * 新增
	 */
	public void doNew(SiteInformationForm infoForm){
		Transaction tt = session.beginTransaction();
		try{
			
			Date dt = new Date();
			TSiteInformation info = new TSiteInformation();
			info.setId(infoForm.getId());
			info.setTitle(infoForm.getTitle());
			info.setSource(infoForm.getSource());
			info.setSource_link(infoForm.getSource_link());
			info.setAuthor(infoForm.getAuthor());
			info.setType(infoForm.getType());
			info.setShow(infoForm.getShow());
			info.setContent(infoForm.getContent());
			info.setRemark(infoForm.getRemark());
			info.setDate_created(dt);
			info.setIs_show(infoForm.getIs_show());
			info.setClick_num(0);
			info.setReply_num(0);
			info.setNote_keyword(infoForm.getNote_keyword());
			info.setNote_description(infoForm.getNote_description());
			
			session.save(info);
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
	 * 获取待编辑信息
	 */
	public TSiteInformation getInfo(String id){
		BaseHibernateDAO bh = new BaseHibernateDAO();
		Session session = bh.getSession();
		Transaction tt = session.beginTransaction();
		TSiteInformation info = new TSiteInformation();
		try{
			Query query = session.createQuery("from TSiteInformation a where a.id=? ");
			query.setString(0,id);
			List list = query.list();
			if(list.size()!=0){
				info = (TSiteInformation)list.get(0);
			}
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
		return info;
	}
	
	/**
	 * 编辑信息
	 */
	public void doEdit(SiteInformationForm infoForm){
		Transaction tt = session.beginTransaction();
		try{
			Query query = session.createQuery("from TSiteInformation a where a.id=?");
			query.setString(0,infoForm.getId());
			TSiteInformation info = (TSiteInformation)query.list().get(0);
			
			info.setTitle(infoForm.getTitle());
			info.setSource(infoForm.getSource());
			info.setSource_link(infoForm.getSource_link());
			info.setAuthor(infoForm.getAuthor());
			info.setType(infoForm.getType());
			info.setShow(infoForm.getShow());
			info.setContent(infoForm.getContent());
			info.setIs_show(infoForm.getIs_show());
			info.setNote_keyword(infoForm.getNote_keyword());
			info.setNote_description(infoForm.getNote_description());
			session.update(info);
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
	 * 更新点击量
	 * @param infoForm
	 */
	public void doUpdateClickNum(String infoId){
		session = bh.getSession();
		Transaction tt = session.beginTransaction();
		try{
			Query query = session.createQuery("from TSiteInformation a where a.id=?");
			query.setString(0,infoId);
			TSiteInformation info = (TSiteInformation)query.list().get(0);
			info.setClick_num(info.getClick_num()+1);
			session.update(info);
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
	 * 更新回复量
	 * @param infoForm
	 */
	public void doUpdateReplyNum(String infoId){
		session = bh.getSession();
		Transaction tt = session.beginTransaction();
		try{
			Query query = session.createQuery("from TSiteInformation a where a.id=?");
			query.setString(0,infoId);
			TSiteInformation info = (TSiteInformation)query.list().get(0);
			info.setReply_num(info.getReply_num()+1);
			session.update(info);
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
	 * @审核
	 * @pramati infoId
	 */
	public void doView(String infoId){
		session = bh.getSession();
		Transaction tt = session.beginTransaction();
		try{
			Query query = session.createQuery("from TSiteInformation a where a.id=?");
			query.setString(0,infoId);
			TSiteInformation info = (TSiteInformation)query.list().get(0);
			info.setRemark("1");
			session.update(info);
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
	 * 取消审核
	 * @pramati infoId
	 *
	 */
	public void doNoView(String infoId){
		session = bh.getSession();
		Transaction tt = session.beginTransaction();
		try{
			Query query = session.createQuery("from TSiteInformation a where a.id=?");
			query.setString(0,infoId);
			TSiteInformation info = (TSiteInformation)query.list().get(0);
			info.setRemark(null);
			session.update(info);
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
	 * 删除信息
	 */
	public void doDelete(String id){
		Transaction tt = session.beginTransaction();
		try{
			Query query = session.createQuery("delete TSiteInformation a where a.id=? ");
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
