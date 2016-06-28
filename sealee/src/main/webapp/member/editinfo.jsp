<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="keywords" content="海乐网,海乐信息,计算机WEB编程,网站推广,java开发,asp开发,php开价,网页设计,设计文档,javascript">
<meta http-equiv="description" content="海乐网,海乐信息,计算机WEB编程,网站推广,java开发,asp开发,php开价,网页设计,设计文档,javascript">
<title>海乐网-个人信息修改</title>
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
	<jsp:include page="../top.jsp"></jsp:include>
	
	<div align="center">
	<html:form action="/domember.shtml" method="post" onsubmit="check();return false;">
		<html:hidden name="member" property="id"/>
		<div id="member_register">
			
			<div id="member_register_left" style="width:400px;">
				<li id="member_register_row" style="width:400px;" ><strong>修改个人信息</strong></li>
				<li id="member_register_row" style="width:400px;">登陆帐号：
					<html:text name="member"  property="username" style=" width:180px;" />
				</li>
				<li id="member_register_row" style="width:400px;">登陆密码：
					<html:password name="member"  property="password" style=" width:180px;" /> </li>
				<li id="member_register_row" style="width:400px;">重复密码：
					<html:password  property="repassword" style=" width:180px;" /> &nbsp;&nbsp;&nbsp;&nbsp;请确认登录密码</li>
				<li id="member_register_row" style="width:400px;">&nbsp;&nbsp;&nbsp;&nbsp;E-mail：
					<html:text name="member"  property="email" style=" width:180px;" />
				</li>
				<li id="member_register_row" style="width:400px;">您的昵称：
					<html:text name="member"  property="petname" style=" width:180px;"  /></li>
				<li id="member_register_row" style="width:400px;">您的性别：
					 <html:radio name="member"  property="sex" value="1">男</html:radio>
					 <html:radio name="member"  property="sex" value="2">女</html:radio>
				</li>
				<li id="member_register_row" style="width:400px;">您的体型：
					 <html:radio name="member"  property="bodily_form" value="1">较胖</html:radio>
					 <html:radio name="member"  property="bodily_form" value="2">适中</html:radio>
					 <html:radio name="member"  property="bodily_form" value="3">较瘦</html:radio>
				</li>
				
				<li id="member_register_row" style="width:400px;">您的职业：
					<html:text name="member"  property="work_type" style=" width:180px;"  />
				</li>
				<li id="member_register_row" style="width:400px;">所在地区：
					<html:text name="member"  property="area" style=" width:180px;"  />
				</li>
				
				<li id="member_register_row" style="width:400px;">验 证 码：
					<html:text property="checknum" style=" width:120px;"  />
				 	<img id="img1" src="image.jsp" border="0" onClick="reloadImage()">
				</li>
				<li id="member_register_row" style="width:400px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<html:submit styleClass="reply_bottom" value="修改"/>
				</li>
				</li>
			</div>
			
			<div id="member_register_right" style="width:200px; border:none">
				<li id="member_register_row" style="width:400px;">
					
				</li>
				<li id="member_register_row" style="width:400px;">您的生日：
					<html:text name="member"  property="birthday" style=" width:180px;"  /> &nbsp;&nbsp;&nbsp;&nbsp;请选择日期
				</li>
				<li id="member_register_row" style="width:400px;">您的身高：
					<html:text name="member"  property="stature" style=" width:180px;"  /> &nbsp;&nbsp;&nbsp;&nbsp;厘米
				</li>
				<li id="member_register_row">显示联系：
					 <html:radio name="member"  property="is_show" value="1">是</html:radio>
					 <html:radio name="member"  property="is_show" value="0">否</html:radio>
				</li>
				<li id="member_register_row">我的主页：
					<html:text name="member"  property="my_index" style=" width:180px;"  />
				</li>
				<li id="member_register_row">qq 号 码：
					<html:text name="member"  property="qq" style=" width:180px;"  />
				</li>
				<li id="member_register_row">联系电话：
					<html:text name="member"  property="phone" style=" width:180px;"  />
				</li>
				<li id="member_register_row">联系地址：
					<html:text name="member"  property="address" style=" width:180px;"  />
				</li>
				<li id="member_register_row">人生格言：
					<html:text name="member"  property="show" style=" width:180px;"  />
				</li>
			</div>
		</div>
	</html:form>
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
