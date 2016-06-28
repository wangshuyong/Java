package com.server;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import config.HibernateSessionFactory;
/**
 * 
 * @author bluedreams66
 *
 */

public class BaseHibernateDAO{
	
	public Session getSession(){
		//得到工厂
		//SessionFactory sf = new Configuration().configure().buildSessionFactory();
		//获取session
		//Session session = sf.openSession();
		
		Session session = HibernateSessionFactory.getSession();
		return session;	 
	}
}
