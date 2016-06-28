package com.pycms.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;

import com.pycms.framework.DBQuery;
import com.pycms.framework.HibernateDaoBase;
import com.pycms.moble.Grade;


public class GradeDao  extends HibernateDaoBase {

	/**
	 * 获取省信息
	 * @param strWhere
	 * @return
	 */
	public List<Grade> getSchoolType(){
		String hsql = "select school_type from Grade group by school_type";
	
    	HashMap<String,Object> params=new HashMap<String,Object>();
    	params.put("hsql", hsql);
    	new DBQuery("获取类别信息",this,params) {
			@Override
			public void execute(HibernateDaoBase dao, String moduleName,
					HashMap<String, Object> params, Session session) {
				String hsql = (String) params.get("hsql");
				List<Grade> list = null;
				Query query = session.createQuery(hsql);
				list = query.list();
				params.put("list", list);
			}
		};
		return (List<Grade>) params.get("list");
	}
	
	
	/**
	 * 获取省对应市信息
	 * @param strWhere
	 * @return
	 */
	public List<Grade> getGradeName(String type){
		String hsql = "select name from position where school_type='"+type+"' group by name";
	
    	HashMap<String,Object> params=new HashMap<String,Object>();
    	params.put("hsql", hsql);
    	new DBQuery("获取类别对应年级信息",this,params) {
			@Override
			public void execute(HibernateDaoBase dao, String moduleName,
					HashMap<String, Object> params, Session session) {
				String hsql = (String) params.get("hsql");
				List<Grade> list = null;
				Query query = session.createQuery(hsql);
				list = query.list();
				params.put("list", list);
			}
		};
		return (List<Grade>) params.get("list");
	}
	
	
	
	public Grade getGrade(String strWhere){
		String hsql = "from Grade "+"";
    	if(!strWhere.isEmpty())
    		hsql +=""+ strWhere;
	
    	HashMap<String,Object> params=new HashMap<String,Object>();
    	params.put("hsql", hsql);
    	new DBQuery("获取年级详情",this,params) {
			@Override
			public void execute(HibernateDaoBase dao, String moduleName,
					HashMap<String, Object> params, Session session) {
				String hsql = (String) params.get("hsql");
				List<Map> list = null;

				Query query = session.createQuery(hsql);
				list = query.list();
				int nCount =  list.size();
				Grade grade=(Grade) list.get(0);
				params.put("grade",grade);
				params.put("c", nCount);
			}
		};
		return (Grade) params.get("grade");
	}
	
	 public void deleteGrade(int id){
		 HashMap<String,Object> params=new HashMap<String,Object>();
		 params.put("id", id);
		 new DBQuery("删除年级信息",this,params) {
			
			@Override
			public void execute(HibernateDaoBase dao, String moduleName,
					HashMap<String, Object> params, Session session) {
				int id=(Integer) params.get("id");
				String strWhere = "where id="+id;
				Grade position = getGrade(strWhere);
				session.delete(position);
				session.flush();
				session.clear();
			}
		};
	 }
	 
	 public void savePosition(Grade grade){
		 HashMap<String,Object> params=new HashMap<String,Object>();
		 params.put("grade", grade);
		 new DBQuery("添加修改年级信息",this,params) {
			@Override
			public void execute(HibernateDaoBase dao, String moduleName,
					HashMap<String, Object> params, Session session) {
				Grade grade = (Grade) params.get("grade");
				Integer id = grade.getId();
				boolean blEdit = false;
				if(id==null){
					blEdit = true;
				}
				if (blEdit == true)
				{
					session.update(grade);			
				}
				else
				{
					session.save(grade);	
				}		
				
				params.put("item", grade);
				session.flush();		
			}
		};
	 }
	 
	
}