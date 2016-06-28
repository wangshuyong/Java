<%@ page language="java" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
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
			<s:form action="User_update" namesapce="user" method="post">
				<input type="hidden" name="user.id" value="<s:property value="user.id"/>" />
			<tr>
				<td width="17%" align="center">手机号：											
				</td>
				<td width="77%" colspan="3">&nbsp;
				<s:textfield name="phone" value="%{user.phone}"/>
				 </td>
				 <td width="17%" align="center">姓名：											
				</td>
				<td width="77%" colspan="3">&nbsp;
				
				 </td>
			</tr>	
			<tr>
				<td width="17%" align="center">邮箱：											
				</td>
				<td width="77%" colspan="3">&nbsp;
				<s:textfield name="email" value="%{user.email}"/>
				 </td>
				 <td width="17%" align="center">性别：											
				</td>
				<td width="77%" colspan="3">&nbsp;
				<s:radio list="#{'1':'先生','0':'女士'}" name="sex" value="%{user.sex}" id="sex"/>
				 </td>
			</tr>	
			<tr>
				<td width="17%" align="center">权限：</td>
				<td width="77%" colspan="3">&nbsp;
				<s:radio list="#{'1':'普通','0':'管理员'}" name="power" id="power"/>
				</td>
			</tr>	

			<tr align="center"> 
			   <td width="33%" align="center" ></td>
			   <td  width="33%" align="center" colspan="2">
				    <input type="submit" styleClass="reply_bottom" value="修改"/></td>
			   <td width="33%" align="center" ></td>
			</tr>
            <debug></debug>
			</s:form>
</table>
</body>
</html>