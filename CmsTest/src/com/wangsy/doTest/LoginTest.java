package com.wangsy.doTest;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.testng.Assert;
import org.testng.annotations.AfterClass;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;

import com.wangsy.Utils.ConfigurationSettings;
import com.wangsy.Utils.DriverManager;
import com.wangsy.Utils.ExcelUtils;
import com.wangsy.testServise.HomeService;
import com.wangsy.testServise.LoginService;
import com.wangsy.testServise.LogoutService;

public class LoginTest {
	private LoginService loginService;
	private LogoutService logOutService;
	private HomeService homeService;

	@DataProvider(name = "userLogin")
	public Object[][] rangeData() {
		return new ExcelUtils().getDataForTestNG(
				ConfigurationSettings.getProperty("logincasefile"),
				ConfigurationSettings.getProperty("test_login_data"));
	}

	@Test(dataProvider = "userLogin")
	public void testLogin(String userName, String passWord, String flag,
			String expected) throws Exception {
		if ("f".equals(flag)) {
			loginService.loginAsFail(userName, passWord);
			Assert.assertEquals(expected, loginService.getElementPresent());
		} else if ("t".equals(flag)) {
			loginService.loginAsSuccess(userName, passWord);
			Assert.assertEquals(expected, homeService.getElementPresent());
			logOutService.logOut();
		}
	}

	@BeforeTest(alwaysRun = true)
	public void beforeLogin() {
		loginService = new LoginService(DriverManager.getDriver());
		logOutService = new LogoutService(DriverManager.getDriver());
		homeService = new HomeService(DriverManager.getDriver());
	}

	@AfterTest(alwaysRun = true)
	public void quit() {
		DriverManager.getDriver().quit();
	}

}
