package com.edu.cms.UITestServise;

import com.edu.cms.UIObject.HomePageObj;

public class LogoutService {
	
	public LoginService logOut(){
		HomePageObj hpo =new HomePageObj();
		hpo.getLogout().click();
		
		return new LoginService();		
	}

}
