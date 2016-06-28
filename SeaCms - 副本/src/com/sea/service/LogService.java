package com.sea.service;

import java.util.List;
import com.sea.model.Log;

public interface LogService {
	public String addLog(Log log);
	public void deleteLog(int id);
	public void updateLog(Log log);
	public List<Log> getLogsByPage(int length,int offset);
	public int getLogCount();
	public Log getLogById(int id);
	
}
