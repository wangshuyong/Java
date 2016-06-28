package com.edu.cms.driver;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebDriver.Navigation;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.ie.InternetExplorerDriver;
import org.openqa.selenium.remote.DesiredCapabilities;

public class ExploreDriver {
	private WebDriver driver;
	
	public void StartFireFoxByDefault(WebDriver driver) {
		System.out.println("start firefox browser...");
		 driver = new FirefoxDriver();
		
		System.out.println("start firefox browser succeed...");		
	}
	
	public void StartFireFoxNotByDefault(){
		 System.out.println("start firefox browser...");
		 System.setProperty("webdriver.firefox.bin", "D:/Program Files (x86)/Mozilla Firefox/firefox.exe");
		 WebDriver driver = new FirefoxDriver();
//		 Navigation navigation = driver.navigate();
//		 navigation.to("http://cms.test.edutao.cn/login/admin");
		 System.out.println("start firefox browser succeed...");        
	}
	
	public void StartIEAndCloseProtectedMode(WebDriver driver) {
		System.out.println("start IE browser...");
		System.setProperty("webdriver.ie.driver", "files\\IEDriverServer.exe");
		DesiredCapabilities dc = DesiredCapabilities.internetExplorer();
		dc.setCapability(InternetExplorerDriver.INTRODUCE_FLAKINESS_BY_IGNORING_SECURITY_DOMAINS,true);
		// IE默认启动保护模式，要么手动在浏览器的设置中关闭保护模式，要么在代码中加上这一句，即可
		dc.setCapability("ignoreProtectedModeSettings", true);
		driver.get("http://cms.test.edutao.cn/login/admin");
		System.out.println("start firefox browser succeed...");
	}
}
