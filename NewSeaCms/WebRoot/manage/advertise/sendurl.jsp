<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%
	String infotype = "";
	if(request.getAttribute("type")!=null&!request.getAttribute("type").equals("")){
		infotype = String.valueOf(request.getAttribute("type"));
	}else{
		response.sendRedirect("main.jsp");
	}
	if(infotype!=null&&!infotype.equals("")){
		//response.sendRedirect("listadvertise.shtml?type="+infotype);
		out.println("<script language='javascript'>alert('操作已成功！请确定返回！');location.href='listadvertise.shtml?type="+infotype+"';</script>");
	}else{
		out.println("<script language='javascript'>alert('操作已成功！请确定返回！');location.href='listadvertise.shtml?type="+infotype+"';</script>");
		//response.sendRedirect("main.jsp");
	}
%>	
