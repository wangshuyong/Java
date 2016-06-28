<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%
	String type = "";
	if(request.getParameter("type")!=null&&!request.getParameter("type").equals("")){
		type = request.getParameter("type");
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="pragma" content="no-cache">
<link href="/admins/css/css_cbfxt.css" rel="stylesheet" type="text/css">
<title>添加信息</title>
<script language="JScript">
var CalendarWebControl = new atCalendarControl();

function gjzReplace(strTemp) {
	strTemp=Replace(strTemp,"，",",");			//替换全角逗号为半角
	strTemp=Replace(strTemp," ",",");			//替换半角空格
	strTemp=Replace(strTemp,"",",");			//替换全角空格

	return strTemp;
}
//信息格式校验

</script>
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
			<html:form action="/newsiteinfo.shtml" method="post">
			<tr>
				<td width="17%" align="center">信息标题：											
				</td>
				<td width="77%" colspan="3">&nbsp;
				<html:text property="title" /> &nbsp;&nbsp;&nbsp;&nbsp;
				信息来源：<html:text property="source" />
			  </td>
			</tr>	
			
			</tr>	
			<tr>
				<td width="17%" align="center">来源链接：</td>
				<td width="77%" colspan="3">&nbsp;
				<html:text property="source_link" /> &nbsp;&nbsp;&nbsp;&nbsp;
				文章作者：<html:text property="author" />
				</td>
			</tr>	
			<tr>
				<td width="17%" align="center">信息类别：</td>
				<td width="77%" colspan="3">&nbsp;
				<html:select property="type">
					 <html:option value="1000">行业动态</html:option>
					 <html:option value="1001">网站推广</html:option>
					 <html:option value="1002">PHP开发</html:option>
					 <html:option value="1003">JAVA开发</html:option>
					 <html:option value="1004">ASP开发</html:option>
					 <html:option value="1005">数据库应用</html:option>
					 <html:option value="1006">网页技术</html:option>
					 <html:option value="1007">图形创意</html:option>
					 <html:option value="1008">文档教程</html:option>
					 <html:option value="1009">javascript</html:option>
					 <html:option value="1010">休闲娱乐</html:option>
				</html:select>
				 &nbsp;&nbsp;&nbsp;&nbsp;
				是否精华导读：
				<html:select property="is_show">
					 <html:option value="0">不是</html:option>
					 <html:option value="1">是</html:option>	
				</html:select>
				</td>
			</tr>
			<tr>
				<td width="17%" align="center">内容概要：</td>
				<td width="77%" colspan="3">&nbsp;
				<html:textarea property="show" cols="54" rows="3" />
				</td>
			</tr>
			<tr>
				<td width="17%" align="center">内容详细：</td>
				<td width="77%" colspan="3">&nbsp;
				<html:textarea property="content" styleId="content" style="width:0px; height:1px" /><iframe name="eWebEditor1" id="eWebEditor1" src="../../editor/eWebEditor.jsp?id=content&style=standard" frameborder="0" scrolling="no" width="90%" height="500"></iframe>
				</td>
			</tr>
			<tr>
				<td width="17%" align="center">备注：</td>
				<td width="77%" colspan="3">&nbsp;
				<html:textarea property="show" cols="54" rows="3" />
				</td>
			</tr>
			<tr align="center"> 
				<td colspan="2">
				<html:submit value="确定"  onclick="check()"/>
				</td>
			</tr>
			</html:form>
</table>
</body>
<script>
	function check(){
		//获取内容参数 
		siteInformationForm.content.value = eWebEditor1.getHTML();
		if(siteInformationForm.title.value==''){
			alert('标题不能为空！');
			siteInformationForm.title.focus();
			return false;
		}else if(siteInformationForm.content.value==''){
			alert('内容不能为空！');
			siteInformationForm.content.focus();
			return false;
		}/*else{
			siteInformationForm.submit();
		}*/
	}
</script>
</html>