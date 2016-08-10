package com.wangsy.testServise;

import com.wangsy.Utils.ToolsUtil;
import com.wangsy.pageOBJ.CompanyManagePageOBJ;

public class CompanyManageService {
	ToolsUtil eb = new ToolsUtil();
	CompanyManagePageOBJ compmPO = new CompanyManagePageOBJ();
	public HomeService addCompany(String compName,String phone,String contactPeople,String userName,String passWord,String confirmPassWord, String email){
		eb.clickByElement(compmPO.getCompanyManageSpan());
		eb.switchToFrame(compmPO.getIframe());
		eb.clickByElement(compmPO.getAddButton());
		eb.clearAndTypeString(compmPO.getCompanyName(), compName);
		eb.clearAndTypeString(compmPO.getContactPeople(), contactPeople);
		eb.clearAndTypeString(compmPO.getPhone(), phone);
		eb.clearAndTypeString(compmPO.getUserName(), userName);
		eb.clearAndTypeString(compmPO.getUserPassword(), passWord);
		eb.clearAndTypeString(compmPO.getUserPasswordConfirm(), confirmPassWord);
		eb.clearAndTypeString(compmPO.getEmail(), email);
		eb.clickByElement(compmPO.getOkButton());
		return new HomeService();
	}
	
	public HomeService modifyCompany(String compName,String phone,String contactPeople,String userName,String passWord,String confirmPassWord, String email){
		eb.switchToFrame(compmPO.getIframe());
		eb.clickByElement(compmPO.getModifyCompany());
		eb.clearAndTypeString(compmPO.getCompanyName(), compName);
		eb.clearAndTypeString(compmPO.getContactPeople(), contactPeople);
		eb.clearAndTypeString(compmPO.getPhone(), phone);
		eb.clearAndTypeString(compmPO.getUserName(), userName);
		eb.clearAndTypeString(compmPO.getUserPassword(), passWord);
		eb.clearAndTypeString(compmPO.getUserPasswordConfirm(), confirmPassWord);
		eb.clearAndTypeString(compmPO.getEmail(), email);
		eb.clickByElement(compmPO.getOkButton());
		return new HomeService();
	}

}
