<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%
String info_id = "",info_type="";
if(request.getAttribute("info_id")!=null&&!request.getAttribute("info_id").equals("")){
	info_id = (String)request.getAttribute("info_id");
}
if(request.getAttribute("info_type")!=null&&!request.getAttribute("info_type").equals("")){
	info_type = (String)request.getAttribute("info_type");
}
response.setStatus(301);
response.setHeader("Location", "html/"+info_type+"/"+info_id+".html");
response.setHeader("Connection","close");
%>