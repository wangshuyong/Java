package com.sea.action;

import com.sea.model.User;

public class IndexAction extends BaseAction{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String sessionKey;
	public String excute(){
		User loginUser = (User) session.get("loginUser");
		System.out.println("loginUser======================================"+loginUser.getPhone());
		return "success";
	}
	public String getSessionKey() {
		return sessionKey;
	}
	public void setSessionKey(String sessionKey) {
		this.sessionKey = sessionKey;
	}

}
