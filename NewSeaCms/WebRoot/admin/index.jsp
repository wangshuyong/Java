<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>网站后台信息管理维护</title>
<link rel="stylesheet" type="text/css"
			href="ext/resources/css/ext-all-neptune.css" rel="stylesheet"" />
		<!-- ENDLIBS 
		<script type="text/javascript" src="ext/ext.js">
	
</script> -->

		<script type="text/javascript" src="ext/bootstrap.js">
	
</script>

		<script type="text/javascript" src="ext/locale/ext-lang-zh_CN.js"">
	
</script>

<style type="text/css">
html,body {
	font: normal 12px verdana;
	margin: 0;
	padding: 0;
	border: 0 none;
	overflow: hidden;
	height: 100%;
}

.empty .x-panel-body {
	padding-top: 0;
	text-align: center;
	font-style: italic;
	color: gray;
	font-size: 11px;
}

.x-btn button {
	font-size: 14px;
}

.x-panel-header {
	font-size: 14px;
}
</style>

</head>
<body>
<table width="100%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2" height="100"><jsp:include page="top.jsp" flush="true" /></td>
  </tr>
  <tr>
    <td valign="top" height="100%" width="15%"><jsp:include page="left.jsp" flush="true" /></td>
    <td height="100%" width="85%" style="border-right:2px solid #799ae1;">
	<iframe name="main" src="main.jsp" scrolling="auto" width="100%" height="95%" frameborder="0"></iframe>
	</td>
  </tr>
  <tr><jsp:include page="bottom.jsp" flush="true"/></tr>
</table>
</body>
</html>
