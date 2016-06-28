package com.pycms.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.pycms.dao.ConfigDao;
import com.pycms.framework.ActionSupportBase;
import com.pycms.moble.School;
import com.pycms.moble.Teacher;

public class ConfigAction extends ActionSupportBase{

	private ConfigDao configDao;
	private List<Teacher> teacherList;
	

	public List<Teacher> getTeacherList() {
		return teacherList;
	}

	public void setTeacherList(List<Teacher> teacherList) {
		this.teacherList = teacherList;
	}

	public ConfigDao getConfigDao() {
		return configDao;
	}

	public void setConfigDao(ConfigDao configDao) {
		this.configDao = configDao;
	}
	
	
	
	public String getTableList(){
		
		List<Map> schoolMap = configDao.getTableList("School");
		System.out.println(schoolMap.size());
		List<School> schoolLsit = new ArrayList<School>();
		for (int i = 0; i < schoolMap.size(); i++) {
			schoolLsit.add((School) schoolMap.get(i)) ;
		}
//		System.out.println("schoolLsit.size="+schoolLsit.size());
//		
//		for (School school : schoolLsit) {
//			System.out.println(school.getAddress());
//			System.out.println(school.getNickName());
//		}
		
		return SUCCESS;
	}
	
	
}
