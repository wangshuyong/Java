package com.wangsy.testng;

import org.testng.Assert;
import org.testng.annotations.AfterClass;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;

import com.edu.cms.BaseLib.ConfigurationSettings;
import com.edu.cms.BaseLib.DriverManager;
import com.edu.cms.BaseLib.ExcelUtils;
import com.edu.cms.UITestServise.HomeService;
import com.edu.cms.UITestServise.LoginService;
import com.edu.cms.UITestServise.LogoutService;

public class LoginTest {
	LoginService loginService = null;
	HomeService  homeService = null;
    @DataProvider(name="userLogin")
    public Object[][] rangeData() {
    	return new ExcelUtils().getDataForTestNG(ConfigurationSettings.getProperty("logincasefile"),ConfigurationSettings.getProperty("test_login_data"));
    }
    
    @Test(dataProvider="userLogin")
	public void testLogin(String userName, String passWord,String flag,String expected) throws Exception {
    	if("f".equals(flag)) {
    		loginService = new LoginService();
			loginService.loginAsFail(userName, passWord);
//			  Assert.assertEquals(expected, loginService.getElementPresent());
		  }else if("t".equals(flag)) {
			  homeService = loginService.loginAsSuccess(userName,passWord);
//			  Assert.assertEquals(expected, homeService.getElementPresent());
		  }
	}

    @BeforeTest (alwaysRun = true)
    public void beforeLogin() {
    	loginService.setDriver(DriverManager.getDriver());
    }
  
//    @AfterTest(alwaysRun = true)
    public void quit() {
    	DriverManager.getDriver().quit();
    }
    
//    @Test
//    @AfterMethod
    public void logOut() {
    	LogoutService los = new LogoutService();
    	los.logOut();
    }
}
