
<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%
	String infoid = "";
	if(request.getAttribute("infoid")!=null&&!request.getAttribute("infoid").equals("")){
		infoid = String.valueOf(request.getAttribute("infoid"));
%>
	操作成功！<a href="thread-article-<%=infoid%>.html">点击浏览信息</a>
<%
	}else{
%>
         操作出错！请返回<a href="../../index.html">主页</a>！
<%
	}
%>
