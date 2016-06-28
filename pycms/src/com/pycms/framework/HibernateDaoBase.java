package com.pycms.framework;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import java.io.Serializable;
import org.springframework.orm.ObjectRetrievalFailureException;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import org.apache.commons.logging.LogFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import java.sql.SQLException;
//import org.apache.commons.lang.StringUtils;

@SuppressWarnings("unchecked")
/**  
 * 实现单表的查询  
 * @param paraNames 列名对应的pojo类属性名  
 * @param paraValues 列名对应的值  
 * @param pojoName hibernate映射类名  
 * @return  
 */  
public class HibernateDaoBase extends HibernateDaoSupport{
    protected final Log log = LogFactory.getLog(getClass());
    public List findByParametersAndPojoName(String[] paraNames,Object[] paraValues,String pojoName){       
    	StringBuffer hql = new StringBuffer();   
        //log.debug(Arrays.asList(paraNames));   
        //log.debug(Arrays.asList(paraValues));   
        hql.append(" from "+pojoName+" where ");   
        for(int i=0;i<paraNames.length;i++){   
            hql.append(paraNames[i]+" = :"+paraNames[i]);   
            if((i<paraNames.length-1)&&(paraNames.length>1)) 
            	hql.append(" and ");   
        }  
        //log.debug("hql=========="+hql.toString());   
    	Session session=this.getHibernateTemplate().getSessionFactory() .openSession();   
    	Query query = session.createQuery(hql.toString());   
        for(int i=0;i<paraNames.length;i++){   
            query.setParameter(paraNames[i], paraValues[i]);   
        }   
        List list = query.list();   
        //log.debug("list.size()===="+list.size());
        session.close();
        return list;   
    }
        
	/**
	 * 设置查询参数
	 * 
	 * @param query org.hibernate.Query 实例
	 * @param pojo 传值对象
	 * @param attributeList 对象属性名列表
	 */
	protected void setQueryParameter(Query query, Object pojo, List attributeList) {
		if (attributeList != null && attributeList.size() > 0 && query != null
				&& pojo != null) {
			for (Iterator iter = attributeList.iterator(); iter.hasNext();) {
				String attrName = (String) iter.next();
				try {
					Object valueObj = PropertyUtils.getProperty(pojo, attrName);
					
					if(valueObj==null)
						continue;
					if (valueObj instanceof Date) {

						query.setDate(attrName, (Date) valueObj);
					} else if (valueObj instanceof Integer) {
						query.setInteger(attrName, (Integer) valueObj);
					} else if (valueObj instanceof java.lang.Long) {
						query.setLong(attrName, (java.lang.Long)valueObj);
					}else if (valueObj instanceof Enum) { 
						query.setParameter(attrName, java.lang.Enum.valueOf(PropertyUtils.getPropertyType(pojo, attrName), ((Enum) valueObj).name()));
					} else {
						query.setString(attrName, (String) valueObj);
					}
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	}
	
 
	/**
	 * 设置查询参数
	 * 
	 * @param query org.hibernate.SQLQuery 实例
	 * @param pojo 传值对象
	 * @param attributeList 对象属性名列表
	 */
	protected void setSQLQueryParameter(SQLQuery query, Object pojo, List attributeList) {
		if (attributeList != null && attributeList.size() > 0 && query != null
				&& pojo != null) {
			for (Iterator iter = attributeList.iterator(); iter.hasNext();) {
				String attrName = (String) iter.next();
				try {
					Object valueObj = PropertyUtils.getProperty(pojo, attrName);
					if(valueObj==null)
						continue;
					if (valueObj instanceof Date) {

						query.setDate(attrName, (Date) valueObj);
					} else if (valueObj instanceof Integer) {
						query.setInteger(attrName, (Integer) valueObj);
						 
					}else if (valueObj instanceof java.lang.Long) {
						query.setLong(attrName, (java.lang.Long)valueObj);
					}else if (valueObj instanceof byte[]) {
						query.setBinary(attrName, (byte[]) valueObj);
					} else if (valueObj instanceof Enum) {
						query.setString(attrName, ((Enum) valueObj).name());
					} else {
						query.setString(attrName, (String) valueObj);
					}
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	}
	/**
	 * 生成where条件的sql
	 * @param pojo 参数对象
	 * @param namesArray 对pojo哪些字段为where条件
	 * @param attributeList 返回作为条件字段的列表
	 * @param cl_prefix 数据库字段名前缀 如不指定，认为与pojo字段名一致
	 * @return 返回where字段串
	 */
	protected String ceateWhereSqlStr(Object pojo,String[] namesArray,List attributeList,String cl_prefix)
	{
		 String whereSqlStr="";
			// 用于构造查询条件
			StringBuffer whereBf = new StringBuffer();
			//数据库表字段名前缀
			String clPrefix="";
			if(StringUtils.isNotEmpty(cl_prefix))
			{
				clPrefix=cl_prefix;
			}			
			/**
			 * 构造查询条件
			 */
			if (pojo != null&&namesArray!=null) {
				 for (int i = 0; i < namesArray.length; i += 1) {
		                String name = namesArray[i];
		                try {
		                    
		                    Class clss = PropertyUtils.getPropertyType(pojo, name);
                        	if(clss==null)continue;
                        	Object valueObj = PropertyUtils.getProperty(pojo, name);
                        	if(valueObj==null)continue;
                        	
                        	whereBf.append(" and  "+clPrefix+name+"=:"+name+" ");
        					attributeList.add(name);
        					
		                } catch (Exception ex) {
		                    ex.printStackTrace();
		                }
				 }
			} 
				// sql where条件
				 whereSqlStr = whereBf.toString();
				if (whereSqlStr.length() > 0) {
					whereSqlStr = " where "
							+ whereSqlStr
									.substring(whereSqlStr.indexOf("and") + 3);
				}  
		 return whereSqlStr;
	}	
	protected String ceateWhereSqlStr(Object pojo,String[] namesArray,List attributeList)
	{
		 return ceateWhereSqlStr(pojo,namesArray,attributeList,"");
	}
	/**
	 * 生成insert的sql
	 * @param pojo 参数对象
	 * @param namesArray 对pojo哪些字段为insert条件
	 * @param attributeList 返回作为条件字段的列表
	 * @param cl_prefix 数据库字段名前缀 如不指定，认为与pojo字段名一致
	 * @return 返回where字段串
	 */
	protected String ceateInsertSqlStr(Object pojo,String[] namesArray,List attributeList,String cl_prefix)
	{
		 String insertSqlStr="";
			// 用于构造设置字段
			StringBuffer fieldsBf = new StringBuffer();
			// 用于构造设置参数
			StringBuffer valuesBf = new StringBuffer();
			
			//数据库表字段名前缀
			String clPrefix="";
			if(StringUtils.isNotEmpty(cl_prefix))
			{
				clPrefix=cl_prefix;
			}			
			/**
			 * 构造SQL
			 */
			if (pojo != null&&namesArray!=null) {
				 for (int i = 0; i < namesArray.length; i += 1) {
		                String name = namesArray[i];
		                try {		                    
		                    Class clss = PropertyUtils.getPropertyType(pojo, name);
                        	if(clss==null)continue;
                        	Object valueObj = PropertyUtils.getProperty(pojo, name);
                        	if(valueObj==null)continue;

                        	fieldsBf.append(","+clPrefix+name);
        					valuesBf.append(", :"+name);
        					attributeList.add(name);
        					
		                } catch (Exception ex) {
		                    ex.printStackTrace();
		                }
				 } 
					String fieldsStr = fieldsBf.toString();
					if (fieldsStr.length() > 0) {
						fieldsStr = " ("
								+ fieldsStr
										.substring(fieldsStr.indexOf(",") + 1)
								+ ")";
					} else {
						// 如果没有不做操作
						return null;
					}
					// set sql
					String valuesStr = valuesBf.toString();
					if (valuesStr.length() > 0) {
						valuesStr = " values ( "
								+ valuesStr
										.substring(valuesStr.indexOf(",") + 1)
								+ ")";
					} else {
						// 不做操作
						return null;
					}
					// 生成HQL字符串
					insertSqlStr = fieldsStr + valuesStr;
			} 
		 return insertSqlStr;
	}
	protected String ceateInsertSqlStr(Object pojo,String[] namesArray,List attributeList)
	{
		return ceateInsertSqlStr(pojo,namesArray,attributeList,"");
	}
	
	/**
	 * 生成update的sql
	 * @param pojo 参数对象
	 * @param namesArray 对pojo哪些字段为insert条件
	 * @param attributeList 返回作为条件字段的列表
	 * @param cl_prefix 数据库字段名前缀 如不指定，认为与pojo字段名一致
	 * @return 返回where字段串
	 */
	protected String ceateUpdateSqlStr(Object pojo,String[] namesArray,List attributeList,String cl_prefix)
	{
		 String updateSqlStr="";
		// 用于构造设置参数
			StringBuffer updateBf = new StringBuffer();
			
			//数据库表字段名前缀
			String clPrefix="";
			if(StringUtils.isNotEmpty(cl_prefix))
			{
				clPrefix=cl_prefix;
			}			
			/**
			 * 构造SQL
			 */
			if (pojo != null&&namesArray!=null) {
				 for (int i = 0; i < namesArray.length; i += 1) {
		                String name = namesArray[i];
		                try {		                    
		                    Class clss = PropertyUtils.getPropertyType(pojo, name);
                        	if(clss==null)continue;
                        	Object valueObj = PropertyUtils.getProperty(pojo, name);
                        	if(valueObj==null)continue;
                        	
                        	updateBf.append(" , "+clPrefix+name+" =:"+name+" ");
        					attributeList.add(name);
        					
		                } catch (Exception ex) {
		                    ex.printStackTrace();
		                }
				 } 
				// set sql
				 updateSqlStr= updateBf.toString();
					if (updateSqlStr.length() > 0) {
						updateSqlStr = " set "
								+ updateSqlStr
										.substring(updateSqlStr.indexOf(",") + 1);
					} 
			}  
		 return updateSqlStr;
	}
	protected String ceateUpdateSqlStr(Object pojo,String[] namesArray,List attributeList)
	{
		return ceateUpdateSqlStr(pojo,namesArray,attributeList,"");
	}
	
    /**
     * 得到数据列表
     * @param sql String hsql字符串
     * @param top int 限定最大条数
     * @return List
     */
    public List findTop(String sql, int top) {
        HibernateTemplate ht = this.getHibernateTemplate();
        if (top > 0) {
            ht.setMaxResults(top);
        }
        return ht.find(sql);
    }

    /**
     * 得到数据列表
     * @param sql String hsql字符串
     * @param firstRow int 记录起始行数
     * @param maxRow int 记录限定最大条数
     * @return List
     */
    public List findPage(final String sql, final int firstRow, final int maxRow) {
        return this.getHibernateTemplate().executeFind(new HibernateCallback() {
            public Object doInHibernate(org.hibernate.Session session) throws
                    SQLException,
                    HibernateException {

                Query query = session.createQuery(sql);

                if (firstRow > -1) {
                    query.setFirstResult(firstRow);
                }
                if (maxRow > 0) {
                    query.setMaxResults(maxRow);
                }
                return query.list();
            }
        });
    }

    public Serializable saveObject(Object o) {
        return getHibernateTemplate().save(o);
    }
    public void saveOrUpdate(Object o) {
          getHibernateTemplate().saveOrUpdate(o);
          getHibernateTemplate().flush();
    }
    public Object getObject(Class clazz, Serializable id) {
        Object o = getHibernateTemplate().get(clazz, id);
        if (o == null) {
            throw new ObjectRetrievalFailureException(clazz, id);
        }
        return o;
    }

    public List getObjects(Class clazz) {
        return getHibernateTemplate().loadAll(clazz);
    }

    public void removeObject(Class clazz, Serializable id) {
        getHibernateTemplate().delete(getObject(clazz, id));
    }

    public void removeObject(Object o) {
        getHibernateTemplate().delete(o);
    }

    public void updateObject(Object o) {
        this.getHibernateTemplate().update(o);

    }
 
}
