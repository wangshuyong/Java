package com.edu.cms.UITestServise;

import com.edu.cms.UIObject.HomePageObj;

//import com.edu.cms.UIObject.HomePageObj;

public class HomeService {
	
	public CompanyManageService comp = new CompanyManageService();

	public HomePageObj hpo =new HomePageObj();
	
	public String getElementPresent(){
		
		return hpo.getLogout().getText();
//		return hpo.
	}
			
}
