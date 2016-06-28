<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="pragma" content="no-cache">
<link href="/admins/css/css_cbfxt.css" rel="stylesheet" type="text/css">
<title>添加信息</title>
<script language="JScript">
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
			<html:form action="/editadvertise.shtml" method="post" enctype="multipart/form-data" onsubmit="check();return false;">
			<html:hidden name="advertise" property="id"/>
			<tr>
				<td width="17%" align="center">广告标题：											
				</td>
				<td width="77%" colspan="3">&nbsp;
				<html:text name="advertise" property="adv_title" /> &nbsp;&nbsp;&nbsp;&nbsp;
				广告类型：<html:select  name="advertise"  property="adv_type">
					 <html:option value="1">文字广告</html:option>
					 <html:option value="2">图片广告</html:option>	
					 <html:option value="3">首页链接</html:option>	
					 <html:option value="4">内页链接</html:option>
					 <html:option value="5">首页切换图片</html:option>	
				</html:select>
			  </td>
			</tr>	
			
			</tr>	
			<tr>
				<td width="17%" align="center">广告链接：</td>
				<td width="77%" colspan="3">&nbsp;
				<html:text  name="advertise"  property="adv_link" /> &nbsp;&nbsp;&nbsp;&nbsp;
				链接颜色：<html:text name="advertise" property="link_color" />(填写色值)
				</td>
			</tr>	
			<tr>
				<td width="17%" align="center">顺序（负值靠上）：</td>
				<td width="77%" colspan="3">&nbsp;
				<html:text  name="advertise" property="image_height" />
				 &nbsp;&nbsp;&nbsp;&nbsp;
				图片宽度：<html:text name="advertise"  property="image_width" />
				</td>
			</tr>
			<tr>
				<td width="17%" align="center">链接图片：</td>
				<td width="77%" colspan="3">&nbsp;
				<html:file property="adv_image"/>
				</td>
			</tr>
			<tr>
				<td width="17%" align="center">广告生效日期：</td>
				<td width="77%" colspan="3">&nbsp;
				<html:text name="advertise"  property="take_effect_date" />
				</td>
			</tr>
			<tr>
				<td width="17%" align="center">广告到期时间：</td>
				<td width="77%" colspan="3">&nbsp;
				<html:text  name="advertise"  property="ineffective_date" />
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
<script>
	function check(){
		if(advertiseForm.adv_title.value==''){
			alert('链接标题不能为空！');
			advertiseForm.adv_title.focus();
			return false;
		}else if(advertiseForm.adv_link.value==''){
			alert('链接不能为空！');
			advertiseForm.adv_link.focus();
			return false;
		}else{
			advertiseForm.submit();
		}
	}
</script>
</html>