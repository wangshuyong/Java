<%@ page language="java" pageEncoding="UTF-8"%>
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
<title>海乐网-网站声明</title>
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
			<!--	<li id="httplinks_row" style="background:#D4D6E5; text-align:center;"><strong>免责声明</strong></li>
				<li id="httplinks_row">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. 网站Alexa排名不低于100000名</li>
				<li id="httplinks_row">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. Google PR 不小于 2 </li>
				<li id="httplinks_row">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3. 互联网行业相关网站 </li>
				<li id="httplinks_row">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4. 网站内容符合我国现行法律</li>
				<li id="httplinks_row">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5. 网站打开顺畅流通、无病毒</li>-->
				<li id="httplinks_row" style="background:#D4D6E5; text-align:center;"><strong>联系方式</strong></li>
				<li id="httplinks_row">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email: sealee.com@163.com</li>
				<li id="httplinks_row">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电话 : 13623857715</li>
				<li id="httplinks_row">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q  Q : 408199514</li>
				</li>
			</div>
		
			<div id="httplinks_right">
				<li id="httplinks_li" style=" text-align:center;"><strong>网站声明</strong></li>
				<li id="note_li">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第一条 本网站郑重提醒访问者：请在转载、上载或者下载有关作品时务必尊重该作品的版权、著作权；如果您发现有您未署名的作品，请立即和我们联系，我们会在第一时间加上您的署名或作相关处理，如果本网站上的信息侵犯了您的著作权，请联系我们，我们会在立即处理。<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第二条 本网站作品以及仅代表作者本人的观点，不代表本网站的观点和看法，与本网站立场无关，相关责任作者自负。<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第三条 本网站有权将在本网站内发表的作品用于其他用途，包括网站、电子杂志等，作品有附带版权声明者除外。<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第四条 当本网站以链接形式推荐其他网站内容时，本网站并不对这些网站或资源的可用性负责，且不保证从这些网站获取的任何内容、产品、服务或其他材料的真实性、合法性，对于任何因使用或信赖从此类网站或资源上获取的内容、产品、服务或其他材料而造成（或声称造成）的任何直接或间接损失，本网站均不承担任何责任。<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第五条 访问者在本网站注册时提供的一些个人资料，本网站除您本人同意及第九条规定外不会将用户的任何资料以任何方式泄露给任何一方。由于用户将个人密码告知他人或与他人共享注册账户，由此导致的任何个人资料泄露，本网站不负任何责任。<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第五条 访问者在本网站注册时提供的一些个人资料，本网站除您本人同意外不会将用户的任何资料以任何方式泄露给任何一方。由于用户将个人密码告知他人或与他人共享注册账户，由此导致的任何个人资料泄露，本网站不负任何责任。<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第六条 　　本网站包含的所有内容（包括但不限于：文本、图形、图片、视像及声音内容、LOGO标识、版面设计、专栏目录与名称、内容分类）的所有权及相关版权均归海乐网所有。 
　　本网站的内容和软件均受《中华人民共和国著作权法》及其它相关法律法规的保护。任何单位或个人将本网站提供的内容或服务用于商业宣传、招商、广告等商业用途时，需征得海乐网的书面许可；将本网站提供的内容或服务用于非商业用途时，应遵守著作权法以及其他相关法律法规的规定，不得侵犯网站所有者及相关权利人的合法权益，否则造成的一切损失由用户承担。
				</li>
				</li>
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
