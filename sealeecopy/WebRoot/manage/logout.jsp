<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%
	session.removeAttribute("adminname");
	session.removeAttribute("adminid");
	out.println("<script>alert('ÄúÒÑ¾­×¢Ïú£¡');location.href='../index.jsp';</script>");
%>

