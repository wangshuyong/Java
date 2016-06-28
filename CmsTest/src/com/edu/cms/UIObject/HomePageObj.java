package com.edu.cms.UIObject;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.CacheLookup;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.How;
import com.edu.cms.BaseLib.*;

public class HomePageObj extends PageBase{
	
	@FindBy(how = How.CSS, using = "span.top_con_2_img2")
	@CacheLookup
	private WebElement logout;
	
//	@FindBy(how = How., using = "登出")
//	@CacheLookup
//	private WebElement title;
	
	public WebElement getLogout() {
		return logout;
	}
	
	public void setLogout(WebElement logout) {
		this.logout = logout;
	}
	
}
