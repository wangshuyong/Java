package com.edu.cms.UITestServise;

import com.edu.cms.BaseLib.*;
import com.edu.cms.BaseLib.BaseTest.DriverManager;
import com.edu.cms.UIObject.LoginPageObj;

public class LoginService {
	
	EduBase eb = new EduBase();
	LoginPageObj lpo = new LoginPageObj();
//	private static final String baseUrl = "http://apitest.xxt.qnsaas.cn:9004/portal/login"; 
	
	public HomeService loginAs(String username, String password) {   		
    	eb.clearAndTypeString(lpo.getUsernameBox(), username); 	
    	eb.clearAndTypeString(lpo.getPasswordBox(), password);
        eb.clickByElement(lpo.getSubmitButton()); 
//        assertTrue(); 
        return new HomeService();
    }
    
    public HomeService loginAsFail(String username, String password) {
    	eb.clearAndTypeString(lpo.getUsernameBox(), username);
    	eb.clearAndTypeString(lpo.getPasswordBox(), password);
//        lpo.getSubmitButton().click();
    	eb.clickByElement(lpo.getSubmitButton());
        return new HomeService();
    }
    
    public LoginService init(){
		DriverManager.getDriver().get(ConfigurationSettings.getProperty("baseUrl"));
		return this;
	}
    
    public String getElementPresent(){
		return lpo.getErroMSG().getText();
//		return hpo.
	}
}
