
<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%
	String infoid = "";
	if(request.getAttribute("infoid")!=null&&!request.getAttribute("infoid").equals("")){
		infoid = String.valueOf(request.getAttribute("infoid"));
%>
	�����ɹ���<a href="thread-article-<%=infoid%>.html">��������Ϣ</a>
<%
	}else{
%>
         ���������뷵��<a href="../../index.html">��ҳ</a>��
<%
	}
%>
