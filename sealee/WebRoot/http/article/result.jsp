<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%
	int nullNum = 0;
	if(request.getAttribute("nullNum")!=null&&!request.getAttribute("nullNum").equals("")){
		nullNum = Integer.parseInt(String.valueOf(request.getAttribute("nullNum")));
	}
	response.setCharacterEncoding("gb2312");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="keywords" content="<bean:write name="condition" />">
<meta name="description" content="<bean:write name="condition" />">
<title><bean:write name="condition" /> 相关的搜索结果-海乐网</title>
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
<body topmargin=0 style="text-align:center;">
<div id="kuang">
	<jsp:include flush="true" page="../../top.jsp"></jsp:include>
	<!------广告栏----->
	<div id="listAdvertise">
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
	<!-------网页正文栏----------->
	<div align="center" id="body_all">
		
		<!-----正文中间部分-------->
		<div id="body_article" align="left">
			<!---经验分析信息--->
			<div id="list_info">
				<div align="left" id="list_info_row_title">
						<li id="list_line_li_title">
						&nbsp;&nbsp;<span class="STYLE3">&nbsp;</span> <span class="STYLE9">
						<a class="titleLink" href="index.html" target="_self">网站首页</a> &gt;&gt; &nbsp; 
						<bean:write name="condition" />&nbsp; <span class="STYLE4">&gt;&gt;</span> 列表</span></li>
				</div>
				
<logic:iterate id="articlelist" name="clInfos" indexId="idx">

		<div align="left" id="list_info_row">
			<li id="list_line_li_title">
			&nbsp;&nbsp;&nbsp;<span class="STYLE8">&nbsp;</span>
			<A href="html/<bean:write name="articlelist" property="type"/>/<bean:write name="articlelist" property="id"/>.html" target="_blank" class="STYLE10">
			<bean:write name="articlelist" property="title"/>
			</A>
			</li>
			<li class="STYLE4 STYLE11" id="list_line_li_time">
			<bean:write name="articlelist" property="date_created" format="yyyy-MM-dd HH:mm:ss"/>
			</li>
		</div>
		<div align="left" id="list_info_row_content">
			<li id="list_line_li_content">
			&nbsp;&nbsp;&nbsp;<span class="STYLE8">&nbsp;</span><bean:write name="articlelist" property="show"/>.... 
			[<A href="html/<bean:write name="articlelist" property="type"/>/<bean:write name="articlelist" property="id"/>.html" target="_blank" class="STYLE10"><font style="font-size:11px">阅读全文</font></A>]
			</li>		
		</div>
				
 </logic:iterate>
<%
	for(int t=0;t<nullNum;t++){
%>	
				<div align="left" id="list_info_row">
						<li id="list_line_li_title">
						&nbsp;&nbsp;&nbsp;<span class="STYLE8">&nbsp;</span></li>
						<li class="STYLE4 STYLE11" id="list_line_li_time"></li>
				</div>
				<div align="left" id="list_info_row_content">
						<li id="list_line_li_content">
						&nbsp;&nbsp;&nbsp;<span class="STYLE8">&nbsp;</span>
						</li>		
				</div>
				
<%
	}
%>
				<div align="left" id="list_info_row">
				<li style="text-align:center; list-style:none" class="STYLE9 STYLE14">
				</li>
				<li style="text-align:center; list-style:none" class="STYLE9 STYLE14">
			第<bean:write name="pager" property="currentPage"/>页
			共<bean:write name="pager" property="totalPages"/>页
			<html:link action="/searchinfo.shtml?pageMethod=first" name="map">首页</html:link>
			<html:link action="/searchinfo.shtml?pageMethod=previous" name="map">上一页</html:link>
			<html:link action="/searchinfo.shtml?pageMethod=next" name="map">下一页</html:link>
			<html:link action="/searchinfo.shtml?pageMethod=last" name="map">尾页</html:link>
				</li>
				<li style="text-align:center; list-style:none" class="STYLE9 STYLE14">
				<!-----广告信息------>
				</li>
				</div>
			</div>
		</div>
		<!-----正文右侧部分-------->
		<div id="body_right" align="left">
			<!----图片动态切换-------->
			<div id="right_image_adv">
				<img src="image/right_adv1.bmp" height="60" width="298">
			</div>
			<!---新闻信息--->
			<div id="right_info">
				<li id="right_info_row_title">&nbsp;&nbsp;&nbsp; &nbsp;<strong>新闻排行</strong></li>
<logic:iterate id="info1000" name="info1000" indexId="idx">
			<li id="right_info_row">&nbsp;&nbsp;&nbsp; <span class="STYLE6">&nbsp;
			<bean:write name="info1000" property="date_created" format="dd 日" /></span> 
			<A href="html/<bean:write name="info1000" property="type"/>/<bean:write name="info1000" property="id"/>.html" target="_blank">
			<script language="javascript">
			var temptitle = '<bean:write name="info1000" property="title"/>';
			document.write(temptitle.substring(0,18));
			</script>
			</A>
			</li>
</logic:iterate>
			</div>
			<!----右侧广告位------->
			
			<div id="right_image_adv">
				<img src="image/right_adv1.bmp" height="60" width="298">
			</div>
			<div id="right_info_2">
				<li id="right_info_2_row_title">&nbsp;&nbsp;&nbsp; &nbsp;<strong>精品导读</strong> </li>
<logic:iterate id="infoshow" name="infoshow" indexId="idx">
			<li id="right_info_row">
			
			&nbsp;&nbsp;&nbsp; <span class="STYLE6">&nbsp;
			<bean:write name="infoshow" property="date_created" format="dd 日" /></span> 
			<A href="html/<bean:write name="infoshow" property="type"/>/<bean:write name="infoshow" property="id"/>.html" target="_blank">
			
			<script language="javascript">
			var temptitle = '<bean:write name="infoshow" property="title"/>';
			document.write(temptitle.substring(0,18));
			</script>
			</A>
			</li>
</logic:iterate>
			</div>
			
			<div id="right_image_adv2">
				<img src="image/right_adv2.bmp" height="60" width="298">
			</div>
			
			<div id="right_info_3">
				<li id="right_info_3_row_title">&nbsp;&nbsp;&nbsp;<B>文档源码下载</B></li>
<logic:iterate id="info1011" name="info1011" indexId="idx">
				<li id="right_info_3_row">
				&nbsp;&nbsp;&nbsp; <span class="STYLE6">&nbsp;
				<bean:write name="info1011" property="date_created" format="dd 日" /></span> 
			<A href="html/<bean:write name="info1011" property="type"/>/<bean:write name="info1011" property="id"/>.html">
			<script language="javascript">
			var temptitle = '<bean:write name="info1011" property="title"/>';
			document.write(temptitle.substring(0,18));
			</script>
			</A>
				</li>
</logic:iterate>	
			</div>
			
		</div>
	</div>
	<jsp:include page="../../bottom.jsp"></jsp:include>
</div>
</body>
</html>
