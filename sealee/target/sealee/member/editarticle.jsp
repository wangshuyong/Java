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
		response.sendRedirect("login.jsp");
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="keywords" content="海乐网,海乐信息,计算机WEB编程,网站推广,java开发,asp开发,php开价,网页设计,设计文档,javascript">
<meta http-equiv="description" content="海乐网,海乐信息,计算机WEB编程,网站推广,java开发,asp开发,php开价,网页设计,设计文档,javascript">
<title>海乐网-发表文章</title>
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
<body topmargin=0>
	<jsp:include page="../top.jsp"></jsp:include>
	
	<div align="center" style="margin-top:-15px; margin-bottom:-15px;">
	<html:form action="/editmemberinfo.shtml" method="post">
		<html:hidden name="memberinfo" property="id"/>
		<div id="member_register">
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
			<div id="member_register_left" style="width:400px;border-top:solid 3px #AADD44;border-left:solid 3px #AADD44;border-right:solid 3px #AADD44;border-bottom:solid 3px #AADD44;">
				<li id="httplinks_li" style="text-align:center"><strong>发表文章</strong></li>
				<li id="httplinks_li">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;文章标题：
					<html:text name="memberinfo" property="title" style="width:350px;" />
				</li>
				<li id="httplinks_li">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;信息来源：
					<html:text name="memberinfo"  property="source"  style="width:350px;"  />
				</li>
				<li id="httplinks_li">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;来源链接：
					<html:text name="memberinfo"  property="source_link"  style="width:350px;"  /> &nbsp;&nbsp;&nbsp;&nbsp;完整URL如：http://www.sealee.com</li>
				<li id="httplinks_li">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;文章作者：
					<html:text name="memberinfo"  property="author" value="<%=membername%>" readonly="true"/>
				</li>
				<li id="httplinks_li" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;信息类别：
				<html:select  name="memberinfo"  property="type">
					 <html:option value="">--选择类别--</html:option>
					 <html:option value="1000">行业动态</html:option>
					 <html:option value="1001">网站推广</html:option>
					 <html:option value="1002">PHP开发</html:option>
					 <html:option value="1003">JAVA开发</html:option>
					 <html:option value="1004">ASP开发</html:option>
					 <html:option value="1005">数据库应用</html:option>
					 <html:option value="1006">网页技术</html:option>
					 <html:option value="1007">图形创意</html:option>
					 <html:option value="1008">文档教程</html:option>
					 <html:option value="1009">javascript</html:option>
					 <html:option value="1010">休闲娱乐</html:option>
				</html:select>	
				</li>
				<li id="httplinks_li">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;内容概要：
					<html:textarea  name="memberinfo"  property="show" cols="54" rows="3" />
				</li>
				<li id="httplinks_li">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;详细内容：<br>
					<html:textarea  name="memberinfo"  property="content" styleId="content" style="width:0px; height:1px" /><iframe name="eWebEditor1" id="eWebEditor1" src="editor/eWebEditor.jsp?id=content&style=standard" frameborder="0" scrolling="no" width="100%" height="500"></iframe>
				</li>
				
			
				<li id="httplinks_li" style="border-bottom:0px; margin-top:5px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<html:submit  styleClass="reply_bottom" value="确定"  onclick="return check()"/>
				</li>
				</li>
			</div>
		</div>
	</html:form>
	</div>
	<jsp:include page="bottom.jsp"></jsp:include>
</body>
<script>
	function reloadImage() 
	{ 
	 document.getElementById('img1').src = "image.jsp"; 
	} 

	function check(){
		siteInformationForm.content.value = eWebEditor1.getHTML();
		if(siteInformationForm.title.value==''){
			alert('文章标题不能为空！');
			siteInformationForm.title.focus();
			return false;
		}else if(siteInformationForm.type.value==''){
			alert('请先选择文章类型！');
			siteInformationForm.type.focus();
			return false;
		}else if(siteInformationForm.content.value==''){
			alert('文章内容不能为空！');
			siteInformationForm.content.focus();
			return false;
		}else{
			return true;
		}
	}
</script>
</html>
