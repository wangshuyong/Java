package com.edu.test.login;

import org.openqa.selenium.WebDriver;

import org.openqa.selenium.WebElement;

import org.openqa.selenium.support.CacheLookup;
import org.openqa.selenium.support.FindBy;

import org.openqa.selenium.support.PageFactory;

public class BaiduSearchPage {

  WebDriver driver;
   @FindBy(id = "kw")
@CacheLookup
WebElement searchField;

@FindBy(id = "su")
@CacheLookup

WebElement searchButton;

public BaiduSearchPage(WebDriver driver){
this.driver = driver;
PageFactory.initElements(driver,this);
}

public void inputText(String search){
	searchField.sendKeys(search);
}
  public void clickButton(){
	searchButton.click();
}

}