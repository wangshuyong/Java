<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="pragma" content="no-cache">
<link href="/admins/css/css_cbfxt.css" rel="stylesheet" type="text/css">
<title>修改用户</title>
<style type="text/css">
<!--
body {
	background-color: #ced7f7;
}
body,td,th {
	font-size: 12px;
}
-->
</style></head>

<body leftmargin="0" topmargin="0" scroll="auto">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="4%" height="23" background="/admins/images/cbfxt_bgTls.gif">&nbsp;</td>
  </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="5" cellspacing="0">
			<html:form action="/edituser.shtml" method="post">
				<html:hidden name="adminuser" property="id"/>
			<tr>
				<td width="17%" align="center">账号：											
				</td>
				<td width="77%" colspan="3">&nbsp;
				<html:text name="adminuser" property="username" />
				 </td>
			</tr>	
			<tr>
				<td width="17%" align="center">密码：</td>
				<td width="77%" colspan="3">&nbsp;
				<html:password name="adminuser" property="password" />
				</td>
			</tr>	
			<tr>
				<td width="17%" align="center">权限：</td>
				<td width="77%" colspan="3">&nbsp;
				<html:text name="adminuser"  property="power" />
				</td>
			</tr>	

			<tr align="center"> 
				<td colspan="2">
				<html:submit value="确定"/>
				</td>
			</tr>
			</html:form>
</table>
</body>
</html>