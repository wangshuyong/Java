<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
<title>免费会员注册</title>
<link rel="stylesheet" href="<%=basePath%>/css/style.css" type="text/css">
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
         <s:form id="form" action="register" namespace="/user" method="post" onsubmit="check();">
		    <div id="member_register_left">
				<li id="member_register_row"><strong>新用户注册</strong> <s:fielderror cssStyle="font-size:8px;color:red;text-align:right;">  <s:param>phone</s:param> </s:fielderror> </li>
			    <li id="member_register_row">手 机 号：<s:textfield name="phone" style="width:180px;" id="phone"/> </li>
				<li id="member_register_row">密&nbsp;&nbsp;&nbsp;&nbsp;码：<s:password name="password" style="width:180px;" id="password"/><s:fielderror cssStyle="line-height:2;font-size:8px;color:red;text-align:right;font-weight:bold">  
                    <s:param>password</s:param>   
                </s:fielderror>	 </li>
				<li id="member_register_row">重复密码：<s:password name="repassword" style="width:180px;" id="repassword"/><s:fielderror cssStyle="font-size:8px;color:red;text-align:right;font-weight:bold">  
                    <s:param>repassword</s:param>     
                </s:fielderror>  </li>
				<li id="member_register_row">E-mail：&nbsp;&nbsp;&nbsp;&nbsp;<s:textfield name="email" style="width:180px" id="email"/> </li>
				<li id="member_register_row">您的性别：
					 <s:radio list="#{'1':'先生','0':'女士'}" name="sex" value="1" id="sex"/>
				<li id="member_register_row">验 证 码：<s:textfield property="checknum" style="width:120px;" label=""/> <img id="img1" src="<%=basePath%>/image.jsp" border="0" onClick="reloadImage()">
				<s:debug></s:debug>
				 <!--<a href="#" onClick="reloadImage()">看不清楚，换一张</a>-->
				</li>
				<li id="member_register_row">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" styleClass="reply_bottom" value="注册"/>
				</li>
				</li>          
			</div>
          </s:form>
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
	 document.getElementById('img1').src ="<%=basePath%>/image.jsp"; 
	} 

	function check(){
		if(document.getElementById('phone').value==''){
			alert('账号不能为空！');
			document.getElementById('phone').value='';
			return false;
		}else if(document.getElementById("phone").value.length<11||document.getElementById("phone").value.length>13){
			alert('手机号码长度应该为11个字符！');
			document.getElementById('phone').value='';
			return false;
		}else if(document.getElementById("password").value==''){
			alert('密码不能为空！');
			document.getElementById("password").value='';
			return false;
		}else if(document.getElementById("password").value.length<6||document.getElementById("password").value.length>18){
			alert('密码长度应介于6到18位！');
			document.getElementById("password").value='';
			return false;
		}else if(document.getElementById("password").value!=document.getElementById("repassword").value){
			alert('两次密码不相符！');
			document.getElementById("repassword").value='';
			return false;
		}else if(document.getElementById("email").value==''){
			alert('请填写保密邮箱！');
			document.getElementById("email").value='';
			return false;
		}else if(document.getElementById("checknum").value==''){
			alert('请填写验证码！');
			document.getElementById("checknum").value='';
			return false;
		}else{
			document.getElementById("form").submit();
		}
	}
</script>
</html>
