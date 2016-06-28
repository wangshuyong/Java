<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String member = "",membername="";
	if(session.getAttribute("member")!=null&&!session.getAttribute("member").equals("")){
		membername = (String)session.getAttribute("member");
	}else{
		response.sendRedirect("../login.jsp");
	}
%>
<%
	String type = "";
	if(request.getParameter("type")!=null&&!request.getParameter("type").equals("")){
		type = request.getParameter("type");
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<link href="/admins/css/css_cbfxt.css" rel="stylesheet" type="text/css">
<title>添加信息</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>
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

<script type="text/javascript">
     CKEDITOR.replace('content',{toolbar:'Full', skin : 'kama'));
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
			
				
			<tr>
				<td width="17%" align="center">来源链接：</td>
				<td width="77%" colspan="3">&nbsp;
				<html:text property="source_link" /> &nbsp;&nbsp;&nbsp;&nbsp;
				文章作者：<html:text property="author" value="<%=membername%>" readonly="true" />
				</td>
			</tr>	
			<tr>
				<td width="17%" align="center">信息类别：</td>
				<td width="77%" colspan="3">&nbsp;
				<html:select property="type">
					 <html:option value="1000">职场生涯</html:option>
					 <html:option value="1001">IT技术</html:option>
					 <html:option value="1002">公文百科</html:option>
					 <html:option value="1003">励志书籍</html:option>
					 <html:option value="1004">医药医学</html:option>
					 <html:option value="1005">学生专栏</html:option>
					 <html:option value="1006">网页技术</html:option>
					 <html:option value="1007">图形创意</html:option>
					 <html:option value="1008">文档教程</html:option>
					 <html:option value="1009">javascript</html:option>
					 <html:option value="1010">休闲娱乐</html:option>
					 <html:option value="1011">文档下载</html:option>
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
				<td width="17%" align="center">内容关键字：</td>
				<td width="77%" colspan="3">&nbsp;
				<html:text property="note_keyword" size="70" maxlength="20" />
				</td>
			</tr>
			<tr>
				<td width="17%" align="center">关键字描述：</td>
				<td width="77%" colspan="3">&nbsp;
				<html:text property="note_description" size="70" maxlength="50" />
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
				<html:textarea property="content" style="width:0px; height:1px" />
				<IFRAME ID="eWebEditor1" name="content_html" src="../eWebEditor/eWebEditor.jsp?id=content&style=standard" frameborder="0" scrolling="no" width="90%" height="500"></IFRAME> 
<input type="hidden" name="content" />
				</td>
			</tr>
			<tr align="center"> 
				<td colspan="2">
				<html:submit value="增加" onclick="check();" />
				</td>
			</tr>
			</html:form>
</table>
</body>
<script>
	function check(){
		//获取内容参数 
		siteInformationForm.content.value = eWebEditor1.getHTML();
		if(siteInformationForm.title.value==''||siteInformationForm.title.value==null){
			alert('标题不能为空！');
			siteInformationForm.title.focus();
			return false;
		}else if(siteInformationForm.content.value==''||siteInformationForm.content.value==null){
			alert('内容不能为空！');
			siteInformationForm.content.focus();
			return false;
		}/*else{
			siteInformationForm.submit();
		}*/
	}
</script>
</html>