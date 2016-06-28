<%@ page language="java" pageEncoding="UTF-8"%>

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
<title>海乐网-友情链接</title>
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
	<div align="center">
		<div id="httplinks">
			
			<div id="httplinks_left">
				<li id="httplinks_row" style="background:#D4D6E5; text-align:center;"><strong>链接要求</strong></li>
				<li id="httplinks_row">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. 网站Alexa排名不低于1000000名</li>
				<li id="httplinks_row">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. Google PR 不小于3 </li>
				<li id="httplinks_row">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3. 互联网行业相关网站 </li>
				<li id="httplinks_row">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4. 网站内容符合我国现行法律</li>
				<li id="httplinks_row">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5. 网站打开顺畅流通、无病毒</li>
				<li id="httplinks_row" style="background:#D4D6E5; text-align:center;"><strong>联系方式</strong></li>
				<li id="httplinks_row">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email: sealee.com@163.com</li>
				<li id="httplinks_row">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电话 : 13623857715</li>
				<li id="httplinks_row">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;QQ : 408199514</li>
				</li>
			</div>
		
			<div id="httplinks_right">
				<li id="httplinks_li" style=" text-align:center;"><strong>友情链接</strong></li>
<logic:iterate id="links" name="clInfos" indexId="idx">
				<li id="httplinks_li_one">
				<a href="<bean:write name="links" property="adv_link"/>" target="_blank">
				<logic:empty name="links" property="link_color">
				<font color="#2266AA"><bean:write name="links" property="adv_title"/></font>
				</logic:empty>
				<logic:notEmpty name="links" property="link_color">
				<font color="<bean:write name="links" property="link_color"/>"><bean:write name="links" property="adv_title"/></font>
				</logic:notEmpty>
				</a>
				</li>
</logic:iterate>
			</div>
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
