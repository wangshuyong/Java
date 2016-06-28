package com.edu.cms.BaseLib;

import java.util.concurrent.TimeUnit;

import org.junit.After;
import org.junit.Before;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import com.edu.cms.UIObject.HomePageObj;
import com.edu.cms.UIObject.LoginPageObj;
import com.edu.cms.UITestServise.HomeService;
import com.edu.cms.UITestServise.LoginService;


public class BaseTest {
	  @Before
//	  @BeforeClass
	  public void setUp() throws Exception {

	  }
	  
	  @After
	  public void tearDown() throws Exception {
//	    DriverManager.getDriver().quit();
	  }
	  
	  public static class DriverManager {
//	      protected Logger logger = LoggerFactory.getLogger(getClass());
//	    	static WebDriver driver;
	    	/**
			 * 濡傛灉褰撳墠杩涚▼娌℃湁缁戝畾driver锛屽垱寤轰竴涓劧鍚庣粦瀹氫笂锛屽鏋滃凡缁忔湁浜嗗氨鐩存帴杩斿洖
			 * create a driver for this thread if not exist. or return it
			 */
	    	public static ThreadLocal<WebDriver> ThreadDriver=new ThreadLocal<WebDriver>() ;
	    	static WebDriver driver= ThreadDriver.get();
	        public static WebDriver getDriver(){
	        	if (driver==null){
	        		driver = new FirefoxDriver();
	        		DriverManager.getDriver().manage().timeouts().implicitlyWait(3, TimeUnit.SECONDS);
	        	}
	    	    
//	    	    driver.get(url);    
//	    	    driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
	    	    return driver;
	    	   }
	  	
	  	    public static void quit(){
	  		   driver.quit();
	  	    }
	    /**
	     * 
	     * 鎵撳紑瀵瑰簲url鐨勯〉闈�
	     * @param url
	     */
	        public static void openBrowser(String url){
	           driver.get(url);
	        }
	    }
	  
	  public HomeService Login() {
		  LoginService lts = new LoginService();		  
		  return lts.init().loginAs(ConfigurationSettings.getProperty("username"),ConfigurationSettings.getProperty("password"));
//		  return lts.init().loginAs("admin","654321");
	  }
	  
	  public void logOut(){
			HomePageObj hpo =new HomePageObj();
			hpo.getLogout().click();	
			DriverManager.quit();
		}

}
