package com.wangsy.doTest;

import org.openqa.selenium.WebDriver;
import org.testng.Assert;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;

import com.wangsy.Utils.BaseTestUtil;
import com.wangsy.Utils.ConfigurationSettings;
import com.wangsy.Utils.DriverManager;
import com.wangsy.Utils.ExcelUtils;
import com.wangsy.testServise.HomeService;
import com.wangsy.testServise.LoginService;
import com.wangsy.testServise.LogoutService;

public class UserAddTest {

	BaseTestUtil baseTest = new BaseTestUtil();
	@DataProvider(name = "userLogin")
	public Object[][] rangeData() {
		return new ExcelUtils().getDataForTestNG(
				ConfigurationSettings.getProperty("logincasefile"),
				ConfigurationSettings.getProperty("test_login_data"));
	}

	@Test
	public void testUserAdd() throws Exception {
		System.out.println("Test user add!!!");
	}

	@BeforeTest(alwaysRun = true)
	public void beforeLogin() {
		baseTest.login("13000000001", "123456");
	}

	@AfterTest(alwaysRun = true)
	public void quit() {
		baseTest.quit();
	}
}
