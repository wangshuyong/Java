<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String memberid = "";
	if(session.getAttribute("memberid")!=null&&!session.getAttribute("memberid").equals("")){
		memberid = (String)session.getAttribute("memberid");
	}else{
		response.sendRedirect("../index.html");
	}
%>

<html>
<head>
<base href="<%=basePath%>">
<meta name="keywords" content="海乐网,海乐信息,计算机WEB编程,网站推广,java开发,asp开发,php开价,网页设计,设计文档,javascript">
<meta http-equiv="description" content="海乐网,海乐信息,计算机WEB编程,网站推广,java开发,asp开发,php开价,网页设计,设计文档,javascript">
<title>海乐网-网站声明</title>
<link rel="stylesheet" href="../css/style.css" type="text/css">
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
		<div id="httplinks">
			
			<div id="httplinks_left">
				<li id="httplinks_row" style="background:#D4D6E5; text-align:center"><strong>工具菜单</strong></li>
				<li id="httplinks_row" style="margin-top:10px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img align="absmiddle" src="image/member_001.gif" border="0"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="member/newarticle.jsp" target="_self">发表新文章</a></li>
				<li id="httplinks_row" style="margin-top:5px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img align="absmiddle" src="image/member_001.gif" border="0"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="memberarticles.shtml" target="_self">我的文章</a></li>
				<li id="httplinks_row" style="margin-top:5px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img align="absmiddle" src="image/member_001.gif" border="0"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我的空间</li>
				<li id="httplinks_row" style="margin-top:5px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img align="absmiddle" src="image/member_001.gif" border="0"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我的留言</li>
				<li id="httplinks_row" style="margin-top:5px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img align="absmiddle" src="image/member_001.gif" border="0"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我的积分</li>
				<li id="httplinks_row" style="margin-top:5px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img align="absmiddle" src="image/member_001.gif" border="0"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../editmember.shtml?id=<%=memberid%>" target="_self">修改个人信息</a></li>
				</li>
				<li id="httplinks_row" style="margin-top:5px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img align="absmiddle" src="image/member_001.gif" border="0"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="outlogin.shtml" target="_self">注销登陆</a></li>
				</li>
			</div>
		
			<div id="httplinks_right">
				<li id="httplinks_li" style=" text-align:center;"><strong>会员最新文章</strong></li>
				<li id="note_li"></li>
				</li>
			</div>
		</div>
	</div>
	<jsp:include page="../bottom.jsp"></jsp:include>
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
