<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="keywords" content="网页设计教程，网页设计资料，编程技术，网站编程，设计文档，java教程，jsp教程，php教程，asp教程，javascript教程，css教程">
<meta name="description" content="网页设计教程，网页设计资料，编程技术教程，网站编程技术，系统设计文档，java教程，jsp教程，php教程，asp教程，javascript教程，css教程">
<title>海乐网-免费会员注册</title>
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
<body  style="text-align:center;">
<div id="kuang">
	<jsp:include page="top.jsp"></jsp:include>
	
	<div align="center">
		<div id="member_register">
			<html:form action="/newmember.shtml" method="post" onsubmit="check();return false;">
			<div id="member_register_left">
				<li id="member_register_row"><strong>新用户注册</strong></li>
				<li id="member_register_row">登陆帐号：<html:text property="username" style=" width:180px;" /> &nbsp;&nbsp;&nbsp;&nbsp;请输入4-12位用户名</li>
				<li id="member_register_row">登陆密码：<html:password property="password" style=" width:180px;" /> </li>
				<li id="member_register_row">重复密码：<html:password property="repassword" style=" width:180px;" /> &nbsp;&nbsp;&nbsp;&nbsp;请确认登录密码</li>
				<li id="member_register_row">&nbsp;&nbsp;&nbsp;&nbsp;E-mail：<html:text property="email" style=" width:180px;" /> &nbsp;&nbsp;&nbsp;&nbsp;请输入电子邮件地址</li>
				<li id="member_register_row">您的昵称：<html:text property="petname" style=" width:180px;"  /> &nbsp;&nbsp;&nbsp;&nbsp;请输入昵称</li>
				<li id="member_register_row">您的性别：
					 <html:radio property="sex" value="1">男</html:radio>
					 <html:radio property="sex" value="2">女</html:radio>
				<li id="member_register_row" >验 证 码：<html:text property="checknum" style=" width:120px;"  />
				 <img id="img1" src="image.jsp" border="0" onClick="reloadImage()">
				 <!--<a href="#" onClick="reloadImage()">看不清楚，换一张</a>-->
				</li>
				<li id="member_register_row">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<html:submit styleClass="reply_bottom" value="注册"/>
				</li>
				</li>
			</div>
			</html:form>
			<div id="member_register_right">
				<li id="member_register_li"><strong>注册须知：</strong></li>
				<li id="member_register_li">在本站注册的会员，必须遵守《互联网电子公告服务管理规定》，不得在本站发表诽谤他人，侵犯他人隐私，侵犯他人知识产权，传播病毒，政治言论，商业讯息等信息。 
在所有在本站发表的文章，本站都具有最终编辑权，并且保留用于印刷或向第三方发表的权利，如果你的资料不齐全，我们将有权不作任何通知使用你在本站发布的作品。</li>
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
		if(memberForm.username.value==''){
			alert('账号不能为空！');
			memberForm.username.focus();
			return false;
		}else if(memberForm.username.value.length<4||memberForm.username.value.length>12){
			alert('账号长度应该为4-12个字符！');
			memberForm.username.focus();
			return false;
		}else if(memberForm.password.value==''){
			alert('密码不能为空！');
			memberForm.password.focus();
			return false;
		}else if(memberForm.password.value!=memberForm.repassword.value){
			alert('两次密码不相符！');
			memberForm.repassword.focus();
			return false;
		}else if(memberForm.email.value==''){
			alert('请填写保密邮箱！');
			memberForm.email.focus();
			return false;
		}else if(memberForm.petname.value==''){
			alert('填写您的昵称！');
			memberForm.petname.focus();
			return false;
		}else if(memberForm.checknum.value==''){
			alert('请填写验证码！');
			memberForm.checknum.focus();
			return false;
		}else{
			memberForm.submit();
		}
	}
</script>
</html>
