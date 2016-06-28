package com.pycms.framework;

import java.util.HashMap;

import org.hibernate.Session;


public abstract class DBQuery {

	private String moduleName = "";
	private HashMap<String,Object> params = null;
	
    public DBQuery(String moduleName,HibernateDaoBase dao,HashMap<String,Object> params)
    {
    	this.params=params;
    	init(moduleName,dao);
    }
    
    public DBQuery(String moduleName,HibernateDaoBase dao)
    {
    	this.params=null;
    	init(moduleName,dao);
    }
    
	public HashMap<String, Object> getParams() {
		return params;
	}
	
	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

	public void setParams(HashMap<String, Object> params) {
		this.params = params;
	}

	public String getModuleName() {
		return moduleName;
	}
   
    private void init(String moduleName,HibernateDaoBase dao) {
    	this.moduleName=moduleName;
    	synchronized(dao)
    	{
			    Session session = dao.getHibernateTemplate().getSessionFactory().openSession();			    
			    
			    try
			    {
			         execute(dao,moduleName, params,session);			
			     }
			     catch(Exception e)
			     {
			          if(!moduleName.equals(""))
			               System.out.print("DBQuery "+moduleName+": ");
			          System.out.println(e.toString());
			     }
			     finally
			     {
				     if(session!=null) 
				           session.close();      
				         //System.out.println("closesession.");
				     session=null;
			     }   
    	}		
	}

	public abstract void execute(HibernateDaoBase dao,String moduleName, HashMap<String,Object> params,Session session);    
}
