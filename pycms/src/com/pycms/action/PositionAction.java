package com.pycms.action;

import java.util.List;

import com.pycms.dao.PositionDao;
import com.pycms.framework.ActionSupportBase;
import com.pycms.moble.Position;

public class PositionAction  extends ActionSupportBase {
	
	private PositionDao positionDao;

	public PositionDao getPositionDao() {
		return positionDao;
	}

	public void setPositionDao(PositionDao positionDao) {
		this.positionDao = positionDao;
	}
	
	
	public String getProvinceName(){
		List<Position> positionList =positionDao.getProvinceName();
		System.out.println("size="+positionList.size());
		return SUCCESS;
	}
	public String getCityName(){
		
		
		return SUCCESS;
	}
	public String getCountyName(){
		
		
		return SUCCESS;
	}

}
