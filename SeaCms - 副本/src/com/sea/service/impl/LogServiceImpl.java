package com.sea.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.sea.dao.LogDao;
import com.sea.model.Log;
import com.sea.service.LogService;
@Component("logService")
public class LogServiceImpl implements LogService {

	private LogDao logDao;
	@Override
	public String addLog(Log log) {
		return null;
	}

	@Override
	public void deleteLog(int id) {

	}

	@Override
	public void updateLog(Log log) {

	}

	@Override
	public List<Log> getLogsByPage(int length, int offset) {
		return null;
	}

	@Override
	public int getLogCount() {
		return 0;
	}

	@Override
	public Log getLogById(int id) {
		return null;
	}

	public LogDao getLogDao() {
		return logDao;
	}

	@Resource(name="logDao")
	public void setLogDao(LogDao logDao) {
		this.logDao = logDao;
	}

}
