<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>网站后台信息管理维护</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background:#ced7f7;
}
-->
</style>
</head>
<body>
<table width="1000" height="590" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2" height="100"><jsp:include page="top.jsp" flush="true" /></td>
  </tr>
  <tr>
    <td valign="top" height="490" width="180"><jsp:include page="left.jsp" flush="true" /></td>
    <td height="490" width="818" style="border-right:2px solid #799ae1;">
	<iframe name="main" src="manage/main.jsp" scrolling="no" width="100%" height="100%" frameborder="0"></iframe>
	</td>
  </tr>
  <tr><jsp:include page="bottom.jsp" flush="true"/></tr>
</table>
</body>
</html>
