package com.edu.dotest;

import static org.junit.Assert.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.junit.runners.Parameterized.Parameters;

import com.edu.cms.BaseLib.BaseTest;
import com.edu.cms.BaseLib.ConfigurationSettings;
import com.edu.cms.BaseLib.ExcelUtils;
import com.edu.cms.UIObject.LoginPageObj;
import com.edu.cms.UITestServise.*;

@RunWith(value = Parameterized.class)
public class TestLogin extends BaseTest {
	
	String userName;
	String passWord;
	String flag;
	String expected;
	static SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	static String cal =df.format(new Date());
  
	public TestLogin(String userName, String passWord,String flag,String expected) {
		super();
		this.userName = userName;
		this.passWord = passWord;
		this.flag = flag;
		this.expected = expected;
	}

	@Parameters
	 public static Collection<Object> spreadsheetData() throws IOException {
		ExcelUtils eu = new ExcelUtils();
		return eu.ReadExcelFile(ConfigurationSettings.getProperty("logincasefile"),ConfigurationSettings.getProperty("test_login_data"));
	   }
	@SuppressWarnings("deprecation")
	@Test
	  public void testLogin() throws Exception {
		  LoginService lts = new LoginService();
		  HomeService  hts = lts.init().loginAs(userName,passWord);
//		  assertEquals(expected, hts.getElementPresent());
		  if(flag=="t") {
//			  LogoutService lodt = new LogoutService();
//			  lts = lodt.logOut();
			  assertEquals(expected, hts.getElementPresent());
			  			  
		  }else if(flag=="f") {
			  System.out.println(expected);
			  System.out.println(lts.getElementPresent());
			  assertEquals(expected, lts.getElementPresent());
			  
		  }
		  
	  }
	
//	@Test
//	  public void testLogout() throws Exception {
//		  LogoutService los = new LogoutService();
//		  
//			  LoginService  lis = los.logOut(); 
//		  
////		  assertTrue(lis.);
//	  }	

}