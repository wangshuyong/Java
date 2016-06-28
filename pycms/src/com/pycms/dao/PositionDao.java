package com.pycms.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;

import com.pycms.framework.DBQuery;
import com.pycms.framework.HibernateDaoBase;
import com.pycms.moble.Position;
import com.pycms.moble.School;

public class PositionDao  extends HibernateDaoBase {

	/**
	 * 获取省信息
	 * @param strWhere
	 * @return
	 */
	public List<Position> getProvinceName(){
		String hsql = "select province_name from position group by province_name";
	
    	HashMap<String,Object> params=new HashMap<String,Object>();
    	params.put("hsql", hsql);
    	new DBQuery("获取省信息",this,params) {
			@Override
			public void execute(HibernateDaoBase dao, String moduleName,
					HashMap<String, Object> params, Session session) {
				String hsql = (String) params.get("hsql");
				List<School> list = null;
				Query query = session.createQuery(hsql);
				list = query.list();
				params.put("list", list);
			}
		};
		return (List<Position>) params.get("list");
	}
	
	
	/**
	 * 获取省对应市信息
	 * @param strWhere
	 * @return
	 */
	public List<Position> getCityName(String province){
		String hsql = "select city_name from position where province_name='"+province+"' group by city_name";
	
    	HashMap<String,Object> params=new HashMap<String,Object>();
    	params.put("hsql", hsql);
    	new DBQuery("获取省对应市信息",this,params) {
			@Override
			public void execute(HibernateDaoBase dao, String moduleName,
					HashMap<String, Object> params, Session session) {
				String hsql = (String) params.get("hsql");
				List<School> list = null;
				Query query = session.createQuery(hsql);
				list = query.list();
				params.put("list", list);
			}
		};
		return (List<Position>) params.get("list");
	}
	
	/**
	 * 获取市对应区信息
	 * @param strWhere
	 * @return
	 */
	public List<Position> getCountyName(String city){
		String hsql = "select county_name from position where city_name='"+city+"' group by county_name;";
	
    	HashMap<String,Object> params=new HashMap<String,Object>();
    	params.put("hsql", hsql);
    	new DBQuery("获取市对应区信息",this,params) {
			@Override
			public void execute(HibernateDaoBase dao, String moduleName,
					HashMap<String, Object> params, Session session) {
				String hsql = (String) params.get("hsql");
				List<School> list = null;
				Query query = session.createQuery(hsql);
				list = query.list();
				params.put("list", list);
			}
		};
		return (List<Position>) params.get("list");
	}
	
	public Position getPosition(String strWhere){
		String hsql = "from Position "+"";
    	if(!strWhere.isEmpty())
    		hsql +=""+ strWhere;
	
    	HashMap<String,Object> params=new HashMap<String,Object>();
    	params.put("hsql", hsql);
    	new DBQuery("获取地区详情",this,params) {
			@Override
			public void execute(HibernateDaoBase dao, String moduleName,
					HashMap<String, Object> params, Session session) {
				String hsql = (String) params.get("hsql");
				List<Map> list = null;

				Query query = session.createQuery(hsql);
				list = query.list();
				int nCount =  list.size();
				Position position=(Position) list.get(0);
				params.put("position",position);
				params.put("c", nCount);
			}
		};
		return (Position) params.get("position");
	}
	
	 public void deletePosition(int id){
		 HashMap<String,Object> params=new HashMap<String,Object>();
		 params.put("id", id);
		 new DBQuery("删除删除信息",this,params) {
			
			@Override
			public void execute(HibernateDaoBase dao, String moduleName,
					HashMap<String, Object> params, Session session) {
				int id=(Integer) params.get("id");
				String strWhere = "where id="+id;
				Position position = getPosition(strWhere);
				session.delete(position);
				session.flush();
				session.clear();
			}
		};
	 }
	 
	 public void savePosition(Position position){
		 HashMap<String,Object> params=new HashMap<String,Object>();
		 params.put("position", position);
		 new DBQuery("添加修改学校信息",this,params) {
			@Override
			public void execute(HibernateDaoBase dao, String moduleName,
					HashMap<String, Object> params, Session session) {
				Position position = (Position) params.get("position");
				Integer id = position.getId();
				boolean blEdit = false;
				if(id==null){
					blEdit = true;
				}
				if (blEdit == true)
				{
					session.update(position);			
				}
				else
				{
					session.save(position);	
				}		
				
				params.put("item", position);
				session.flush();		
			}
		};
	 }
	 
	
}
