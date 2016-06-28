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
<title>海乐网-广告服务</title>
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
				<li id="httplinks_row" style="background:#D4D6E5; text-align:center;"><strong>联系方式</strong></li>
				<li id="httplinks_row">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email: sealee.com@163.com</li>
				<li id="httplinks_row">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电话 : 13623857715</li>
				<li id="httplinks_row">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q  Q : 408199514</li>
				</li>
			</div>
		
			<div id="httplinks_right">
				<li id="httplinks_li" style=" text-align:center;"><strong>广告服务</strong></li>
				<li id="note_li">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第一条 在不影响网站信息浏览的情况下，本站为广告商提供广告服务，本站用户群体为编程技术人员以及网站维护推广人员，请你投放广告时候投放到最适合你的用户群体。<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第二条 所有投放广告，一律先钱后上广告，广告按月支付，本站不欺骗，也不要高价，广告不做测试、也不承诺多少点击和效果、能给你带来多少利润。广告三日内，可以退货。扣除20%折腾成本费用。<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第三条 广告到期后系统自动拿下，客户如有需求续租广告请提前续费 我们不提前通知。<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第四条 因为是个人网站，所以广告主请自行解决发票问题。<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第五条 广告种类分为：banner 60px*468px &nbsp;&nbsp;|&nbsp;&nbsp; banner 60px*250px &nbsp;&nbsp;|&nbsp;&nbsp; 首页文字链接 &nbsp;&nbsp;|&nbsp;&nbsp; 首页中部图片60px*485px <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;首页右侧图片60px*298px &nbsp;&nbsp;|&nbsp;&nbsp;首页底部通栏图片70px*978px&nbsp;&nbsp;|&nbsp;&nbsp;分类信息页面文字链接&nbsp;&nbsp;|&nbsp;&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;分类信息右侧图片60px*298px&nbsp;&nbsp;|&nbsp;&nbsp;分类信息底部70px*670px&nbsp;&nbsp;|&nbsp;&nbsp;信息浏览页面文字链接&nbsp;&nbsp;|&nbsp;&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;信息浏览页面右侧图片60px*298px&nbsp;&nbsp;|&nbsp;&nbsp;信息浏览页面底部70px*670px。<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第六条 一次购买本站多月广告更划算，因为我们在努力发展中。
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
