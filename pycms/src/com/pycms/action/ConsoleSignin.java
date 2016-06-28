package com.pycms.action;

import com.pycms.framework.ActionSupportBase;

/**
 * 跳转登录页
 * @author yanfadanbu
 *
 */
public class ConsoleSignin extends ActionSupportBase{

	@Override
	public String execute() throws Exception{
		init();
		return SUCCESS;
	}
}
