package com.edu.cms.driver;


import org.apache.log4j.Logger;
import org.openqa.selenium.WebDriver;

import com.wangsy.Utils.ConfigurationSettings;



public class DriverFactory {
    private static DriverType DEFAULT_DRIVER_TYPE = DriverType.Firefox;


    private static DriverFactory instance = null;

    static {
        instance = new DriverFactory();
    }

    public static DriverFactory getInstance() {
        return instance;
    }

    public WebDriver getDriver() {
        DriverType type = DEFAULT_DRIVER_TYPE;
        try {
            type = Enum.valueOf(DriverType.class, ConfigurationSettings.WEBDRIVER_TYPE);
        }
        catch (Exception ex) {
        }
        return type.getDriver();
    }
}