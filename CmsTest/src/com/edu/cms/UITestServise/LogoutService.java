package com.edu.cms.UITestServise;

import com.edu.cms.BaseLib.DriverManager;
import com.edu.cms.UIObject.HomePageObj;

public class LogoutService {
	
	public void logOut(){
		HomePageObj hpo =new HomePageObj();
		hpo.getLogout().click();	
		DriverManager.getDriver().quit();
	}

}
