package com.edu.cms.BaseLib;
import org.openqa.selenium.support.PageFactory;

import com.edu.cms.BaseLib.BaseTest.DriverManager;
public class PageBase {
	  
	public PageBase(){		
		PageFactory.initElements(DriverManager.getDriver(),this);
	}
	
}
