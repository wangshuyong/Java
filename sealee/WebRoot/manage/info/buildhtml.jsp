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
<title>生成HTML</title>

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
			<html:form action="/buildtypehtml.shtml" method="post">
	
			</tr>	
				
			<tr>
				<td width="22%" align="center">生成此类别文章HTML：</td>
				<td width="78%" colspan="3">&nbsp;
				<html:select property="type">
					 <html:option value="">---请选择类别---</html:option>
					 <html:option value="1000">行业动态</html:option>
					 <html:option value="1001">网站推广教程</html:option>
					 <html:option value="1002">PHP技术教程</html:option>
					 <html:option value="1003">JAVA技术教程</html:option>
					 <html:option value="1004">ASP技术教程</html:option>
					 <html:option value="1005">数据库教程</html:option>
					 <html:option value="1006">网页设计教程</html:option>
					 <html:option value="1007">图形创意教程</html:option>
					 <html:option value="1008">设计文档教程</html:option>
					 <html:option value="1009">javascript教程</html:option>
					 <html:option value="1010">休闲娱乐文章</html:option>
					 <html:option value="1011">文档源码下载</html:option>
				</html:select>
		      &nbsp;&nbsp;&nbsp;<html:submit value="生成页面"  onclick=" return check()"/></td>
			</tr>
			
			
			<tr align="center"> 
				<td colspan="2">
								</td>
			</tr>
			<tr align="center"> 
				<td colspan="2">
				<a href="#" onClick="if(window.confirm('你确定发布主页吗')) this.href='buildindexhtml.shtml';"><b>发布主页</b></a>
				</td>
			</tr>
			</html:form>
</table>

</body>
<script>
	function check(){
		//获取内容参数 
		
		if(siteInformationForm.type.value==''){
			alert('请先选择类别！');
			siteInformationForm.type.focus();
			return false;
		}else{
			return true;
		}
	}
</script>
</html>