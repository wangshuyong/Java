package com.wangsy.testServise;

import org.openqa.selenium.WebDriver;

import com.wangsy.Utils.ToolsUtil;
import com.wangsy.pageOBJ.HomePageObj;
import com.wangsy.pageOBJ.LoginPageObj;

//import com.edu.cms.UIObject.HomePageObj;

public class HomeService {

	public CompanyManageService comp = new CompanyManageService();
	WebDriver driver;
	ToolsUtil eb;
	public HomePageObj hpo;

	public HomeService() {

	}

	public HomeService(WebDriver driver) {
		this.driver = driver;
		hpo = new HomePageObj(driver);
		eb = new ToolsUtil(driver);
	}

	public String getElementPresent() {

		return hpo.getLogout().getText();
		// return hpo.
	}

}
