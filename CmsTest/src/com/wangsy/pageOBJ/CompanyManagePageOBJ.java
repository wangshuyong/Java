package com.wangsy.pageOBJ;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.CacheLookup;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.How;

import com.wangsy.Utils.PageBase;
/**
 * 该类主要初始化超级管理员中 添加公司的页面元素
 * @author yangsy
 *
 */
public class CompanyManagePageOBJ extends PageBase{
	//企业管理导航条的元素
	@FindBy(how = How.XPATH, using = "//div[@id='tree-area']/div[3]/span[2]")
	@CacheLookup
	private WebElement companyManageSpan;
	
	//添加公司按钮 
	@FindBy(how = How.CSS, using = "li")
	@CacheLookup
	private WebElement addButton;
	//修改按钮
	@FindBy(how = How.XPATH, using = "//div[@id='searchDiv']/div[2]/div/ul/li[2]")
	@CacheLookup
	private WebElement modifyCompany;
	
	//公司名称
	@FindBy(how = How.CSS, using = "div.input-group > input[name=\"companyName\"]")
	@CacheLookup
	private WebElement companyName;
	
	//联系电话
	@FindBy(how = How.CSS, using = "div.input-group > input[name=\"phonenumber\"]")
	@CacheLookup
	private WebElement phone;
	
	//联系人
	@FindBy(how = How.CSS, using = "div.input-group > input[name=\"contactPeople\"]")
	@CacheLookup
	private WebElement contactPeople;
	
	//创建的管理员账号
	@FindBy(how = How.CSS, using = "div.input-group > input[name=\"contactPeople\"]")
	@CacheLookup
	private WebElement userName;
	
	//创建的管理员账号的密码
	@FindBy(how = How.NAME, using = "userPassword")
	@CacheLookup
	private WebElement userPassword;
		
	//创建的管理员账号-确认密码
	@FindBy(how = How.NAME, using = "userPasswordConfirm")
	@CacheLookup
	private WebElement userPasswordConfirm;
	
	//Email
	@FindBy(how = How.CSS, using = "div.input-group > input[name=\"email\"]")
	@CacheLookup
	private WebElement email;
	
	//确认按钮
	@FindBy(how = How.CSS, using = "#addWnd > div.add-btns > div.button")
	@CacheLookup
	private WebElement okButton;
	
	//取消按钮
	@FindBy(how = How.XPATH, using = "//div[@id='addWnd']/div[8]/div[2]")
	@CacheLookup
	private WebElement cancelButton;
	
	//企业管理-系统管理员的iframe
	@FindBy(how = How.CLASS_NAME, using = "eb_iframe")
	@CacheLookup
	private WebElement iframe;
	
	public WebElement getCompanyManageSpan() {
		return companyManageSpan;
	}



	public void setCompanyManageSpan(WebElement companyManageSpan) {
		this.companyManageSpan = companyManageSpan;
	}



	public WebElement getAddButton() {
		return addButton;
	}



	public void setAddButton(WebElement addButton) {
		this.addButton = addButton;
	}



	public WebElement getModifyCompany() {
		return modifyCompany;
	}



	public void setModifyCompany(WebElement modifyCompany) {
		this.modifyCompany = modifyCompany;
	}



	public WebElement getCompanyName() {
		return companyName;
	}



	public void setCompanyName(WebElement companyName) {
		this.companyName = companyName;
	}



	public WebElement getPhone() {
		return phone;
	}



	public void setPhone(WebElement phone) {
		this.phone = phone;
	}



	public WebElement getContactPeople() {
		return contactPeople;
	}



	public void setContactPeople(WebElement contactPeople) {
		this.contactPeople = contactPeople;
	}



	public WebElement getUserName() {
		return userName;
	}



	public void setUserName(WebElement userName) {
		this.userName = userName;
	}



	public WebElement getUserPassword() {
		return userPassword;
	}



	public void setUserPassword(WebElement userPassword) {
		this.userPassword = userPassword;
	}



	public WebElement getUserPasswordConfirm() {
		return userPasswordConfirm;
	}



	public void setUserPasswordConfirm(WebElement userPasswordConfirm) {
		this.userPasswordConfirm = userPasswordConfirm;
	}



	public WebElement getEmail() {
		return email;
	}



	public void setEmail(WebElement email) {
		this.email = email;
	}



	public WebElement getOkButton() {
		return okButton;
	}



	public void setOkButton(WebElement okButton) {
		this.okButton = okButton;
	}



	public WebElement getCancelButton() {
		return cancelButton;
	}



	public void setCancelButton(WebElement cancelButton) {
		this.cancelButton = cancelButton;
	}



	public WebElement getIframe() {
		return iframe;
	}



	public void setIframe(WebElement iframe) {
		this.iframe = iframe;
	}

}
