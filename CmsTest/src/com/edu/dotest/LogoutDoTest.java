package com.edu.dotest;

import org.junit.Test;

import com.edu.cms.BaseLib.BaseTest;
import com.edu.cms.UITestServise.LoginService;
import com.edu.cms.UITestServise.LogoutService;

public class LogoutDoTest extends BaseTest{
	@Test
	  public void testLogout() throws Exception {
		  LogoutService los = new LogoutService();
		  super.Login();
		  LoginService  lis = los.logOut();
		  
//		  assertTrue(lis.);
		  DriverManager.quit();
	  }	 

}
