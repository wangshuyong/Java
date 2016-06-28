package com.util;

import java.io.UnsupportedEncodingException;

public class ParameterTools {
	/**
	 * 转换HTML存入数据库
	 * @param theString
	 * @return
	 */
	
	public String HtmlEncode(String theString){
	   theString=theString.replace(">", "&gt;");
	   theString=theString.replace("<", "&lt;");
	   theString=theString.replace(" ", "&nbsp;");
	   theString=theString.replace(" ", "&nbsp;");
	   theString=theString.replace("\"", "&quot;");
	   theString=theString.replace("\'", "&#39;");
	   theString=theString.replace("\n", "<br/> ");
	   return theString;
	  }
	
	/**
	 * URL参数转码
	 * @param str
	 * @param encode
	 * @return
	 */
	public static String urlTool(String str,String encode){
		String _s = null;
		try {
		_s = java.net.URLEncoder.encode(str,encode);
		} catch (UnsupportedEncodingException e) {

		e.printStackTrace();
		}
		         return _s;
		} 
}
