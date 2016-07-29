package com.edu.cms.UITestServise;

import com.edu.cms.BaseLib.*;
import com.edu.cms.UIObject.LoginPageObj;

public class LoginService {
	
	EduBase eb = new EduBase();
	LoginPageObj lpo = new LoginPageObj();
	public HomeService loginAs(String username, String password) {   		
    	eb.clearAndTypeString(lpo.getUsernameBox(), username); 	
    	eb.clearAndTypeString(lpo.getPasswordBox(), password);
        eb.clickByElement(lpo.getSubmitButton()); 
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
