package com.dao;

import java.util.Date;
import java.util.UUID;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;


import com.model.TInforReply;
import com.server.BaseHibernateDAO;
import com.web.form.InfoReplyForm;

public class TInfoReplyDAO {
	/**
	 * 
	 */
	BaseHibernateDAO bh = new BaseHibernateDAO();
	Session session = bh.getSession();
	
	/**
	 * Ìí¼Ó»Ø¸´
	 * @param replyForm
	 */
	public void doNew(InfoReplyForm replyForm){
		Transaction tt = session.beginTransaction();
		try{
			java.util.UUID tempId = UUID.randomUUID();
			String id = tempId.toString();
			Date dt = new Date();
			TInforReply reply = new TInforReply();
			reply.setId(id);
			reply.setInfor_id(replyForm.getInfor_id());
			reply.setReply_author(replyForm.getReply_author());
			reply.setReply_content(replyForm.getReply_content());
			reply.setReply_date(dt);
			reply.setReply_state(0);
			session.save(reply);
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
	 * É¾³ý
	 * @param id
	 */
	public void doDelete(String id){
		Transaction tt = session.beginTransaction();
		try{
			Query query = session.createQuery("delete TInforReply a where a.id=? ");
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
