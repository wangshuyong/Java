<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%
	String infotype = (String)request.getAttribute("type");
	if(infotype!=null&&!infotype.equals("")){
%>
	�����ɹ�����<a href="listsiteinfo.shtml?type=<%=infotype%>">����</a>��Ϣ��
<%
	}else{
%>
	����ʧ�ܣ���<a href="main.jsp">����</a>��
<%
	}
%>	
