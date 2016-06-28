package com.example.tests;

import java.util.regex.Pattern;
import java.util.concurrent.TimeUnit;
import org.junit.*;
import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;
import org.openqa.selenium.*;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.Select;

public class Bm {
  private WebDriver driver;
  private String baseUrl;
  private boolean acceptNextAlert = true;
  private StringBuffer verificationErrors = new StringBuffer();

  @Before
  public void setUp() throws Exception {
    driver = new FirefoxDriver();
    baseUrl = "http://apitest.xxt.qnsaas.cn:9004/";
    driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
  }

  @Test
  public void testBm() throws Exception {
    driver.get(baseUrl + "/portal/login");
    driver.findElement(By.cssSelector("span.top_con_2_img2")).click();
    driver.findElement(By.id("loginName")).clear();
    driver.findElement(By.id("loginName")).sendKeys("qnsoft");
    driver.findElement(By.id("password")).clear();
    driver.findElement(By.id("password")).sendKeys("qnsoft");
    driver.findElement(By.name("login")).click();

    driver.findElement(By.xpath("//div[@id='tree-area']/div[3]/span[2]")).click();
    driver.findElement(By.cssSelector("li")).click();
    driver.findElement(By.xpath("//div[@id='addWnd']/div[8]/div[2]")).click();
    driver.findElement(By.cssSelector("li")).click();
    driver.findElement(By.cssSelector("div.input-group > input[name=\"companyName\"]")).clear();
    driver.findElement(By.cssSelector("div.input-group > input[name=\"companyName\"]")).sendKeys("自动化测试公司");
    driver.findElement(By.cssSelector("div.input-group > input[name=\"phonenumber\"]")).clear();
    driver.findElement(By.cssSelector("div.input-group > input[name=\"phonenumber\"]")).sendKeys("1300000000");
    driver.findElement(By.name("userPassword")).clear();
    driver.findElement(By.name("userPassword")).sendKeys("123456");
    driver.findElement(By.cssSelector("div.input-group > input[name=\"email\"]")).clear();
    driver.findElement(By.cssSelector("div.input-group > input[name=\"email\"]")).sendKeys("123456");
    driver.findElement(By.cssSelector("div.input-group > input[name=\"contactPeople\"]")).clear();
    driver.findElement(By.cssSelector("div.input-group > input[name=\"contactPeople\"]")).sendKeys("测试");
    driver.findElement(By.cssSelector("div.input-group > input[name=\"userName\"]")).clear();
    driver.findElement(By.cssSelector("div.input-group > input[name=\"userName\"]")).sendKeys("test");
    driver.findElement(By.name("userPasswordConfirm")).clear();
    driver.findElement(By.name("userPasswordConfirm")).sendKeys("test");
    assertEquals("联系电话请输入正确的手机号码或固定电话号码，格式：区号+7-8位数字", closeAlertAndGetItsText());
    driver.findElement(By.cssSelector("div.input-group > input[name=\"phonenumber\"]")).clear();
    driver.findElement(By.cssSelector("div.input-group > input[name=\"phonenumber\"]")).sendKeys("13000000001");
    assertEquals("确认密码至少为6位数字或字母组成", closeAlertAndGetItsText());
    driver.findElement(By.name("userPasswordConfirm")).clear();
    driver.findElement(By.name("userPasswordConfirm")).sendKeys("123456");
    assertEquals("请输入有效的邮箱地址", closeAlertAndGetItsText());
    driver.findElement(By.cssSelector("div.input-group > input[name=\"email\"]")).clear();
    driver.findElement(By.cssSelector("div.input-group > input[name=\"email\"]")).sendKeys("wangsy@channelsoft.com");
    driver.findElement(By.cssSelector("#addWnd > div.add-btns > div.button")).click();
    driver.findElement(By.cssSelector("div.grid-bar")).click();
    driver.findElement(By.cssSelector("span.fa.fa-angle-double-right")).click();
    driver.findElement(By.cssSelector("span.fa.fa-angle-double-left")).click();
  }

  @After
  public void tearDown() throws Exception {
    driver.quit();
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
