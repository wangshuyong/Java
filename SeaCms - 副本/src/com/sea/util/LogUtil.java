package com.sea.util;

import java.text.SimpleDateFormat;
import java.util.UUID;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.web.context.request.RequestContextHolder;  
import org.springframework.web.context.request.ServletRequestAttributes; 
import org.apache.log4j.Logger;
import org.aspectj.lang.ProceedingJoinPoint;
import com.sea.model.Log;
import com.sea.service.LogService;

public class LogUtil {

	private LogService logService; 
	private  static  final Logger logger = Logger.getLogger(LogUtil. class); 
	private Log log;
	HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();  
    HttpSession session = request.getSession();  
	
	public LogService getLogService() {
		return logService;
	}

	@Resource(name="logService")
	public void setLogService(LogService logService) {
		this.logService = logService;
	}

	public Log getLog() {
		return log;
	}

	public void setLog(Log log) {
		this.log = log;
	}


	
	public void addLog(ProceedingJoinPoint pjp){
	    String className = pjp.getTarget().getClass().getSimpleName();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   
		log.setUserId(1+"");    
		log.setOperateType("add");    
		log.setOperateDate(sdf.format(new Date()));
		logService.add(log);  
	} 
}
