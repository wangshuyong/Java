package com.pycms.action;

import java.util.List;

import com.pycms.dao.SchoolDao;
import com.pycms.framework.ActionSupportBase;
import com.pycms.moble.School;

public class SchoolAction extends ActionSupportBase {

	private SchoolDao schoolDao;

	public SchoolDao getSchoolDao() {
		return schoolDao;
	}

	public void setSchoolDao(SchoolDao schoolDao) {
		this.schoolDao = schoolDao;
	}
	
	
	public String getSchoolList(){
		List<School> schoolList = schoolDao.getSchoolList();
		System.out.println("schollist="+schoolList.size());
		for (School school : schoolList) {
			System.out.println("------"+school.getNickName()+"------");
			System.out.println(school.getId());
			System.out.println(school.getName());
			System.out.println(school.getType());
			System.out.println(school.getAddress());
		}
		
		return SUCCESS;
	}
	
	
	
}
