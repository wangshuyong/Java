package com.wangsy.Utils;

public class TestExcel {

	/**
	 * @param args
	 * @throws Exception 
	 */
//	ExcelUtils eu;
	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		ExcelUtils eu = null;
		try {
			eu = new ExcelUtils();
			eu.ReadExcelFile(ConfigurationSettings.getProperty("logincasefile"),ConfigurationSettings.getProperty("test_login_data"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
//		int a = eu.excel_get_rows();
//		System.out.println(a);
		
//		String s = eu.getCellDataasstring(5, 5);
//		System.out.println(s);
		
//		eu.getCellDataasstring(5, 5);

	}

}
