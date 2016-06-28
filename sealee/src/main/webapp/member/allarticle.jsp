<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String memberid = "",membername="";
	if(session.getAttribute("memberid")!=null&&!session.getAttribute("memberid").equals("")){
		memberid = (String)session.getAttribute("memberid");
		membername = (String)session.getAttribute("member");
	}else{
		response.sendRedirect("../index.html");
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="keywords" content="海乐网,海乐信息,计算机WEB编程,网站推广,java开发,asp开发,php开价,网页设计,设计文档,javascript">
<meta http-equiv="description" content="海乐网,海乐信息,计算机WEB编程,网站推广,java开发,asp开发,php开价,网页设计,设计文档,javascript">
<title>海乐网-<%=membername%>发表的的文章</title>
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="css/css.css" type="text/css">
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
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
.STYLE3 {
	color: #6C2D00;
	font-size: 14px;
}
.STYLE4 {color: #000000}
.STYLE6 {color: #999999}
#Layer1 {
	position:absolute;
	width:145px;
	height:18px;
	z-index:0;
	left: 652px;
	top: 408px;
}
.STYLE8 {font-size: 16px}
.STYLE9 {
	font-size: 14px;
	font-weight: bold;
}
.STYLE10 {font-size: 14px; font-weight: bold; color: #2445ec; }
.STYLE11 {font-size: 11px}
.STYLE13 {color: #000000; font-size: 11px; }
.STYLE14 {
	color: #2445ec;
	font-size: 12px;
}
-->
</style>
</head>
<body style="text-align:center;">
<div id="kuang">
	<jsp:include page="../top.jsp"></jsp:include>
	
	<div  align="center" style="margin-bottom:-15px;">
	<html:form action="/newmemberarticle.shtml" method="post">
			<div id="member_register" >
			<div id="httplinks_left">
				<li id="httplinks_row" style="background:#D4D6E5; text-align:center"><strong>工具菜单</strong></li>
				<li id="httplinks_row" style="margin-top:10px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img align="absmiddle" src="image/member_001.gif" border="0"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="member/newarticle.jsp" target="_self">发表新文章</a></li>
				<li id="httplinks_row" style="margin-top:5px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img align="absmiddle" src="image/member_001.gif" border="0"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="memberarticles.shtml" target="_self">我的文章</a></li>
				<li id="httplinks_row" style="margin-top:5px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img align="absmiddle" src="image/member_001.gif" border="0"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我的空间</li>
				<li id="httplinks_row" style="margin-top:5px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img align="absmiddle" src="image/member_001.gif" border="0"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我的留言</li>
				<li id="httplinks_row" style="margin-top:5px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img align="absmiddle" src="image/member_001.gif" border="0"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我的积分</li>
				<li id="httplinks_row" style="margin-top:5px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img align="absmiddle" src="image/member_001.gif" border="0"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="editmember.shtml?id=<%=memberid%>" target="_self">修改个人信息</a></li>
				<li id="httplinks_row" style="margin-top:5px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img align="absmiddle" src="image/member_001.gif" border="0"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="outlogin.shtml" target="_self">注销登陆</a></li>
				</li>
				</li>
			</div>
			<div style="height:520px;width:500px;">
			<div id="httplinks_right" style="height:520px; float:left; width:500px;">
				<div id="httplinks_li" style="text-align:center"><strong>文章列表</strong></div>
<logic:iterate id="infoall" name="clInfos" indexId="idx">				
				<div align="left" id="list_info_row">
					<li id="list_line_li_title">
					&nbsp;&nbsp;&nbsp;<span class="STYLE8">&nbsp;</span>
					<A href="articles.shtml?article=<bean:write name="infoall" property="id"/>" target="_blank" class="STYLE10">
					<bean:write name="infoall" property="title"/>
					</A>
					</li>
					<li class="STYLE4 STYLE11" id="list_line_li_time">
					<bean:write name="infoall" property="date_created" format="MM/dd"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="memberinfo.shtml?id=<bean:write name="infoall" property="id"/>">编辑</a> <a href="#" onClick="if(window.confirm('你确定删除吗')) this.href='deletememberinfo.shtml?id=<bean:write name="infoall" property="id"/>';">删除</a>
					</li>
				</div>
				<div align="left" id="list_info_row_content">
					<li id="list_line_li_content">
					&nbsp;&nbsp;&nbsp;<span class="STYLE8">&nbsp;</span><bean:write name="infoall" property="show"/>.... 
					[<A href="articles.shtml?article=<bean:write name="infoall" property="id"/>" target="_blank" class="STYLE10"><font style="font-size:11px">阅读全文</font></A>]
					</li>		
				</div>
</logic:iterate>
				
			</div>
			<div style=" text-align:center;list-style:none;width=500px;margin-bottom:5px; margin-top:21px;margin-left:100px; height:30px;" class="STYLE9 STYLE14">
					<nobr>
					第<bean:write name="pager" property="currentPage"/>页
					共<bean:write name="pager" property="totalPages"/>页
					<html:link action="/memberarticles.shtml?pageMethod=first" name="map">首页</html:link>
					<html:link action="/memberarticles.shtml?pageMethod=previous" name="map">上一页</html:link>
					<html:link action="/memberarticles.shtml?pageMethod=next" name="map">下一页</html:link>
					<html:link action="/memberarticles.shtml?pageMethod=last" name="map">尾页</html:link>
					</nobr>
			</div>
			</div>
		</div>
	</html:form>
	</div>
	<div id="clear"></div>
	<jsp:include page="bottom.jsp"></jsp:include>
</div>
</body>
</html>
