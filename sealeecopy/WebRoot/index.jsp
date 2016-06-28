<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String member = "";
	if(session.getAttribute("member")!=null&&!session.getAttribute("member").equals("")){
		member = (String)session.getAttribute("member");
	}
%>

<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="网页设计教程，网页制作教程，网页设计资料，编程技术，网站编程资料教程，系统设计文档，java教程，jsp教程，php教程，asp教程，javascript教程，css教程">
<meta name="description" content="网页设计教程，网页制作教程，网页设计技术资料文档，编程技术资料文章，网站编程技术教程，系统设计文档，java技术资料，jsp技术教程、php教程、asp教程、javascript技术教程，css样式设计教程。网络编程资料">
<meta name="y_key" content="662168cba92c1f9b" /> 
<title>海乐网-专业的WEB开发技术，编程技术，网页设计，设计文档，网站推广信息</title>
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="css/css.css" type="text/css">
<script src="js/yu.js" type="text/javascript"></script>
<script src="js/tb.js" type="text/javascript"></script>
<style type="text/css">
<!--
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
-->
</style>
</head>
<body topmargin=0>
	<jsp:include page="top.jsp"></jsp:include>
	<!------广告栏----->
	<div id="topAdvertise">
	<script type="text/javascript"><!--
google_ad_client = "pub-3815888257365205";
/* 728x90, 创建于 09-2-15 */
google_ad_slot = "5510414093";
google_ad_width = 728;
google_ad_height = 90;
//-->
</script>
<script type="text/javascript"
src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>	
   </div>
	<!-------网页正文栏----------->
	<div align="center" id="body_all">
		<!----正文左侧内容--------->
		<div id="body_left" align="left">
			<!---会员信息--->
			<div id="member_info">
				<li id="member_info_row_title">&nbsp;&nbsp;&nbsp; &nbsp;<strong>会员中心</strong> </li>
				<%if(member!=null&&!member.equals("")){%>
				<li id="member_info_row">&nbsp;&nbsp;&nbsp; &nbsp;当前用户：<strong><font color="#FF0000"><%=member%></font></strong> </li>
				<li id="member_info_row">&nbsp;&nbsp;&nbsp; &nbsp;<a href="member/newarticle.jsp" target="_self">发表文章</a>&nbsp;&nbsp;&nbsp; &nbsp;我的留言</li>
				<li id="member_info_row">&nbsp;&nbsp;&nbsp; &nbsp;<a href="member/index.jsp" target="_self">我的空间</a>&nbsp;&nbsp;&nbsp; &nbsp;<a href="member/index.jsp" target="_self">我的收藏</a></li>
				<li id="member_info_row">&nbsp;&nbsp;&nbsp; &nbsp;<a href="member/main.jsp" target="_self"><span class="STYLE2">控制面板</span></a>&nbsp;&nbsp;&nbsp; &nbsp;<a href="outlogin.shtml" target="_self">注销登陆</a></li>				
				<%}else{%>
				<li id="member_info_row">&nbsp;&nbsp;&nbsp; &nbsp;当前状态：<strong>游客</strong> </li>
				<li id="member_info_row">&nbsp;&nbsp;&nbsp; &nbsp;发表文章&nbsp;&nbsp;&nbsp; &nbsp;我的留言</li>
				<li id="member_info_row">&nbsp;&nbsp;&nbsp; &nbsp;我的空间&nbsp;&nbsp;&nbsp; &nbsp;我的收藏</li>
				<li id="member_info_row">&nbsp;&nbsp;&nbsp; &nbsp;<span class="STYLE2"><a href="login.jsp" target="_self">马上登录</a></span>&nbsp;&nbsp;&nbsp; &nbsp;<span class="STYLE1"><a href="register.jsp" target="_self"><font color="red">注册会员</font></a></span></li>
				<%}%>
				
			</div>
			<!----文章点击排行------->
			<div id="note_top">
				<li align="left" id="note_top_row_title">&nbsp;&nbsp;&nbsp; &nbsp;<strong>本周TOP</strong> </li>
<logic:iterate id="infoalltop" name="infoalltop" indexId="idx">
			<li id="note_top_row">
				<A href="html/<bean:write name="infoalltop" property="type"/>/<bean:write name="infoalltop" property="id"/>.html" target="_blank" class="STYLE10">
			<script language="javascript">
			var temptitle = '<bean:write name="infoalltop" property="title"/>';
			document.write(temptitle.substring(0,11));
			</script>
				</A>
			</li>
</logic:iterate>
			</div>
			
			<div id="left_adv">
<script type="text/javascript"><!--
google_ad_client = "pub-3815888257365205";
/* 180x90, 创建于 09-2-15 */
google_ad_slot = "7319069659";
google_ad_width = 180;
google_ad_height = 90;
//-->
</script>
<script type="text/javascript"
src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>
			</div>
			
			<div id="left_info">
				<li id="left_info_row_title">&nbsp;&nbsp;&nbsp; &nbsp;<strong>会员排行</strong> </li>
<%int i=0;%>
<logic:iterate id="membertop" name="membertop" indexId="idx">
			
				<li style="height:20px; line-height:20px; list-style:inside; float:left; width:150px;">
				&nbsp;&nbsp;&nbsp; &nbsp;<font color="#FF0000"><b><%=++i%> .</b></font>
			<script language="javascript">
			var temptitle = '<bean:write name="membertop" property="petname"/>';
			document.write(temptitle.substring(0,13));
			</script>
				</li>
				<li style="height:20px; line-height:20px; list-style:inside; float:left; width:27px;">
				<span class="STYLE6"><bean:write name="membertop" property="integral"/></span>
				</li>
			
</logic:iterate>
			</div>
			
		</div>
		<!-----正文中间部分-------->
		<div id="body_center" align="left">
			<!---经验分析信息--->
			<div id="center_info">
				<li align="left" id="center_info_row_title">&nbsp;&nbsp;<span class="STYLE3">&nbsp; <strong>
				<a class="headLink" href="html/1003/index.html" target="_blank"><font color="#6C2D00">Java技术教程</font></a> &nbsp;<span class="STYLE4">&amp;</span> &nbsp; 
				<a class="headLink" href="html/1004/index.html" target="_blank"><font color="#6C2D00">ASP技术教程</font></a> &nbsp;<span class="STYLE4">&amp;</span> &nbsp; 
				<a class="headLink" href="html/1002/index.html" target="_blank"><font color="#6C2D00">PHP技术教程</font></a> &nbsp;<span class="STYLE4">&amp;</span> &nbsp;
				<a class="headLink" href="html/1006/index.html" target="_blank"><font color="#6C2D00">网页设计教程</font></a></strong></span></li>
			  	
				<!---首页显示分类内容--->	
<logic:iterate id="infotop" name="infotop" indexId="idx">
			<li id="list_line_index_title">&nbsp;
				<A href="html/<bean:write name="infotop" property="type"/>/<bean:write name="infotop" property="id"/>.html" target="_blank" class="STYLE10">
				<bean:write name="infotop" property="title"/>
				</A>
			</li>
			<li id="list_line_index_time">
			<logic:equal name="infotop" property="type" value="1002">PHP技术教程</logic:equal><logic:equal name="infotop" property="type" value="1003">Java技术教程</logic:equal><logic:equal name="infotop" property="type" value="1004">ASP技术教程</logic:equal><logic:equal name="infotop" property="type" value="1006">网页设计教程</logic:equal>
				<span class="STYLE6">
				<bean:write name="infotop" property="date_created" format="dd 日"/>
				</span>
			</li>
</logic:iterate>
		  </div>
			<div id="center_ad1" align="center">
			<script type="text/javascript"><!--
google_ad_client = "pub-3815888257365205";
/* 468x60, 创建于 09-2-15 */
google_ad_slot = "4702466330";
google_ad_width = 468;
google_ad_height = 60;
//-->
</script>
<script type="text/javascript"
src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>
			</div>
			<!----数据库以及做站------->
			<div id="center_info">
				<li align="left" id="center_info_row_title">&nbsp;&nbsp;<span class="STYLE3">&nbsp;<strong>
				<a class="headLink" href="html/1001/index.html" target="_blank"><font color="#6C2D00">网站推广教程</font></a> &nbsp;<span class="STYLE4">&amp;</span> &nbsp; 
				<a class="headLink" href="html/1005/index.html" target="_blank"><font color="#6C2D00">数据库教程</font></a> &nbsp; <span class="STYLE4">&amp;</span> &nbsp;
				<a class="headLink" href="html/1007/index.html" target="_blank"><font color="#6C2D00">图形创意教程</font></a>
				 </strong></span> </li>
				 <!----中上部显示分类信息---->
<logic:iterate id="infomiddle" name="infomiddle" indexId="idx">
			<li id="list_line_index_title">&nbsp;
				<A href="html/<bean:write name="infomiddle" property="type"/>/<bean:write name="infomiddle" property="id"/>.html" target="_blank" class="STYLE10">
				<bean:write name="infomiddle" property="title"/>
				</A>
			</li>
			<li id="list_line_index_time">
			<logic:equal name="infomiddle" property="type" value="1001">网站推广教程</logic:equal><logic:equal name="infomiddle" property="type" value="1005">数据库教程</logic:equal><logic:equal name="infomiddle" property="type" value="1007">图形创意教程</logic:equal>
				<span class="STYLE6">
				<bean:write name="infomiddle" property="date_created" format="dd 日"/>
				</span>
			</li>
</logic:iterate>				
				
			</div>
			
			
			<div id="center_info">
				<li align="left" id="center_info_row_title">&nbsp;&nbsp;<span class="STYLE3">&nbsp; <strong>
				<a class="headLink" href="html/1008/index.html" target="_blank"><font color="#6C2D00">系统设计文档</font></a> &nbsp;<span class="STYLE4">&amp;</span> &nbsp; 
				<a class="headLink" href="html/1009/index.html" target="_blank"><font color="#6C2D00">javascript教程</font></a> &nbsp; </strong></span> 
				</li>
				<!---中下部显示分类信息---->
<logic:iterate id="infocenter" name="infocenter" indexId="idx">
			<li id="list_line_index_title">&nbsp;
				<A href="html/<bean:write name="infocenter" property="type"/>/<bean:write name="infocenter" property="id"/>.html" target="_blank" class="STYLE10">
				<bean:write name="infocenter" property="title"/>
				</A>
			</li>
			<li id="list_line_index_time">
			<logic:equal name="infocenter" property="type" value="1008">系统设计文档</logic:equal><logic:equal name="infocenter" property="type" value="1009">javascript教程</logic:equal>
				<span class="STYLE6">
				<bean:write name="infocenter" property="date_created" format="dd 日"/>
				</span>
			</li>
</logic:iterate>					
				
			</div>
			<!---休闲放松-->
			<div id="center_info_1">
				<li align="left" id="center_info_1_row_title">&nbsp;&nbsp;<span class="STYLE3">&nbsp; <strong>
		        <a class="headLink" href="html/1010/index.html" target="_blank"><font color="#6C2D00">休闲娱乐文章</font></a> &nbsp;</strong></span> </li>
<logic:iterate id="info1010" name="info1010" indexId="idx">
			<li id="list_line_index_title">&nbsp;
				<A href="html/<bean:write name="info1010" property="type"/>/<bean:write name="info1010" property="id"/>.html" target="_blank" class="STYLE10">
				<bean:write name="info1010" property="title"/>
				</A>
			</li>
			<li id="list_line_index_time">
			<logic:equal name="info1010" property="type" value="1010">休闲娱乐文章</logic:equal>
				<span class="STYLE6">
				<bean:write name="info1010" property="date_created" format="dd 日"/>
				</span>
			</li>
</logic:iterate>					
			</div>
			
		</div>
		<!-----正文右侧部分-------->
		<div id="body_right" align="left">
			<!----图片动态切换-------->
			<div id="right_image">
				<div id="MainPromotionBanner">
				<div id="SlidePlayer">
				<ul class="Slides">
<logic:iterate id="advtop" name="advtop" indexId="idx">
				<li><a target="_blank" href="<bean:write name="advtop" property="adv_link"/>"><img alt="网页设计" src="uploadFiles/<bean:write name="advtop" property="adv_image"/>"></a></li>
</logic:iterate>
				</ul>
				</div>
				<script type="text/javascript">
							TB.widget.SimpleSlide.decoration('SlidePlayer', {eventType:'mouse', effect:'scroll'});
				</script>
				</div>
			</div>
			<!---新闻信息--->
			<div id="right_info">
				<li id="right_info_row_title">&nbsp;&nbsp;&nbsp; &nbsp;<strong>新闻排行</strong> </li>
				
<logic:iterate id="info1000" name="info1000" indexId="idx">
			<li id="right_info_row">&nbsp;&nbsp;&nbsp; <span class="STYLE6">&nbsp;
			<bean:write name="info1000" property="date_created" format="dd 日" /></span> 
			<A href="html/<bean:write name="info1000" property="type"/>/<bean:write name="info1000" property="id"/>.html" target="_blank" class="STYLE10">
			<script language="javascript">
			var temptitle = '<bean:write name="info1000" property="title"/>';
			document.write(temptitle.substring(0,22));
			</script>
			</A>
			</li>
</logic:iterate>	
		
			</div>
			<!----右侧广告位------->
			
			<div id="right_image_adv">
				<img alt="网页设计"  src="image/right_adv1.bmp" height="60" width="298">
			</div>
			<div id="right_info_2">
				<li id="right_info_2_row_title">&nbsp;&nbsp;&nbsp; &nbsp;<B>精品导读</B> 
				</li>
<logic:iterate id="infoshow" name="infoshow" indexId="idx">
			<li id="right_info_row">
			
			&nbsp;&nbsp;&nbsp; <span class="STYLE6">&nbsp;
			<bean:write name="infoshow" property="date_created" format="dd 日" /></span> 
			<A href="html/<bean:write name="infoshow" property="type"/>/<bean:write name="infoshow" property="id"/>.html" target="_blank" class="STYLE10">
			
			<script language="javascript">
			var temptitle = '<bean:write name="infoshow" property="title"/>';
			document.write(temptitle.substring(0,22));
			</script>
			</A>
			</li>
</logic:iterate>					
			</div>
			
			<div id="right_image_adv2">
				<img alt="网页设计"  src="image/right_adv2.bmp" height="60" width="298">
			</div>
			
			<div id="right_info_3">
				<li id="right_info_3_row_title">&nbsp;&nbsp;&nbsp;<B>文档源码下载</B></li>
<logic:iterate id="info1011" name="info1011" indexId="idx">
				<li id="right_info_3_row">
				&nbsp;&nbsp;&nbsp; <span class="STYLE6">&nbsp;
				<bean:write name="info1011" property="date_created" format="dd 日" /></span> 
			<A href="html/<bean:write name="info1011" property="type"/>/<bean:write name="info1011" property="id"/>.html" target="_blank" class="STYLE10">
			<script language="javascript">
			var temptitle = '<bean:write name="info1011" property="title"/>';
			document.write(temptitle.substring(0,22));
			</script>
			</A>
				</li>
</logic:iterate>
			</div>
			
		</div>
	</div>
	
	<div align="center" id="bottom_adv">
		<div id="bottom_adv_left">
<script type="text/javascript"><!--
google_ad_client = "pub-3815888257365205";
/* 728x90, 创建于 09-2-15 */
google_ad_slot = "1973839263";
google_ad_width = 728;
google_ad_height = 90;
//-->
</script>
<script type="text/javascript"
src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>
		</div>
	</div>
	<div align="center">
		<div id="bottom_adv_left">
		<jsp:include page="link.jsp"></jsp:include>
		</div>
	</div>
	<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>
