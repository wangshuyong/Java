<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%
	String infotype = (String)request.getAttribute("type");
	if(infotype!=null&&!infotype.equals("")){
		out.println("<script language='javascript'>alert('�����ѳɹ�����ȷ�����أ�');location.href='listsiteinfo.shtml?type="+infotype+"';</script>");
		//response.sendRedirect("listsiteinfo.shtml?type="+infotype);
	}else{
		out.println("<script language='javascript'>alert('����ʧ�ܣ�');location.href='listsiteinfo.shtml?type="+infotype+"';</script>");
	}
%>	
