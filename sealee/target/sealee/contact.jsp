<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<html>
<head>
<base href="<%=basePath%>">
<meta name="keywords" content="网页设计教程，网页设计资料，编程技术，网站编程，设计文档，java教程，jsp教程，php教程，asp教程，javascript教程，css教程">
<meta name="description" content="网页设计教程，网页设计资料，编程技术教程，网站编程技术，系统设计文档，java教程，jsp教程，php教程，asp教程，javascript教程，css教程">
<title>海乐网-联系我们</title>
<link rel="stylesheet" href="css/style.css" type="text/css">
<style type="text/css">
<!--
#Layer1 {
	position:absolute;
	width:145px;
	height:18px;
	z-index:0;
	left: 652px;
	top: 408px;
}
-->
</style>
</head>
<body style="text-align:center;">
<div id="kuang">
	<jsp:include page="top.jsp"></jsp:include>
	
	
		<div id="contact" align="center">
		
			<div id="contact_right" >
				<li id="contact_li" style=" text-align:center;"><strong>联系我们</strong></li>
				<li id="contact_note_li">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;如果您有网站开发等相关信息以及业务合作意向，请联系我们，我们一起进步，共赢明天。<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;E-mail： sealee.com@163.com<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;手 机 ： 13623857715<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电 话 ： 0371-********<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;联系QQ：408199514<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;联系人：贾先生。
				</li>
				</li>
			</div>
		</div>
	
	<jsp:include page="bottom.jsp"></jsp:include>
</div>
</body>
<script>
	function reloadImage() 
	{ 
	 document.getElementById('img1').src = "image.jsp"; 
	} 
	function check(){
		//获取内容参数
		if(memberForm.username.value==''){
			alert('账号不能为空！');
			return false;
			memberForm.username.focus();
		}else if(memberForm.password.value==''){
			alert('密码不能为空！');
			memberForm.password.focus();
			return false;
		}else if(memberForm.checknum.value==''){
			alert('验证码不能为空！');
			memberForm.checknum.focus();
			return false;
		}else{
			memberForm.submit();
		}
	}
</script>
</html>
