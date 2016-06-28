package com.edu.test.login;

import java.util.regex.Pattern;
import java.util.concurrent.TimeUnit;
import org.junit.*;
import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;
import org.openqa.selenium.*;
import org.openqa.selenium.WebDriver.Navigation;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.Select;

import com.edu.cms.BaseLib.BaseTest;
import com.edu.cms.BaseLib.EduBase;
import com.edu.cms.BaseLib.BaseTest.DriverManager;
import com.edu.cms.UIObject.LoginPageObj;
import com.edu.cms.UITestServise.HomeService;
import com.edu.cms.driver.ExploreDriver;

public class TestLogin extends BaseTest{
//	  private WebDriver driver;
//	  private String baseUrl = "http://cms.test.edutao.cn/login/admin";;
//	  private boolean acceptNextAlert = true;
//	  private StringBuffer verificationErrors = new StringBuffer();

//	  @Before
//	  public void setUp() throws Exception {
////		  System.setProperty("webdriver.firefox.bin", "D:/Program Files (x86)/Mozilla Firefox/firefox.exe"); 
//	    driver = new FirefoxDriver();
////		ExploreDriver ed = new ExploreDriver();
////		ed.StartFireFoxByDefault(driver);
//	    baseUrl = "http://cms.test.edutao.cn/login/admin";
//	    driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
//	  }

	  @Test
	  public void testLogin() throws Exception {
////	    driver.get(baseUrl);
//		  DriverManager.getDriver().get(baseUrl);   
////	    EduBase eb = new EduBase();
//		LoginPageObj lpo = new LoginPageObj();
////	    eb.clearAndTypeString(lpo.getUsernameBox(), "admin"); 	
////    	eb.clearAndTypeString(lpo.getPasswordBox(), "654321");
//		lpo.getUsernameBox().sendKeys("admin");
//		lpo.getPasswordBox().sendKeys("654321");
//        lpo.getSubmitButton().click();
		  HomeService  hts =Login();
	  }

//	  @After
//	  public void tearDown() throws Exception {
////	    driver.quit();
//	    String verificationErrorString = verificationErrors.toString();
//	    if (!"".equals(verificationErrorString)) {
//	      fail(verificationErrorString);
//	    }
//	  }

//	  private boolean isElementPresent(By by) {
//	    try {
//	      driver.findElement(by);
//	      return true;
//	    } catch (NoSuchElementException e) {
//	      return false;
//	    }
//	  }
//
//	  private boolean isAlertPresent() {
//	    try {
//	      driver.switchTo().alert();
//	      return true;
//	    } catch (NoAlertPresentException e) {
//	      return false;
//	    }
//	  }

	  
	}

