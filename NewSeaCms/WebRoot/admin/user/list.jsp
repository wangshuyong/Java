<%@ page pageEncoding="UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户列表</title>
<link rel="stylesheet" href="../../images/css.css" type="text/css">
<style type="text/css">
<!-- 
body {
	background-color: #ced7f7;
}
.STYLE1 {
	color: white;
	font-size: 12px;
}
body,td,th {                     
	font-size: 12px;
	text-align: center;
}
a:link {
	color: #000000;
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color: #000000;
}
a:hover {
	text-decoration: underline;
	color: #000000;
}
a:active {
	text-decoration: none;
	color: #000000;
}
-->
</style></head>

<body>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#799ae1">
  <tr>
    <th height="22" colspan="7" class="tableHeaderText"><span class="STYLE1">用户列表 </span></th>
  </tr>
  <tr bgcolor="#FFFFFF" class="row_bottom">
    <td height="22"><strong>序号</strong></td>
    <td height="22" align="center"><strong>手机号</strong></td>
    <td align="center"><strong>密码</strong></td>
    <td align="center"><strong>真实姓名</strong></td>
    <td align="center"><strong>年龄</strong></td>
     <td align="center"><strong>性别</strong></td>
     <td align="center"><strong>E-mail</strong></td>
    <td align="center"><strong>住址</strong></td>
    <td align="center"><strong>角色</strong></td>
    <td height="22" colspan="2" align="center" ><strong>管理操作/</strong><a href="user/User_userAdd"><strong>添加用户</strong></a></td>
  </tr>

<s:iterator value="list" var="u" status="index">
  <tr bgcolor="#FFFFFF" height="25"  onMouseOver="this.bgColor='#ced7f7';" onMouseOut="this.bgColor='#FFFFFF';">
   
    <td height="25" align="center">&nbsp;<b><font color="red"><b>·</b></font></b>
    <s:property value="#index.index+1"/></td>
    <td>&nbsp;&nbsp;<img src="../../images/index_15.gif" width="5" height="9">&nbsp;&nbsp;
	<s:property value="#u.phone"/></td>
    <td align="center">&nbsp;
    <s:property value="#u.password"/></td>   
    <td align="center">&nbsp;
    <s:property value="#u.realName"/></td>
    <td align="center">&nbsp;
    <s:property value="#u.age"/></td>
    <td align="center">&nbsp;
    <s:if test="#u.sex==0">女士</s:if> 
    <s:elseif test="#u.sex==1">先生</s:elseif></td>
    <td align="center">&nbsp;
    <s:property value="#u.email"/></td>
    <td align="center">&nbsp;
    <s:property value="#u.address"/></td>
	<td align="center">&nbsp;<s:property value="#u.admin_power"/></td>    
    <td align="center">&nbsp;
    <a href="user/User_edit?userId=<s:property value="%{#u.id}" />">编辑</a></td>
	<td align="center">&nbsp;
    <a href="user/User_delete?userId=<s:property value="%{#u.id}" />">删除</a>
     </td>
  </tr>
 </s:iterator>
 
  <tr align="center">
    <td colspan="7" height="22">
	共<s:property value="totalRows"/>行&nbsp;
            第<s:property value="currentPage"/>页&nbsp;
            共<s:property value="page.getTotalPages()"/>页&nbsp;
            <a href="<s:url value="User_list.action">
                <s:param name="currentPage" value="currentPage"/>
                <s:param name="pagerMethod" value="'first'" />
            </s:url>">首页</a>
            <a href="<s:url value="User_list.action">
                <s:param name="currentPage" value="currentPage"/>
                <s:param name="pagerMethod" value="'previous'"/>
            </s:url>">上一页</a>
            <a href="<s:url value="User_list.action">
                <s:param name="currentPage" value="currentPage"/>
                <s:param name="pagerMethod" value="'next'"/>
            </s:url>">下一页</a>
            <a href="<s:url value="User_list.action">
                <s:param name="currentPage" value="currentPage"/>
                <s:param name="pagerMethod" value="'last'"/>
            </s:url>">尾页</a>
	</td>
  </tr>
 	
</table>
</body>
</html>
