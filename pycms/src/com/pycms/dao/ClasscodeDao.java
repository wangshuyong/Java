package com.pycms.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.transform.Transformers;
import com.pycms.framework.DBQuery;
import com.pycms.framework.HibernateDaoBase;
import com.pycms.moble.Classcode;

public class ClasscodeDao  extends HibernateDaoBase {

	public List<Classcode> getClasscodeList() {
		HashMap<String,Object> params = new HashMap<String,Object>();
		new DBQuery("获取所有班级列表",this,params) {
			@Override
			public void execute(HibernateDaoBase dao, String moduleName,
					HashMap<String, Object> params, Session session) {
				List<Classcode> list = null;
				String hsql = "from Classcode order by Id";						 
				Query query = session.createQuery(hsql);	
				list = query.list();
				params.put("list", list);
			}
		};
		return (List<Classcode>) params.get("list");
	}
	
	
	public Classcode getClasscode(String strWhere){
		String hsql = "from Classcode "+"";
    	if(!strWhere.isEmpty())
    		hsql +=""+ strWhere;
	
    	HashMap<String,Object> params=new HashMap<String,Object>();
    	params.put("hsql", hsql);
    	new DBQuery("获取对应班级详情",this,params) {
			@Override
			public void execute(HibernateDaoBase dao, String moduleName,
					HashMap<String, Object> params, Session session) {
				String hsql = (String) params.get("hsql");
				List<Map> list = null;

				Query query = session.createQuery(hsql);
				list = query.list();
				int nCount =  list.size();
				Classcode classcode=(Classcode) list.get(0);
				params.put("classcode",classcode);
				params.put("c", nCount);
			}
		};
		return (Classcode) params.get("classcode");
	}
	
	public int getClasscodeTotal(String strWhere){
		String hsql = "from Classcode "+"";
    	if(!strWhere.isEmpty())
    		hsql +=""+ strWhere;
	
    	HashMap<String,Object> params=new HashMap<String,Object>();
    	params.put("hsql", hsql);
    	new DBQuery("获取班级总条数(条件查询)",this,params) {
			@Override
			public void execute(HibernateDaoBase dao, String moduleName,
					HashMap<String, Object> params, Session session) {
				String hsql = (String) params.get("hsql");
				List<Map> list = null;

				Query query = session.createQuery(hsql);
				list = query.list();
				int nCount =  list.size();
				Classcode Classcode=(Classcode) list.get(0);
				params.put("classcode",Classcode);
				params.put("c", nCount);
			}
		};
		return ((Integer) params.get("c")).intValue();
	}
	
	 public List<Map> geClasscodeListEx(Integer nPageNum, Integer nPageRecordSize, String strWhere) {
		 String hsql = "select * from Classcode";
			if(!strWhere.isEmpty())
				hsql += strWhere;
			hsql += " order by id";
			
	    	HashMap<String,Object> params=new HashMap<String,Object>();
	    	params.put("hsql", hsql);
	    	params.put("nPageNum", Integer.toString(nPageNum));
	    	params.put("nPageRecordSize", Integer.toString(nPageRecordSize));
			new DBQuery("获取班级列表(分页·条件查询)",this,params){

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
	 
	 public void saveClasscode(Classcode Classcode){
		 HashMap<String,Object> params=new HashMap<String,Object>();
		 params.put("classcode", Classcode);
		 new DBQuery("添加修改班级信息",this,params) {
			@Override
			public void execute(HibernateDaoBase dao, String moduleName,
					HashMap<String, Object> params, Session session) {
				Classcode Classcode = (Classcode) params.get("classcode");
				Integer schooId = Classcode.getId();
				boolean blEdit = false;
				if(schooId==null){
					blEdit = true;
				}
				if (blEdit == true)
				{
					session.update(Classcode);			
				}
				else
				{
					session.save(Classcode);	
				}		
				
				params.put("item", Classcode);
				session.flush();		
			}
		};
	 }
	 
	 
	 public void deleteClasscode(int id){
		 HashMap<String,Object> params=new HashMap<String,Object>();
		 params.put("id", id);
		 new DBQuery("删除班级信息",this,params) {
			
			@Override
			public void execute(HibernateDaoBase dao, String moduleName,
					HashMap<String, Object> params, Session session) {
				int id=(Integer) params.get("id");
				String strWhere = "where id="+id;
				Classcode classcode = getClasscode(strWhere);
				session.delete(classcode);
				session.flush();
				session.clear();
			}
		};
	 }
}
