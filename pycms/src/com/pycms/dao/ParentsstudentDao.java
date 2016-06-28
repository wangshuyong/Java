package com.pycms.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.transform.Transformers;

import com.pycms.framework.DBQuery;
import com.pycms.framework.HibernateDaoBase;
import com.pycms.moble.Parentsstudent;

public class ParentsstudentDao extends HibernateDaoBase {

	public List<Parentsstudent> getParentsstudentList() {
		HashMap<String,Object> params = new HashMap<String,Object>();
		new DBQuery("获取所有老师任课列表",this,params) {
			@Override
			public void execute(HibernateDaoBase dao, String moduleName,
					HashMap<String, Object> params, Session session) {
				List<Parentsstudent> list = null;
				String hsql = "from Parentsstudent order by Id";						 
				Query query = session.createQuery(hsql);	
				list = query.list();
				params.put("list", list);
			}
		};
		return (List<Parentsstudent>) params.get("list");
	}
	
	
	public Parentsstudent getParentsstudent(String strWhere){
		String hsql = "from Parentsstudent "+"";
    	if(!strWhere.isEmpty())
    		hsql +=""+ strWhere;
	
    	HashMap<String,Object> params=new HashMap<String,Object>();
    	params.put("hsql", hsql);
    	new DBQuery("获取对应老师任课详情",this,params) {
			@Override
			public void execute(HibernateDaoBase dao, String moduleName,
					HashMap<String, Object> params, Session session) {
				String hsql = (String) params.get("hsql");
				List<Map> list = null;

				Query query = session.createQuery(hsql);
				list = query.list();
				int nCount =  list.size();
				Parentsstudent Parentsstudent=(Parentsstudent) list.get(0);
				params.put("Parentsstudent",Parentsstudent);
				params.put("c", nCount);
			}
		};
		return (Parentsstudent) params.get("Parentsstudent");
	}
	
	public int getParentsstudentTotal(String strWhere){
		String hsql = "from Parentsstudent "+"";
    	if(!strWhere.isEmpty())
    		hsql +=""+ strWhere;
	
    	HashMap<String,Object> params=new HashMap<String,Object>();
    	params.put("hsql", hsql);
    	new DBQuery("获取老师任课总条数(条件查询)",this,params) {
			@Override
			public void execute(HibernateDaoBase dao, String moduleName,
					HashMap<String, Object> params, Session session) {
				String hsql = (String) params.get("hsql");
				List<Map> list = null;

				Query query = session.createQuery(hsql);
				list = query.list();
				int nCount =  list.size();
				params.put("c", nCount);
			}
		};
		return ((Integer) params.get("c")).intValue();
	}
	
	 public List<Map> geParentsstudentListEx(Integer nPageNum, Integer nPageRecordSize, String strWhere) {
		 String hsql = "select * from Parentsstudent";
			if(!strWhere.isEmpty())
				hsql += strWhere;
			hsql += " order by id";
			
	    	HashMap<String,Object> params=new HashMap<String,Object>();
	    	params.put("hsql", hsql);
	    	params.put("nPageNum", Integer.toString(nPageNum));
	    	params.put("nPageRecordSize", Integer.toString(nPageRecordSize));
			new DBQuery("获取老师任课列表(分页·条件查询)",this,params){

				@Override
				public void execute(HibernateDaoBase dao, String moduleName,
						HashMap<String, Object> params, Session session) {
					// TODO Auto-generated method stub
					
					String hsql = (String) params.get("hsql");
					String sPageNum = (String) params.get("nPageNum");
					String sPageRecordSize = (String) params.get("nPageRecordSize");				
					Integer nPageNum = Integer.parseInt(sPageNum);
					Integer nPageRecordSize = Integer.parseInt(sPageRecordSize);
					
					List<Map> list = null;				
					Query query = session.createSQLQuery(hsql);
					query.setFirstResult((nPageNum.intValue()-1)*nPageRecordSize);
					query.setMaxResults(nPageRecordSize.intValue());
					list = query.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
					params.put("list", list);
				}};
				
			return (List<Map>)params.get("list");
	 }
	 
	 public void saveParentsstudent(Parentsstudent Parentsstudent){
		 HashMap<String,Object> params=new HashMap<String,Object>();
		 params.put("Parentsstudent", Parentsstudent);
		 new DBQuery("添加修改老师任课信息",this,params) {
			@Override
			public void execute(HibernateDaoBase dao, String moduleName,
					HashMap<String, Object> params, Session session) {
				Parentsstudent Parentsstudent = (Parentsstudent) params.get("Parentsstudent");
				Integer schooId = Parentsstudent.getId();
				boolean blEdit = false;
				if(schooId==null){
					blEdit = true;
				}
				if (blEdit == true)
				{
					session.update(Parentsstudent);			
				}
				else
				{
					session.save(Parentsstudent);	
				}		
				
				params.put("item", Parentsstudent);
				session.flush();		
			}
		};
	 }
	 
	 
	 public void deleteParentsstudent(int id){
		 HashMap<String,Object> params=new HashMap<String,Object>();
		 params.put("id", id);
		 new DBQuery("删除老师任课信息",this,params) {
			
			@Override
			public void execute(HibernateDaoBase dao, String moduleName,
					HashMap<String, Object> params, Session session) {
				int id=(Integer) params.get("id");
				String strWhere = "where id="+id;
				Parentsstudent Parentsstudent = getParentsstudent(strWhere);
				session.delete(Parentsstudent);
				session.flush();
				session.clear();
			}
		};
	 }
}

