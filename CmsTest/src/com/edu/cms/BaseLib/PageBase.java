package com.edu.cms.BaseLib;

import org.openqa.selenium.support.PageFactory;

public class PageBase {
	  
	public PageBase(){		
		PageFactory.initElements(DriverManager.getDriver(),this);
	}
	
}
