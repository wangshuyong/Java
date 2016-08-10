package com.wangsy.testServise;

import org.openqa.selenium.WebDriver;

import com.wangsy.Utils.DriverManager;
import com.wangsy.Utils.ToolsUtil;
import com.wangsy.pageOBJ.HomePageObj;
import com.wangsy.pageOBJ.LoginPageObj;

public class LogoutService {
	WebDriver driver;
	HomePageObj hpo;
	ToolsUtil eb;

	public LogoutService() {
		// setDriver(DriverManager.getDriver());
	}

	public LogoutService(WebDriver driver) {
		this.driver = driver;
		hpo = new HomePageObj(driver);
		eb = new ToolsUtil(driver);
	}

	public void logOut() {
		hpo.getLogout().click();
		// DriverManager.getDriver().quit();
	}

}
