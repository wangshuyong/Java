package com.edu.cms.UITestServise;

import org.openqa.selenium.WebDriver;

import com.edu.cms.BaseLib.*;
import com.edu.cms.UIObject.LoginPageObj;

public class LoginService {
	private WebDriver driver;
	public WebDriver getDriver() {
		return driver;
	}

	public void setDriver(WebDriver driver) {
		this.driver = driver;
	}
	
	public LoginService(){
//		setDriver(DriverManager.getDriver());
	}
	
	public LoginService(WebDriver driver){
		this.driver=driver;
	}
	
	EduBase eb = new EduBase(driver);
	LoginPageObj lpo = new LoginPageObj();
	public HomeService loginAsSuccess(String username, String password) {
    	eb.clearAndTypeString(lpo.getUsernameBox(), username); 	
    	eb.clearAndTypeString(lpo.getPasswordBox(), password);
        eb.clickByElement(lpo.getSubmitButton()); 
        LogoutService los = new LogoutService();
    	los.logOut();
        return new HomeService();
    }
    
    public HomeService loginAsFail(String username, String password) {
    	eb.clearAndTypeString(lpo.getUsernameBox(), username);
    	eb.clearAndTypeString(lpo.getPasswordBox(), password);
    	eb.clickByElement(lpo.getSubmitButton());
        return new HomeService();
    }
    
    public String getElementPresent(){
		return lpo.getErroMSG().getText();
//		return hpo.
	}


}
