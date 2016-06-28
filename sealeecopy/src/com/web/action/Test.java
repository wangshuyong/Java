package com.web.action;


/**
 * test hibernate 
 */
import java.sql.Date;
import java.sql.SQLException;

import org.hibernate.*;
import org.hibernate.cfg.Configuration;
import org.hibernate.Session;

import sun.security.provider.MD5;

import com.model.TSiteInformation;


public class Test {
	public static void main(String[] args){
		SessionFactory sf = new Configuration().configure().buildSessionFactory();
		Session session = sf.openSession();
		
		//StateInformation instance
		TSiteInformation sifm = new TSiteInformation();
		sifm.setId("20081126154355");
		sifm.setTitle("������Ϣ����----��");
		sifm.setSource("�����Ļ�����---");
		sifm.setSource_link("www.zshen.com---");
		sifm.setAuthor("bluedreams66--");
		sifm.setType("1");
		sifm.setContent("�������ݣ���������������--������");
		sifm.setShow("���ݼ�����ݼ�����ݼ��----��");
		sifm.setDate_created(new Date(0));
		sifm.setIs_show(1);
		sifm.setRemark("��ע��Ϣ��ע��Ϣ-------��������");
		MD5 md5 = new MD5();
		
		//save information
		session.save(sifm);
		//session.update(sifm);
		session.flush();
		
		try{
		    //�ύhibernate�Ự���ӵ�״̬
			session.connection().commit();
			
		   }catch(HibernateException e){
			   e.printStackTrace();
		   }catch(SQLException e){
			   e.printStackTrace();
		   }
		   session.close();
		}

	
}
