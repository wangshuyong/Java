package com.edu.cms.UIObject;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.CacheLookup;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.How;
import org.openqa.selenium.support.PageFactory;
import com.edu.cms.BaseLib.PageBase;
import com.edu.cms.BaseLib.BaseTest.DriverManager;
import com.edu.cms.UITestServise.LoginService;

public class LoginPageObj extends PageBase{

	//	private static final String baseUrl = "http://cms.test.edutao.cn/login/admin"; 
	 
	@FindBy(name  = "loginName")
	@CacheLookup
	WebElement usernameBox;
	@FindBy(name="password")
    @CacheLookup
	private WebElement passwordBox;
    // 提交按钮
	@FindBy(name="login")
    @CacheLookup
	private
    WebElement submitButton;
	
	@FindBy(id="errorMsgId")
    @CacheLookup
	private WebElement ErroMSG;
	
	public WebElement getUsernameBox() {
		return usernameBox;
	}
	public void setUsernameBox(WebElement usernameBox) {
		this.usernameBox = usernameBox;
	}
	public WebElement getPasswordBox() {
		return passwordBox;
	}
	public void setPasswordBox(WebElement passwordBox) {
		this.passwordBox = passwordBox;
	}
	public WebElement getSubmitButton() {
		return submitButton;
	}
	public void setSubmitButton(WebElement submitButton) {
		this.submitButton = submitButton;
	}
	public WebElement getErroMSG() {
		return ErroMSG;
	}
	public void setErroMSG(WebElement erroMSG) {
		ErroMSG = erroMSG;
	}
	
}
