<%@ page pageEncoding="utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
<table width="98%" border="0" cellpadding="0" cellspacing="1" bgcolor="#799ae1">
  <tr>
    <th height="22" colspan="7" class="tableHeaderText"><span class="STYLE1">类别列表 </span></th>
  </tr>
  <tr bgcolor="#FFFFFF" class="row_bottom">
    <td height="22" align="center" width="5%"><strong>序号</strong></td>
    <td height="22" align="center" width="20%"><strong>名称</strong></td>
    <td align="center" width="10%"><strong>类型编号</strong></td>
    <td align="center" width="10%"><strong>类别等级</strong></td>
    <td height="22" align="center" width="10%">&nbsp;</td>
    <td width="10%" align="center"><strong><a href="manage/type/new.jsp">添加</a></strong></td>
    <td width="10%">&nbsp;</td>
  </tr>
<logic:iterate id="typelist" name="clInfos" indexId="idx">
  <tr bgcolor="#FFFFFF" height="25"  onMouseOver="this.bgColor='#ced7f7';" onMouseOut="this.bgColor='#FFFFFF';">
    <td width="8%" height="25" align="center">&nbsp;
    <bean:write name="idx"/>
    </td>
    <td width="20%">&nbsp;&nbsp;<img src="../../images/index_15.gif" width="5" height="9">&nbsp;&nbsp;
	<bean:write name="typelist" property="name"/></td>
    <td width="10%" align="center">&nbsp;<bean:write name="typelist" property="name_value"/></td>
	<td width="10%" align="center">&nbsp;<bean:write name="typelist" property="type_level"/></td>
    <td width="10%" align="center">&nbsp;</td>
    <td align="center">&nbsp;<a href="editsitetype.shtml?id=<bean:write name="typelist" property="id"/>">编辑</a></td>
    <td align="center">&nbsp;
	<a href="#" onClick="if(window.confirm('你确定删除吗')) this.href='deletesitetype.shtml?id=<bean:write name="typelist" property="id"/>';">删除</a></td>
  </tr>
 </logic:iterate>
 <tr bgcolor="#FFFFFF" height="25">
    <td width="8%" height="25">&nbsp;</td>
    <td width="20%">&nbsp;</td>
    <td width="10%" align="center">&nbsp;</td>
    <td width="10%" align="center">&nbsp;</td>
    <td width="10%" align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
  </tr>

<tr  bgcolor="#FFFFFF"  height="25">
    <td width="8%" height="25">&nbsp;</td>
    <td width="00%">&nbsp;</td>
    <td width="10%" align="center">&nbsp;</td>
    <td width="10%" align="center">&nbsp;</td>
    <td width="10%" align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
  </tr>

  <tr align="center">
    <td colspan="7" height="22">
	第<bean:write name="pager" property="currentPage"/>页
	共<bean:write name="pager" property="totalPages"/>页
	<html:link action="/listsitetype.shtml?pageMethod=first" paramName="pager" paramProperty="currentPage" paramId="currentPage">首页</html:link>
	<html:link action="/listsitetype.shtml?pageMethod=previous" paramName="pager" paramProperty="currentPage" paramId="currentPage">上一页</html:link>
	<html:link action="/listsitetype.shtml?pageMethod=next" paramName="pager" paramProperty="currentPage" paramId="currentPage">下一页</html:link>
	<html:link action="/listsitetype.shtml?pageMethod=last" paramName="pager" paramProperty="currentPage" paramId="currentPage">尾页</html:link>
	</td>
  </tr>
</table>
</body>
</html>
