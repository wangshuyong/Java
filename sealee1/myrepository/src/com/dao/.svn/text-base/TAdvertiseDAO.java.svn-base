package com.dao;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.model.TAdminUser;
import com.model.TAdvertise;
import com.model.TSiteInformation;
import com.server.BaseHibernateDAO;
import com.web.form.AdvertiseForm;

public class TAdvertiseDAO {
	/**
	 * 
	 */
	BaseHibernateDAO bh = new BaseHibernateDAO();
	Session session = bh.getSession();
	
	/**
	 * 新增
	 * @param infoForm
	 */
	public void doNew(AdvertiseForm infoForm){
		Transaction tt = session.beginTransaction();
		try{
			java.util.UUID tempId = UUID.randomUUID();
			String id = tempId.toString();
			Date dt = new Date();
			TAdvertise info = new TAdvertise();
			info.setId(id);
			info.setAdv_type(infoForm.getAdv_type());
			info.setAdv_title(infoForm.getAdv_title());
			info.setAdv_link(infoForm.getAdv_link());
			info.setLink_color(infoForm.getLink_color());
			info.setAdv_image(infoForm.getImage());
			info.setImage_height(infoForm.getImage_height());
			info.setImage_width(infoForm.getImage_width());
			info.setAdd_date(dt);
			info.setTake_effect_date(infoForm.getTake_effect_date());
			info.setIneffective_date(infoForm.getIneffective_date());
			info.setAuditing(0);
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
	 * 删除
	 * @param id
	 */
	public void doDelete(String id){
		Transaction tt = session.beginTransaction();
		try{
			Query query = session.createQuery("delete TAdvertise a where a.id=? ");
			query.setString(0,id);
			query.executeUpdate();
			tt.commit();
		}catch(HibernateException e){
			e.printStackTrace();
		}finally{
			session.close();
		}
	}
	
	/**
	 * 编辑
	 * @param infoForm
	 */
	public void doEdit(AdvertiseForm infoForm ){
		Transaction tt = session.beginTransaction();
		try{
			Query query = session.createQuery("from TAdvertise a where a.id=?");
			query.setString(0,infoForm.getId());
			TAdvertise info = (TAdvertise)query.list().get(0);
			info.setAdv_type(infoForm.getAdv_type());
			info.setAdv_title(infoForm.getAdv_title());
			info.setAdv_link(infoForm.getAdv_link());
			info.setLink_color(infoForm.getLink_color());
			info.setAdv_image(infoForm.getImage());
			info.setImage_height(infoForm.getImage_height());
			info.setImage_width(infoForm.getImage_width());
			info.setTake_effect_date(infoForm.getTake_effect_date());
			info.setIneffective_date(infoForm.getIneffective_date());
			info.setAuditing(0);
			session.update(info);
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
	 * 获取待编辑数据信息
	 * @param id
	 * @return
	 */
	public TAdvertise getInfo(String id){
		Transaction tt = session.beginTransaction();
		TAdvertise info = new TAdvertise();
		try{
			Query query = session.createQuery("from TAdvertise a where a.id=? ");
			query.setString(0,id);
			List list = query.list();
			info = (TAdvertise)list.get(0);
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
}
