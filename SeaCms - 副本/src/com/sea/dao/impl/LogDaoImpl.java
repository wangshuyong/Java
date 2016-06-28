package com.sea.dao.impl;

import java.util.List;

import org.springframework.stereotype.Component;

import com.sea.dao.LogDao;
import com.sea.model.Log;

@Component("logDao")
public class LogDaoImpl extends BaseDaoImpl<Log> implements LogDao {


	@Override
	public void delete(int id) {
		
	}

	@Override
	public List<Log> getLogs() {
		
		return null;
	}

	@Override
	public List<Log> listLogByPage(int startRows, int pageSize) {
		
		return null;
	}

}
