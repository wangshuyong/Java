<%@ page contentType="text/html; charset=GB2312" %>
<%@ page import="java.util.*"%>
<%
	String sContent = new String(request.getParameter("content1").getBytes("iso-8859-1"));

	//System.out.println();
	//�±������ʾ��֪���⣿ע�͵��� www.ITstudy.cn
	//System.out.print("ȡ�õ�html��ǣ�"+"\n"+sContent+"\n"+"��Ҫ������ܳ�����upload.jsp��ĵ�202�е�setHtml()");
        out.println("�༭���������£�<br><br>"+sContent);
        out.println("<br><br><p><input type=button value=' �˻� ' onclick='history.back()'></p>");
%>
