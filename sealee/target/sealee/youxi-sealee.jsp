<%@ page language="java" pageEncoding="utf-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="java.security.MessageDigest"%>
<%@ page import="java.security.NoSuchAlgorithmException"%>
<%
	String userSite = "http://sealee.ucbox.com";
	String userKey  = "079822C0B217048638AD724BC028CB57";
	String userName = "";
	if(session.getAttribute("member")!=null&&!session.getAttribute("member").equals("")){
		userName = URLEncoder.encode((String)session.getAttribute("member"));
		userName =userName.toUpperCase();
	}else{
		response.sendRedirect("login.jsp");
	}
	java.util.Date dt = new java.util.Date();
	String tempTime   = dt.toLocaleString();
	String thisTime = URLEncoder.encode(tempTime);
   
	String UserSign ="UserName="+userName+"&Time="+tempTime+userKey; 
	System.out.println(UserSign);
	String miwen ="";
	try { 
		MessageDigest md = MessageDigest.getInstance("MD5"); 
		md.update(UserSign.getBytes()); 
		byte b[] = md.digest(); 	
		int i; 
		StringBuffer buf = new StringBuffer(""); 
		for (int offset = 0; offset < b.length; offset++) { 
		i = b[offset]; 
		if(i<0) i+= 256; 
		if(i<16) 
		buf.append("0"); 
		buf.append(Integer.toHexString(i)); 
		} 
		System.out.println("result: " + buf.toString());//32位的加密 
		miwen = buf.toString();
	//System.out.println("result: " + buf.toString().substring(8,24));//16位的加密 
	
	} catch (NoSuchAlgorithmException e) { 
	// TODO Auto-generated catch block 
		e.printStackTrace(); 
	} 
	//System.out.println(userSite+"/weblogin.aspx?UserName='"+userName+"'&Time='"+tempTime+"'&Mac='"+miwen+"'");
	if(userName!=null&&!userName.equals("")){
		response.sendRedirect(userSite+"/weblogin.aspx?UserName="+userName+"&Time="+thisTime+"&Mac="+miwen);
	}
%>
