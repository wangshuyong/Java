package com.edu.cms.UIObject;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.CacheLookup;
import org.openqa.selenium.support.FindBy;
import com.edu.cms.BaseLib.PageBase;

public class LoginPageObj extends PageBase{

	//	private static final String baseUrl = "http://cms.test.edutao.cn/login/admin"; 
	 
	@FindBy(id  = "phone")
	@CacheLookup
	WebElement usernameBox;
	@FindBy(id="password")
    @CacheLookup
	private WebElement passwordBox;
    // 提交按钮
	@FindBy(id="login")
    @CacheLookup
	private WebElement submitButton;
	
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
