package com.edu.dotest;

import org.junit.Test;
import org.testng.Assert;

import com.edu.cms.BaseLib.DriverManager;
import com.edu.cms.UITestServise.LoginService;
import com.edu.cms.UITestServise.LogoutService;

public class LogoutDoTest{
	
	@Test
	public void testLogin() throws Exception {
		LoginService lts = new LoginService();
		 lts.loginAs("13000000001","123456");
		 assertEquals("ÍË³ö",lts.getElementPresent());
	}
	@Test
	  public void testLogout() throws Exception {
		 
		  LogoutService los = new LogoutService();
		 los.logOut();
		  
//		  assertTrue(lis.);
		  DriverManager.quit();
	  }	 

}

