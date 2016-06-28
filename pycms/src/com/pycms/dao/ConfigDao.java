package com.pycms.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.annotations.Where;
import org.hibernate.transform.Transformers;

import com.pycms.framework.DBQuery;
import com.pycms.framework.HibernateDaoBase;
import com.pycms.moble.Information;
import com.pycms.moble.Teacher;
import com.sun.accessibility.internal.resources.accessibility;

public class ConfigDao extends HibernateDaoBase {

	public List<Map> getTableList(String table) {
		HashMap<String,Object> params = new HashMap<String,Object>();
		String hsql = "from "+table+" order by Id";	
		params.put("hsql", hsql);
		new DBQuery("获取所有资讯列表",this,params) {
			@Override
			public void execute(HibernateDaoBase dao, String moduleName,
					HashMap<String, Object> params, Session session) {
				String hsql =(String) params.get("hsql");
				List<Map> list = null;		 
				Query query = session.createQuery(hsql);	
				list = query.list();
				params.put("list", list);
			}
		};
		return (List<Map>) params.get("list");
	}
	
//	public  List<Map> getTableBody(String type ,String status,String title,String createtime,String changetime  ){
//		String hsql = " select * from (select type as type, title as title, subject_id as subject_id, count as count, participantCount As participantCount , author as author , createtime AS createtime, changetime as changetime, is_top as is_top  from information  union all select type as type, title as title, subject_id as subject_id, count as count, participantCount As participantCount , status as author , createtime AS createtime, changetime as changetime, is_top as is_top from work ) a  ";
////		WHERE A.类型 like '%"+type+"%' and A.标题 LIKE '%"+title+"%' AND A.发起人 like '%"+status+"%' and a.发送时间 >='"+createtime+"' and a.结束时间 <= '"+changetime+"' order by a.置頂 DESC , a.发送时间  DESC ";
//		
//		if(!type.isEmpty()){
//			hsql += "where a.type like '%"+type+"%'"; 
//		}else{
//			hsql += "where a.type like '%%'"; 
//		}
//		
//		if(!status.isEmpty()){
//			hsql += "and a.status like '%"+status+"%'"; 
//		}
//		if(!title.isEmpty()){
//			hsql += "and a.title like '%"+title+"%'"; 
//		}
//		if(!createtime.isEmpty()){
//			hsql += "and a.createtime >='"+createtime+"'"; 
//		}if(!changetime.isEmpty()){
//			hsql += "and a.changetime <='"+changetime+"'"; 
//		}
//		
//		hsql+=" order by a.is_top   DESC , a.createtime  DESC";
//		
//		Session session = this.getHibernateTemplate().getSessionFactory().openSession();
//		 List list = null;
////		String hsql = "from HostInfo order by hostId";						 
//		Query query = session.createSQLQuery(hsql);
//		list = query.list();
//		
////		List<Map<String, String>> listMap = new ArrayList<Map<String,String>>();
////		Map<String, String> maps = new HashMap<String, String>();
//		 for(int i = 0; i < list.size(); i++) {
//			 Object object = list.get(i);
//			 System.out.println(list.get(i));
////			 Map map =  (Map)list.get(i);
////			 Set set = map.keySet();
////			 Iterator it = set.iterator();
////			 while(it.hasNext()) {
////				 System.out.println(map.get(it.next()));
////				 
////				 }
//			 }
//		
//		session.close();	
//		return list;
		
// 		HashMap<String,Object> params=new HashMap<String,Object>();
//    	params.put("hsql", hsql);
//    	new DBQuery("获取对应资讯详情",this,params) {
//			@Override
//			public void execute(HibernateDaoBase dao, String moduleName,
//					HashMap<String, Object> params, Session session) {
//				String hsql = (String) params.get("hsql");
//				List<Map> list = null;
//
//				Query query = session.createQuery(hsql);
//				list = query.list();
//				params.put("list", list);
//			}
//		};
//		return (List<Map>) params.get("list");
//	}
	
	
	public List<Object> getTable(String table,String strWhere){
		String hsql = "from "+table+" ";
    	if(!strWhere.isEmpty())
    		hsql +=""+ strWhere;
	
    	HashMap<String,Object> params=new HashMap<String,Object>();
    	params.put("hsql", hsql);
    	new DBQuery("获取对应资讯详情",this,params) {
			@Override
			public void execute(HibernateDaoBase dao, String moduleName,
					HashMap<String, Object> params, Session session) {
				String hsql = (String) params.get("hsql");
				List<Object> list = null;

				Query query = session.createQuery(hsql);
				list = query.list();
				int nCount =  list.size();
				Object object=(Object) list.get(0);
				params.put("list",list);
				params.put("c", nCount);
			}
		};
		return (List<Object>) params.get("list");
	}
	/**
	 * 分页
	 * @param table
	 * @param strWhere
	 * @return
	 */
	public List<Object> getTableInformation(String table,String strWhere,Integer nPageNum, Integer nPageRecordSize){
		String hsql = "select * from "+table+" ";
    	if(!strWhere.isEmpty())
    		hsql +=""+ strWhere;
	
    	HashMap<String,Object> params=new HashMap<String,Object>();
    	params.put("hsql", hsql);
    	params.put("nPageNum", Integer.toString(nPageNum));
    	params.put("nPageRecordSize", Integer.toString(nPageRecordSize));
    	
    	new DBQuery("获取对应资讯详情",this,params) {
			@Override
			public void execute(HibernateDaoBase dao, String moduleName,
					HashMap<String, Object> params, Session session) {
				String hsql = (String) params.get("hsql");
				String sPageNum = (String) params.get("nPageNum");
				String sPageRecordSize = (String) params.get("nPageRecordSize");	
				Integer nPageNum = Integer.parseInt(sPageNum);
				Integer nPageRecordSize = Integer.parseInt(sPageRecordSize);
				
				List<Object> list = null;
				Query query = session.createSQLQuery(hsql);
				query.setFirstResult((nPageNum.intValue()-1)*nPageRecordSize);
				query.setMaxResults(nPageRecordSize.intValue());
				list = query.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
				params.put("list", list);
			}
		};
		return (List<Object>) params.get("list");
	}
	
	public int getTableTotal(String table,String strWhere){
		String hsql = "from  "+table+" ";
    	if(!strWhere.isEmpty())
    		hsql +=" "+ strWhere;
	
    	HashMap<String,Object> params=new HashMap<String,Object>();
    	params.put("hsql", hsql);
    	new DBQuery("获取资讯总条数(条件查询)",this,params) {
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
	
	 public List<Map> getTalbeListEx(String table,Integer nPageNum, Integer nPageRecordSize, String strWhere) {
		 String hsql = "select * from "+table+" ";
			if(!strWhere.isEmpty())
				hsql += strWhere;
			hsql += " order by id";
			
	    	HashMap<String,Object> params=new HashMap<String,Object>();
	    	params.put("hsql", hsql);
	    	params.put("nPageNum", Integer.toString(nPageNum));
	    	params.put("nPageRecordSize", Integer.toString(nPageRecordSize));
			new DBQuery("获取资讯列表(分页·条件查询)",this,params){

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
	 
	
	 
	 
	 public void deleteInformation(String table,int id){
		 HashMap<String,Object> params=new HashMap<String,Object>();
		 params.put("id", id);
		 params.put("table", table);
		 new DBQuery("删除资讯信息",this,params) {
			
			@Override
			public void execute(HibernateDaoBase dao, String moduleName,
					HashMap<String, Object> params, Session session) {
				int id=(Integer) params.get("id");
				String table = (String) params.get("table");
				String strWhere = "where id="+id;
				List<Object> object = getTable(table,strWhere);
				session.delete(object.get(0));
				session.flush();
				session.clear();
			}
		};
	 }
	 
	 
	 
	 public void saveInformation(Information information){
		 HashMap<String,Object> params=new HashMap<String,Object>();
		 params.put("information", information);
		 
		 new DBQuery("添加修改老师信息",this,params) {
			@Override
			public void execute(HibernateDaoBase dao, String moduleName,
					HashMap<String, Object> params, Session session) {
				Information information = (Information) params.get("information");
				
				int schooId = information.getId();
				boolean blEdit = false;
				if(schooId!=0){
					blEdit = true;
				}
				if (blEdit == true)
				{
					session.update(information);			
				}
				else
				{
					session.save(information);	
				}		
				
				params.put("item", information);
				session.flush();		
			}
		};
	 }
	 
	 
	 
}
