package com.pycms.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.transform.Transformers;

import com.pycms.framework.DBQuery;
import com.pycms.framework.HibernateDaoBase;
import com.pycms.moble.Teacher;

public class TeacherDao extends HibernateDaoBase {

	public List<Teacher> getTeacherList() {
		HashMap<String,Object> params = new HashMap<String,Object>();
		new DBQuery("获取所有老师列表",this,params) {
			@Override
			public void execute(HibernateDaoBase dao, String moduleName,
					HashMap<String, Object> params, Session session) {
				List<Teacher> list = null;
				String hsql = "from Teacher order by Id";						 
				Query query = session.createQuery(hsql);	
				list = query.list();
				params.put("list", list);
			}
		};
		return (List<Teacher>) params.get("list");
	}
	
	
	public Teacher getTeacher(String strWhere){
		String hsql = "from Teacher "+"";
    	if(!strWhere.isEmpty())
    		hsql +=""+ strWhere;
	
    	HashMap<String,Object> params=new HashMap<String,Object>();
    	params.put("hsql", hsql);
    	new DBQuery("获取对应老师详情",this,params) {
			@Override
			public void execute(HibernateDaoBase dao, String moduleName,
					HashMap<String, Object> params, Session session) {
				String hsql = (String) params.get("hsql");
				List<Map> list = null;

				Query query = session.createQuery(hsql);
				list = query.list();
				int nCount =  list.size();
				Teacher teacher=(Teacher) list.get(0);
				params.put("teacher",teacher);
				params.put("c", nCount);
			}
		};
		return (Teacher) params.get("teacher");
	}
	
	public int getTeacherTotal(String strWhere){
		String hsql = "from Teacher "+"";
    	if(!strWhere.isEmpty())
    		hsql +=""+ strWhere;
	
    	HashMap<String,Object> params=new HashMap<String,Object>();
    	params.put("hsql", hsql);
    	new DBQuery("获取老师总条数(条件查询)",this,params) {
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
	
	 public List<Map> geTeacherListEx(Integer nPageNum, Integer nPageRecordSize, String strWhere) {
		 String hsql = "select * from Teacher";
			if(!strWhere.isEmpty())
				hsql += strWhere;
			hsql += " order by id";
			
	    	HashMap<String,Object> params=new HashMap<String,Object>();
	    	params.put("hsql", hsql);
	    	params.put("nPageNum", Integer.toString(nPageNum));
	    	params.put("nPageRecordSize", Integer.toString(nPageRecordSize));
			new DBQuery("获取老师列表(分页·条件查询)",this,params){

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
	 
	 public void saveTeacher(Teacher teacher){
		 HashMap<String,Object> params=new HashMap<String,Object>();
		 params.put("teacher", teacher);
		 new DBQuery("添加修改老师信息",this,params) {
			@Override
			public void execute(HibernateDaoBase dao, String moduleName,
					HashMap<String, Object> params, Session session) {
				Teacher teacher = (Teacher) params.get("teacher");
				Integer schooId = teacher.getId();
				boolean blEdit = false;
				if(schooId==null){
					blEdit = true;
				}
				if (blEdit == true)
				{
					session.update(teacher);			
				}
				else
				{
					session.save(teacher);	
				}		
				
				params.put("item", teacher);
				session.flush();		
			}
		};
	 }
	 
	 
	 public void deleteTeacher(int id){
		 HashMap<String,Object> params=new HashMap<String,Object>();
		 params.put("id", id);
		 new DBQuery("删除老师信息",this,params) {
			
			@Override
			public void execute(HibernateDaoBase dao, String moduleName,
					HashMap<String, Object> params, Session session) {
				int id=(Integer) params.get("id");
				String strWhere = "where id="+id;
				Teacher teacher = getTeacher(strWhere);
				session.delete(teacher);
				session.flush();
				session.clear();
			}
		};
	 }
}
