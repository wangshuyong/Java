package com.edu.dotest;

import static org.junit.Assert.*;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.junit.runners.Parameterized.Parameters;

import com.edu.cms.BaseLib.*;
import com.edu.cms.UITestServise.*;
@RunWith(value = Parameterized.class)
public class TestCompanyManage extends BaseTest{
	
	String compName;
	String phone;
	String contactPeople;
	String userName;
	String passWord;
	String confirmPassWord;
	String email;
	String flag;
	String expected;
	static SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	static String cal =df.format(new Date());
	
	public TestCompanyManage(String compName,String phone,String contactPeople,String userName,String passWord,String confirmPassWord, String email,String flag,String expected) {
		super();
		this.compName = compName;
		this.phone = phone;
		this.contactPeople = contactPeople;
		this.userName = userName;
		this.passWord = passWord;
		this.confirmPassWord = confirmPassWord;
		this.email = email;
		this.flag = flag;
		this.expected = expected;
	}

	@Parameters
	 public static Collection<Object> spreadsheetData() throws IOException {
		ExcelUtils eu = new ExcelUtils();
		return eu.ReadExcelFile(ConfigurationSettings.getProperty("CompanyManage_Test_Case"),ConfigurationSettings.getProperty("AddCompany_Test_Data"));
	   }
	@SuppressWarnings("deprecation")
	
	@Test
	public void test() {
//		CompanyManageService cmservice = new CompanyManageService();
		HomeService hs = super.Login().comp.addCompany(compName, phone, contactPeople, userName, passWord, confirmPassWord, email);
//		HomeService hs = cmservice.addCompany(compName, phone, contactPeople, userName, passWord, confirmPassWord, email);
		
	}

}
