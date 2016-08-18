package com.wangsy.testServise;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.PageFactory;

import com.wangsy.Utils.*;
import com.wangsy.pageOBJ.LoginPageObj;

public class LoginService {
	private WebDriver driver;
	private LoginPageObj lpo;
	private ToolsUtil eb;

	public LoginService() {
	}

	public LoginService(WebDriver driver) {
		this.driver = driver;
		lpo = new LoginPageObj(driver);
		eb = new ToolsUtil(driver);
	}

	public HomeService loginAsSuccess(String username, String password) {
		eb.clearAndTypeString(lpo.getUsernameBox(), username);
		eb.clearAndTypeString(lpo.getPasswordBox(), password);
		eb.clickByElement(lpo.getSubmitButton());
		return new HomeService();
	}

	public LoginService loginAsFail(String username, String password) {
		eb.clearAndTypeString(lpo.getUsernameBox(), username);
		eb.clearAndTypeString(lpo.getPasswordBox(), password);
		eb.clickByElement(lpo.getSubmitButton());
		return this;
	}

	public String getElementPresent() {
		return lpo.getUsernameBox().getText();
		// return hpo.
	}

}
