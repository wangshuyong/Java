<%@ page contentType="text/html; charset=GB2312" %>
<%@ page import="java.util.*"%>
<%
	String sContent = new String(request.getParameter("content1").getBytes("iso-8859-1"));

	//System.out.println();
	//下边这句提示不知何意？注释掉了 www.ITstudy.cn
	//System.out.print("取得的html标记："+"\n"+sContent+"\n"+"主要问题可能出现在upload.jsp里的第202行的setHtml()");
        out.println("编辑的内容如下：<br><br>"+sContent);
        out.println("<br><br><p><input type=button value=' 退回 ' onclick='history.back()'></p>");
%>
