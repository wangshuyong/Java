package com.edu.test.login;

import org.openqa.selenium.WebDriver;

import org.openqa.selenium.firefox.FirefoxDriver;

public class Testbaidu {

public static void main(String[] args) {

BaiduSearchPage searchPage;

WebDriver driver =new FirefoxDriver();

driver.manage().window().maximize();

driver.get("http://www.baidu.com");

searchPage =new BaiduSearchPage(driver);

searchPage.inputText("selenium");

searchPage.clickButton();
}

}