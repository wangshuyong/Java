package com.edu.test;

import java.util.regex.Pattern;
import java.util.concurrent.TimeUnit;
import org.junit.*;
import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;
import org.openqa.selenium.*;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.Select;

public class fasong {
  private WebDriver driver;
  private String baseUrl;
  private boolean acceptNextAlert = true;
  private StringBuffer verificationErrors = new StringBuffer();

  @Before
  public void setUp() throws Exception {
    driver = new FirefoxDriver();
    baseUrl = "http://cms.test.edutao.cn/login/admin";
    driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
  }

  @Test
  public void testFasong() throws Exception {
    driver.get(baseUrl + "/login/admin");
    driver.findElement(By.name("username")).clear();
    driver.findElement(By.name("username")).sendKeys("admin");
    driver.findElement(By.name("password")).clear();
    driver.findElement(By.name("password")).sendKeys("654321");
    driver.findElement(By.name("submit")).click();
//    driver.findElement(By.linkText("学校动�?管理")).click();
//    driver.findElement(By.cssSelector("img[alt=\"发咨询\"]")).click();
//    new Select(driver.findElement(By.id("target-scope"))).selectByVisibleText("老师");
//    new Select(driver.findElement(By.id("target-school-type"))).selectByVisibleText("中学");
//    new Select(driver.findElement(By.id("target-school"))).selectByVisibleText("北京慈航教育科技有限公司测试学校");
//    driver.findElement(By.id("notice-title")).clear();
//    driver.findElement(By.id("notice-title")).sendKeys("test");
//    driver.findElement(By.id("notice-content")).clear();
//    driver.findElement(By.id("notice-content")).sendKeys("test");
//    driver.findElement(By.xpath("//div[@id='sizzle-1430965774162']/div[3]/table/tbody/tr[2]/td[5]")).click();
//    driver.findElement(By.cssSelector("span.hour.active")).click();
//    driver.findElement(By.id("notice-submit")).click();
  }

  @After
  public void tearDown() throws Exception {
//    driver.quit();
    String verificationErrorString = verificationErrors.toString();
    if (!"".equals(verificationErrorString)) {
      fail(verificationErrorString);
    }
  }

  private boolean isElementPresent(By by) {
    try {
      driver.findElement(by);
      return true;
    } catch (NoSuchElementException e) {
      return false;
    }
  }

  private boolean isAlertPresent() {
    try {
      driver.switchTo().alert();
      return true;
    } catch (NoAlertPresentException e) {
      return false;
    }
  }

  private String closeAlertAndGetItsText() {
    try {
      Alert alert = driver.switchTo().alert();
      String alertText = alert.getText();
      if (acceptNextAlert) {
        alert.accept();
      } else {
        alert.dismiss();
      }
      return alertText;
    } finally {
      acceptNextAlert = true;
    }
  }
}
