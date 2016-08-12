package com.wangsy.Utils;

import com.wangsy.testServise.LoginService;
import com.wangsy.testServise.LogoutService;

public class BaseTestUtil {

	private LoginService loginService;
	private LogoutService logOutService;
	public void login(String userName, String passWord){
		loginService = new LoginService(DriverManager.getDriver());
		loginService.loginAsSuccess(userName, passWord);
	}
	
	public void quit(){
		logOutService = new LogoutService(DriverManager.getDriver());
		logOutService.logOut();
		DriverManager.getDriver().quit();
	}
}
