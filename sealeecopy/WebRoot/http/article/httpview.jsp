<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%
	String reply_author="";
	if(session.getAttribute("member")!=null&&!session.getAttribute("member").equals("")){
		reply_author = (String)session.getAttribute("member");
	}else{
		reply_author = "网友";
	}
String info_id = "",info_type="";
if(request.getAttribute("info_id")!=null&&!request.getAttribute("info_id").equals("")){
	info_id = (String)request.getAttribute("info_id");
}
if(request.getAttribute("info_type")!=null&&!request.getAttribute("info_type").equals("")){
	info_type = (String)request.getAttribute("info_type");
}
%>
<html>
<head>
<meta name="keywords" content="<bean:write name="article" property="note_keyword"/>">
<meta name="description" content="<bean:write name="article" property="note_description"/>">
<title><bean:write name="article" property="title"/>-海乐网</title>
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="css/css.css" type="text/css">
<script src="js/yu.js" type="text/javascript"></script>
<script src="js/tb.js" type="text/javascript"></script>
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
.STYLE6 {color: #999999}
#Layer1 {
	position:absolute;
	width:145px;
	height:18px;
	z-index:0;
	left: 652px;
	top: 408px;
}
.STYLE9 {
	font-size: 14px;
	font-weight: bold;
	color: #c4290a;
}
.STYLE15 {font-size: 14px}
.STYLE16 {color: #16387c}
.STYLE17 {
	font-size: 12px;
	color: #000000;
}
.STYLE19 {font-size: 14px; font-weight: bold; }
-->
</style>
</head>
<body  style="text-align:center;">
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
			<div id="view_info">
				<li class="STYLE9" id="view_title">
				<bean:write name="article" property="title"/>
				</li>
				<li id="view_title_remark">
					来源：<bean:write name="article" property="source"/>
					 作者：<bean:write name="article" property="author"/>
					 时间：<bean:write name="article" property="date_created" format="yyyy-MM-dd HH:mm:ss"/>
					 浏览量：<font color="#999999"><bean:write name="article" property="click_num"/></font> &nbsp;&nbsp; <a href="member/newarticle.jsp" target="_blank"><b><font color="#c4290a">我要投稿</font></b></a> 
				</li>
				<li align="left" id="view_content">
				<bean:write name="article" property="content" filter="false" />
				</li>
				
				<li  id="view_line">
					<span class="STYLE15">作者：<bean:write name="article" property="author"/></span>
				</li>

				
				<li  id="view_noline">
						
				</li>

				<li  id="view_line">
					<span class="STYLE15">编辑热线：13623857715 Email：sealee.com@163.com </span> 
					<span class="STYLE15"><a href="register.jsp" target="_self"><font color="#FF0000">20秒注册会员 结交更多朋友 分享你的精彩</font></a></span>				
				</li>
				
				
				<li  id="view_line">
					<span class="STYLE9"><span class="STYLE16">评论（</span><bean:write name="article" property="reply_num"/><span class="STYLE16">）</span> </span>
				</li>

<logic:iterate id="inforeply" name="inforeply" indexId="idx">		
				<li id="view_line_left"><img src="image/member_002.gif" border="0" align="absmiddle"/><span class="STYLE17">
				<bean:write name="inforeply" property="reply_author"/>
				</span> </li>
				<li id="view_line_right"><bean:write name="inforeply" property="reply_date" format="yyyy-MM-dd HH:mm:ss"/></li>
				<li  id="view_noline">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:write name="inforeply" property="reply_content"/>
				</li>
</logic:iterate>
				<li  id="view_noline"><BR>
                <strong>评论:</strong><span class="STYLE17">请自觉遵守互联网相关政策法规，作者管理后台可以删除恶意评论、广告和违禁词语。</span>
				</li>
<html:form action="/reply.shtml" method="post" onsubmit="check();return false;">
				<input type="hidden" name="infor_id" value="<bean:write name="article" property="id"/>">
				<input type="hidden" name="reply_author" value="<%=reply_author%>">
				<li  id="view_noline">
				  <html:textarea property="reply_content" cols="54" rows="5" />
				</li>
				<li  id="view_noline" style="margin-top:2px;">
				<html:submit styleClass="reply_bottom" value="评论"/>
				</li>
</html:form>
				<li  id="view_line">
					<span class="STYLE9"><span class="STYLE16">相关新闻</span></span>
				</li>
				
<logic:iterate id="aboutnew" name="aboutnew" indexId="idx">		
				<li id="view_line_left"><img src="image/member_002.gif" border="0" align="absmiddle"/><span class="STYLE17">
				<A href="html/<bean:write name="aboutnew" property="type"/>/<bean:write name="aboutnew" property="id"/>.html" target="_blank" class="STYLE10">
				<bean:write name="aboutnew" property="title"/>
				</A>
				</span> </li>
				<li id="view_line_right"><bean:write name="aboutnew" property="date_created" format="yyyy-MM-dd HH:mm:ss"/></li>
</logic:iterate>
	      </div>
			
				<div align="left" style="margin-top:5px; float:left;"><img src="image/hb666.gif" height="70" width="670px"></div>
			
		</div>
		<!-----正文右侧部分-------->
		<div id="body_right" align="left">
			<!----图片动态切换-------->
			<div id="right_image_adv">
				<img src="image/right_adv1.bmp" height="60" width="298">
			</div>
			<!---新闻信息--->
			<div id="right_info">
				<li id="right_info_row_title">&nbsp;&nbsp;&nbsp; &nbsp;<strong>新闻排行</strong> </li>
<logic:iterate id="info1000" name="info1000" indexId="idx">
			<li id="right_info_row">&nbsp;&nbsp;&nbsp; <span class="STYLE6">&nbsp;
			<bean:write name="info1000" property="date_created" format="dd 日" /></span> 
			<A href="html/<bean:write name="info1000" property="type"/>/<bean:write name="info1000" property="id"/>.html" target="_blank">
			<script language="javascript">
			var temptitle = '<bean:write name="info1000" property="title"/>';
			document.write(temptitle.substring(0,20));
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
			document.write(temptitle.substring(0,20));
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
			<A href="html/<bean:write name="info1011" property="type"/>/<bean:write name="info1011" property="id"/>.html" target="_blank" class="STYLE10">
			<script language="javascript">
			var temptitle = '<bean:write name="info1011" property="title"/>';
			document.write(temptitle.substring(0,20));
			</script>
			</A>
				</li>
</logic:iterate>	
			</div>
			
			<div id="right_info_4" align="center">
			
<script type="text/javascript"><!--
google_ad_client = "pub-3815888257365205";
/* 250x250, 创建于 09-2-15 */
google_ad_slot = "9365320118";
google_ad_width = 250;
google_ad_height = 250;
//-->
</script>
<script type="text/javascript"
src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>
			</div>
			
		</div>
	</div>
	<div id="clear"></div>
	<jsp:include page="../../bottom.jsp"></jsp:include>
</div>
</body>
<script>
	function check(){
		if(replyForm.reply_content.value==''){
			alert('请先填写评论噢！');
			replyForm.reply_content.focus();
			return false;
		}else{
			replyForm.submit();
		}
	}
</script>
</html>
