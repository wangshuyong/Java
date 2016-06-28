package com.pycms.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.transform.Transformers;

import com.pycms.framework.DBQuery;
import com.pycms.framework.HibernateDaoBase;
import com.pycms.moble.Parents;

public class ParentsDao extends HibernateDaoBase {

	public List<Parents> getParentsList() {
		HashMap<String,Object> params = new HashMap<String,Object>();
		new DBQuery("获取所有家长列表",this,params) {
			@Override
			public void execute(HibernateDaoBase dao, String moduleName,
					HashMap<String, Object> params, Session session) {
				List<Parents> list = null;
				String hsql = "from Parents order by Id";						 
				Query query = session.createQuery(hsql);	
				list = query.list();
				params.put("list", list);
			}
		};
		return (List<Parents>) params.get("list");
	}
	
	
	public Parents getParents(String strWhere){
		String hsql = "from Parents "+"";
    	if(!strWhere.isEmpty())
    		hsql +=""+ strWhere;
	
    	HashMap<String,Object> params=new HashMap<String,Object>();
    	params.put("hsql", hsql);
    	new DBQuery("获取对应家长详情",this,params) {
			@Override
			public void execute(HibernateDaoBase dao, String moduleName,
					HashMap<String, Object> params, Session session) {
				String hsql = (String) params.get("hsql");
				List<Map> list = null;

				Query query = session.createQuery(hsql);
				list = query.list();
				int nCount =  list.size();
				Parents parents=(Parents) list.get(0);
				params.put("parents",parents);
				params.put("c", nCount);
			}
		};
		return (Parents) params.get("parents");
	}
	
	public int getParentsTotal(String strWhere){
		String hsql = "from Parents "+"";
    	if(!strWhere.isEmpty())
    		hsql +=""+ strWhere;
	
    	HashMap<String,Object> params=new HashMap<String,Object>();
    	params.put("hsql", hsql);
    	new DBQuery("获取家长总条数(条件查询)",this,params) {
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
	
	 public List<Map> geParentsListEx(Integer nPageNum, Integer nPageRecordSize, String strWhere) {
		 String hsql = "select * from Parents";
			if(!strWhere.isEmpty())
				hsql += strWhere;
			hsql += " order by id";
			
	    	HashMap<String,Object> params=new HashMap<String,Object>();
	    	params.put("hsql", hsql);
	    	params.put("nPageNum", Integer.toString(nPageNum));
	    	params.put("nPageRecordSize", Integer.toString(nPageRecordSize));
			new DBQuery("获取家长列表(分页·条件查询)",this,params){

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
	 
	 public void saveParents(Parents parents){
		 HashMap<String,Object> params=new HashMap<String,Object>();
		 params.put("parents", parents);
		 new DBQuery("添加修改家长信息",this,params) {
			@Override
			public void execute(HibernateDaoBase dao, String moduleName,
					HashMap<String, Object> params, Session session) {
				Parents parents = (Parents) params.get("parents");
				Integer schooId = parents.getId();
				boolean blEdit = false;
				if(schooId==null){
					blEdit = true;
				}
				if (blEdit == true)
				{
					session.update(parents);			
				}
				else
				{
					session.save(parents);	
				}		
				
				params.put("item", parents);
				session.flush();		
			}
		};
	 }
	 
	 
	 public void deleteParents(int id){
		 HashMap<String,Object> params=new HashMap<String,Object>();
		 params.put("id", id);
		 new DBQuery("删除家长信息",this,params) {
			
			@Override
			public void execute(HibernateDaoBase dao, String moduleName,
					HashMap<String, Object> params, Session session) {
				int id=(Integer) params.get("id");
				String strWhere = "where id="+id;
				Parents parents = getParents(strWhere);
				session.delete(parents);
				session.flush();
				session.clear();
			}
		};
	 }
}
