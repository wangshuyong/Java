package com.pycms.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.transform.Transformers;
import com.pycms.framework.DBQuery;
import com.pycms.framework.HibernateDaoBase;
import com.pycms.moble.School;

public class SchoolDao extends HibernateDaoBase {

	public List<School> getSchoolList() {
		HashMap<String,Object> params = new HashMap<String,Object>();
		new DBQuery("获取所有学校列表",this,params) {
			@Override
			public void execute(HibernateDaoBase dao, String moduleName,
					HashMap<String, Object> params, Session session) {
				List<School> list = null;
				String hsql = "from School order by Id";						 
				Query query = session.createQuery(hsql);	
				list = query.list();
				params.put("list", list);
			}
		};
		return (List<School>) params.get("list");
	}
	
	
	public School getSchool(String strWhere){
		String hsql = "from School "+"";
    	if(!strWhere.isEmpty())
    		hsql +=""+ strWhere;
	
    	HashMap<String,Object> params=new HashMap<String,Object>();
    	params.put("hsql", hsql);
    	new DBQuery("获取对应学校详情",this,params) {
			@Override
			public void execute(HibernateDaoBase dao, String moduleName,
					HashMap<String, Object> params, Session session) {
				String hsql = (String) params.get("hsql");
				List<Map> list = null;

				Query query = session.createQuery(hsql);
				list = query.list();
				int nCount =  list.size();
				School school=(School) list.get(0);
				params.put("school",school);
				params.put("c", nCount);
			}
		};
		return (School) params.get("school");
	}
	
	public int getSchoolTotal(String strWhere){
		String hsql = "from School "+"";
    	if(!strWhere.isEmpty())
    		hsql +=""+ strWhere;
	
    	HashMap<String,Object> params=new HashMap<String,Object>();
    	params.put("hsql", hsql);
    	new DBQuery("获取学校总条数(条件查询)",this,params) {
			@Override
			public void execute(HibernateDaoBase dao, String moduleName,
					HashMap<String, Object> params, Session session) {
				String hsql = (String) params.get("hsql");
				List<Map> list = null;

				Query query = session.createQuery(hsql);
				list = query.list();
				int nCount =  list.size();
				School school=(School) list.get(0);
				params.put("school",school);
				params.put("c", nCount);
			}
		};
		return ((Integer) params.get("c")).intValue();
	}
	
	 public List<Map> geSchoolListEx(Integer nPageNum, Integer nPageRecordSize, String strWhere) {
		 String hsql = "select * from School";
			if(!strWhere.isEmpty())
				hsql += strWhere;
			hsql += " order by id";
			
	    	HashMap<String,Object> params=new HashMap<String,Object>();
	    	params.put("hsql", hsql);
	    	params.put("nPageNum", Integer.toString(nPageNum));
	    	params.put("nPageRecordSize", Integer.toString(nPageRecordSize));
			new DBQuery("获取学校列表(分页·条件查询)",this,params){

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
	 
	 public void saveSchool(School school){
		 HashMap<String,Object> params=new HashMap<String,Object>();
		 params.put("school", school);
		 new DBQuery("添加修改学校信息",this,params) {
			@Override
			public void execute(HibernateDaoBase dao, String moduleName,
					HashMap<String, Object> params, Session session) {
				School school = (School) params.get("school");
				Integer schooId = school.getId();
				boolean blEdit = false;
				if(schooId==null){
					blEdit = true;
				}
				if (blEdit == true)
				{
					session.update(school);			
				}
				else
				{
					session.save(school);	
				}		
				
				params.put("item", school);
				session.flush();		
			}
		};
	 }
	 
	 
	 public void deleteSchool(int id){
		 HashMap<String,Object> params=new HashMap<String,Object>();
		 params.put("id", id);
		 new DBQuery("删除学校信息",this,params) {
			
			@Override
			public void execute(HibernateDaoBase dao, String moduleName,
					HashMap<String, Object> params, Session session) {
				int schoolId=(Integer) params.get("id");
				String strWhere = "where id="+schoolId;
				School school = getSchool(strWhere);
				session.delete(school);
				session.flush();
				session.clear();
			}
		};
	 }
}
