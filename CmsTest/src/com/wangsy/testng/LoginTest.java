package com.wangsy.testng;

import static org.junit.Assert.assertEquals;

import org.openqa.selenium.WebDriver;
import org.testng.Assert;
import org.testng.annotations.AfterClass;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;

import com.edu.cms.BaseLib.ConfigurationSettings;
import com.edu.cms.BaseLib.DriverManager;
import com.edu.cms.BaseLib.ExcelUtils;
import com.edu.cms.UITestServise.HomeService;
import com.edu.cms.UITestServise.LoginService;
import com.edu.cms.UITestServise.LogoutService;

public class LoginTest {
	 
    @DataProvider(name="userLogin")
    public Object[][] rangeData() {
    	return new ExcelUtils().getDataForTestNG(ConfigurationSettings.getProperty("logincasefile"),ConfigurationSettings.getProperty("test_login_data"));
    }
    
    @Test(dataProvider="userLogin")
	  public void testLogin(String userName, String passWord,String flag,String expected) throws Exception {
		  LoginService lts = new LoginService();
		  HomeService  hts = null;
		  if("t".equals(flag)) {
			  hts = lts.loginAs(userName,passWord);
			  Assert.assertEquals(expected, hts.getElementPresent());
			  DriverManager.getDriver().quit();
		  }else if("f".equals(flag)) {
			  lts.loginAsFail(userName, passWord);
			  Assert.assertEquals(expected, lts.getElementPresent());
		  }
		  
	  }
    
  /*@Test
  @AfterClass
  public void quit() {
    	DriverManager.getDriver().quit();
  }*/
    
//    @Test
//    @AfterMethod
    public void logOut() {
    	LogoutService los = new LogoutService();
    	los.logOut();
    }
}
