package com.edu.cms.UIObject;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.CacheLookup;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.How;
import com.edu.cms.BaseLib.*;

public class HomePageObj extends PageBase{
	
	@FindBy(how = How.XPATH, using = "//div[@id='user-nav']/ul/li[4]/a/span")
	@CacheLookup
	private WebElement logout;
	
	public WebElement getLogout() {
		return logout;
	}
	
	public void setLogout(WebElement logout) {
		this.logout = logout;
	}
	
}
