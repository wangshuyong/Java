package com.pycms.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.pycms.dao.ConfigDao;
import com.pycms.framework.ActionSupportBase;
import com.pycms.moble.Information;
import com.pycms.moble.School;
import com.pycms.moble.Teacher;


/**
 * 后台登录
 * @author yanfadanbu
 *
 */
public class ConsoleServices extends ActionSupportBase{
	
	private ConfigDao configDao;
	private List<Teacher> teacherList;
	private List<Information> InformationList;
	

	public List<Teacher> getTeacherList() {
		return teacherList;
	}

	public void setTeacherList(List<Teacher> teacherList) {
		this.teacherList = teacherList;
	}
	

	public List<Information> getInformationList() {
		return InformationList;
	}

	public void setInformationList(List<Information> informationList) {
		InformationList = informationList;
	}

	public ConfigDao getConfigDao() {
		return configDao;
	}

	public void setConfigDao(ConfigDao configDao) {
		this.configDao = configDao;
	}
	@Override
    public String execute() throws Exception {
		init();	
		String strAdminName=this.getParameter("username");
		String strAdminKey=this.getParameter("password");
		
		if((!strAdminName.equalsIgnoreCase("admin"))||(!strAdminKey.equals("1"))){
			showMessage("用户名或密码验证错误，登录失败！","登录错误","返回","longin");
			return "showmessage";
		}else{
			session.setAttribute("mms_sessionid",strAdminName);	
			
		}
		return  SUCCESS;
	}
}
