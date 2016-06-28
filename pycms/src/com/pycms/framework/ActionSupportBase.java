package com.pycms.framework;

import javax.servlet.ServletContext;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;  
import com.opensymphony.xwork2.ActionSupport;


public class ActionSupportBase extends ActionSupport {

	private static final long serialVersionUID = 1L;
	
	public HttpServletRequest request = null;
	public HttpServletResponse response = null;
	public HttpSession session = null;
	public ServletContext context = null;
    
    public void init()
    {
		request = ServletActionContext.getRequest();
	    response = ServletActionContext.getResponse();
	    session = request.getSession(true); 
	    context = ServletActionContext.getServletContext();    	
    }

    public String getParameter(String strParameterName) throws UnsupportedEncodingException
    {
    	if (request == null)
    		return new String("");
    	String strValue = request.getParameter(strParameterName);
    	if ((strValue==null) || (strValue.equals("null")))
    	{
    		return new String("");
    	}
    	return  URLDecoder.decode(strValue, "UTF-8");
//    	return WebClient.httpDecode(strValue);
    }
    
    public void showMessage(String strContent)
    {
    	showMessage(strContent,"系统提示","","");
    }
    
    public void showMessage(String strContent, String strTitle)
    {
    	showMessage(strContent,strTitle,"返回","");
    }
    
    public void showMessage(String strContent, String strTitle, String strActionButtonText, String strUrl)
    {
    	if(request==null)
    		return;
    	request.setAttribute("mms_messagebox_content", strContent);
    	request.setAttribute("mms_messagebox_title", strTitle);
    	request.setAttribute("mms_messagebox_button_text", strActionButtonText);
    	request.setAttribute("mms_messagebox_goto_url", strUrl);    	
    }
    
	public static boolean isDate(String pInput) {
	       if(pInput == null)
	           return false;	        
	       if(pInput.equals(""))
	    	   return false;
	       String regEx = "^((\\d{2}(([02468][048])|([13579][26]))-((((0?[1357"
	       + "8])|(1[02]))-((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])"
	       + "|(11))-((0?[1-9])|([1-2][0-9])|(30)))|(0?2-((0?[1-9])|([1-"
	       + "2][0-9])))))|(\\d{2}(([02468][1235679])|([13579][01345789]"
	       + "))[\\-\\/\\s]?((((0?[13578])|(1[02]))-((0?[1-9])|([1-2][0-"
	       + "9])|(3[01])))|(((0?[469])|(11))-((0?[1-9])|([1-2][0-9])|(3"
	       + "0)))|(0?2-((0?[1-9])|(1[0-9])|(2[0-8]))))))$";
	       Pattern p = Pattern.compile(regEx);
	       Matcher matcher = p.matcher(pInput);
	       return matcher.matches();
	}	    
}
