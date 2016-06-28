<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
			<html:form action="/newsitetype.shtml" method="post">
			<tr>
				<td width="17%" align="center">类别名称：											
				</td>
				<td width="77%" colspan="3">&nbsp;
				<html:text property="name" />
				 </td>
			</tr>	
			<tr>
				<td width="17%" align="center">类别编号：</td>
				<td width="77%" colspan="3">&nbsp;
				<html:text property="name_value" />
				</td>
			</tr>	
			<tr>
				<td width="17%" align="center">类别等级：</td>
				<td width="77%" colspan="3">&nbsp;
				<html:text property="type_level" />
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