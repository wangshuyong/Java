<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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
    <td width="4%" height="23" background="/admin/images/cbfxt_bgTls.gif">&nbsp;</td>
  </tr>
</table>
<table width="47%" border="0" align="center" cellpadding="5" cellspacing="0">
	<s:form action="User_add" namesapce="user" method="post">			
      <tr align="center">
          <td width="15%" align="right">手机号：											
          </td>
          <td colspan="3" align="left">
          <s:textfield name="user.phone"/>
           </td>
           <td width="15%" align="right">姓名：											
          </td>
          <td width="39%" colspan="1" align="left">
          <s:textfield name="user.realName"/>
           </td>
      </tr>	
      <tr align="center">
          <td align="right">年龄：											
          </td>
          <td colspan="3" align="left">
          <s:textfield name="user.age"/>
           </td>
           <td align="right">性别：											
          </td>
          <td colspan="3" align="left">
          <s:radio list="#{'1':'先生','0':'女士'}" name="user.sex" id="sex"/>
           </td>
      </tr>	
      <tr align="center">
          <td align="right">邮箱：											
          </td>
          <td colspan="3" align="left">
          <s:textfield name="user.email"/>
           </td>
           <td align="right">住址：											
          </td>
          <td colspan="3" align="left">
          <s:textfield name="user.address"/>
           </td>
      </tr>
      <tr align="center">
          <td align="right">籍贯：											
          </td>
          <td colspan="3" align="left">
          <s:textfield name="user.nativePlace"/>
           </td>
           <td align="right">爱好：											
          </td>
          <td colspan="3" align="left">
          <s:textfield name="user.hobby"/>
           </td>
      </tr>
      <tr align="center">
          <td align="right">权限：</td>
          <td colspan="3" align="left">
          <s:radio list="#{'1':'普通','0':'管理员'}" name="user.power" id="power"/>
          </td>
      </tr>	

      <tr align="center"> 
         <td colspan="6"  align="center" ><input type="submit" styleClass="reply_bottom" value="提交"/></td>
      </tr>
      
   </s:form>
   <s:debug></s:debug>
</table>
</body>
</html>