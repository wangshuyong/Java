<%@ page pageEncoding="utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%
	String type = "";
	if(request.getAttribute("type")!=null&&!request.getAttribute("type").equals("")){
		type = (String)request.getAttribute("type");
	}
%>
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
   <script language="JavaScript">
 <!--
    var ca = new Array();
    function a()
    {
        var m = document.getElementsByName('test[]');
        for ( var i=0; i< m.length ; i++ )
        {
            m[i].checked == true
                ? m[i].checked = false
                : m[i].checked = true;
        }
    }

    function b()
    {
        var m = document.getElementsByName('test[]');
        var l = m.length;
        for ( var i=0; i< l; i++)
        {
            m[i].checked == true 
                ? m[i].checked = false
                : m[i].checked = true;
        }
    }

    function c()
    {
        if (ca.length == 0)
        {
            ca = cache();
        }
        cl = ca.length;
        for ( var i=0; i< cl; i++)
        {
            ca[i].checked == true 
                ? ca[i].checked = false
                : ca[i].checked = true;
        }
    }

    function cache()
    {
        var m = document.getElementsByName('test[]');
        var cache = new Array();
        var l = m.length;
        for ( var i=0; i< l; i++)
        {
            cache[i] = m[i];
        }
        return cache;
    }

 //-->
 function deletemore() {
	if (document.getElementById('test[]').checked==0) {alert("请先选择信息，然后再发布。");return false;}
	if (confirm('是否确定删除选择的任务？'))
	{
	frm.submit();};
	}
 </script>

<body>

<table width="98%" border="0" cellpadding="0" cellspacing="1" bgcolor="#799ae1">
<form name="frm" action="buildsomehtml.shtml" method="post">
	<input type="hidden" name="type" value="<bean:write name='type'/>">
  <tr>
    <th height="22" colspan="8" class="tableHeaderText"><span class="STYLE1">类别列表 </span></th>
  </tr>
  <tr bgcolor="#FFFFFF" class="row_bottom">
    <td height="22" width="8%" align="center"><strong><a href="#" onClick="return deletemore();">发布选中</a></strong></td>
    <td height="22" align="center" width="36%"><strong>标题</strong></td>
    <td align="center" width="11%"><a href="#" onClick="if(window.confirm('你确定发布列表页吗')) this.href='buildlisthtml.shtml?type=<bean:write name="type"/>';"><B>发布列表</B></a></td>
    <td align="center" width="9%"><strong>作者</strong></td>
    <td align="center" width="6%"><strong>精华</strong></td>
    <td height="22" align="center" width="9%"><strong>审核</strong></td>
    <td width="10%" align="center"><strong><a href="manage/info/new.jsp?type=<%=type%>">添加</a></strong></td>
    <td width="11%" align="center"><a href="#" onClick="if(window.confirm('你确定发布主页吗')) this.href='buildindexhtml.shtml';"><b>发布主页</b></a></td>
  </tr>
<%int i=0;%>
<logic:iterate id="infolist" name="clinfos">
  <tr bgcolor="#FFFFFF" height="25"  onMouseOver="this.bgColor='#ced7f7';" onMouseOut="this.bgColor='#FFFFFF';">
    <td width="8%" height="25" align="center">&nbsp;<b><font color="red"><b><%=++i%></b>
      <input type="checkbox" name="test[]" value="<bean:write name='infolist' property='id'/>">
    </font></b></td>
    <td width="36%">&nbsp;&nbsp;
	<bean:write name="infolist" property="title"/></td>
    <td width="11%" align="center"><a href="#" onClick="if(window.confirm('你确定发布该文章吗')) this.href='buildhtml.shtml?id=<bean:write name="infolist" property="id"/>&type=
      <bean:write name="infolist" property="type"/>';">发布</a></td>
    <td width="9%" align="center">&nbsp;
      <bean:write name="infolist" property="author"/></td>
	<td width="6%" align="center">&nbsp;
	<logic:equal name="infolist" property="is_show" value="1">是</logic:equal></td>
    <td width="9%" align="center">&nbsp;
	<logic:notEqual name="infolist" property="remark" value="1">
	<a href="#" onClick="if(window.confirm('你确定审核吗')) this.href='viewinfo.shtml?id=<bean:write name="infolist" property="id"/>&type=<bean:write name="infolist" property="type"/>';"><font color="#FF0000">审核</font></a>	</logic:notEqual>
	<logic:equal name="infolist" property="remark" value="1">
	<a href="#" onClick="if(window.confirm('你要取消审核吗')) this.href='viewnotinfo.shtml?id=<bean:write name="infolist" property="id"/>&type=<bean:write name="infolist" property="type"/>';">取消</a>	</logic:equal>	</td>
    <td align="center">&nbsp;<a href="siteinfo.shtml?id=<bean:write name="infolist" property="id"/>">编辑</a></td>
    <td align="center">&nbsp;
	<a href="#" onClick="if(window.confirm('你确定删除吗')) this.href='deletesiteinfo.shtml?id=<bean:write name="infolist" property="id"/>&type=<bean:write name="infolist" property="type"/>';">删除</a></td>
  </tr>
 </logic:iterate>
 <tr bgcolor="#FFFFFF" height="25">
    <td width="8%" height="25">&nbsp;</td>
    <td width="36%">&nbsp;</td>
    <td width="11%" align="center">&nbsp;</td>
    <td width="9%" align="center">&nbsp;</td>
    <td width="6%" align="center">&nbsp;</td>
    <td width="9%" align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
  </tr>

<tr  bgcolor="#FFFFFF"  height="25">
    <td width="8%" height="25" align="center"><strong><a href="#" onClick="return b()">全选</a></strong></td>
    <td width="36%" align="center">&nbsp;</td>
    <td width="11%" align="center">&nbsp;</td>
    <td width="9%" align="center">&nbsp;</td>
    <td width="6%" align="center">&nbsp;</td>
    <td width="9%" align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
  </tr>

  <tr align="center">
    <td colspan="8" height="22">
	第<bean:write name="pager" property="currentPage"/>页
	共<bean:write name="pager" property="totalPages"/>页
	<html:link action="/listsiteinfo.shtml?pageMethod=first" name="map">首页</html:link>
	<html:link action="/listsiteinfo.shtml?pageMethod=previous" name="map">上一页</html:link>
	<html:link action="/listsiteinfo.shtml?pageMethod=next" name="map">下一页</html:link>
	<html:link action="/listsiteinfo.shtml?pageMethod=last" name="map">尾页</html:link>	</td>
  </tr>
  </form>
</table>
</body>
</html>
