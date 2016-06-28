<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="keywords" content="网站制作教程，网页制作教程，如何制作网站，如何制作网页，怎样制作网页，怎么制作网页，网页设计教程">
<meta name="description" content="如何制作网站，如何制作网页，怎样/怎么制作网页，海乐网提供专业的网站制作教程，网页制作教程，网页设计教程。">
<meta name="y_key" content="662168cba92c1f9b" />
<meta name="verify-v1" content="nTm8Dxznc5R2V6pRAqJWMouH0Op+1GjR9Cgf9S34L7A=" />
<title>网站制作教程|网页制作教程，如何制作网站，如何制作网页，怎么制作网页尽在海乐网</title>
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="css/css.css" type="text/css">
<script src="js/yu.js" type="text/javascript"></script>
<script src="js/tb.js" type="text/javascript"></script>
<script src="js/ajax.js" type="text/javascript"></script>
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
<body style="text-align:center;" onload="ajax_user()">
<div id="kuang">
	<#include "top.html">
	<div id="topAdvertiseA">
		<div style="float:left;height:15px;line-height:30px;margin-left:50px;margin-top:8px;">
			<script type="text/javascript"><!--
			google_ad_client = "pub-3815888257365205";
			/* 728x15, 创建于 09-3-4 */
			google_ad_slot = "9612698337";
			google_ad_width = 728;
			google_ad_height = 15;
			//-->
			</script>
			<script type="text/javascript"
			src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
			</script>
		</div>
	</div>
	<div id="topAdvertise">
		<div style="float:left;height:90px;margin-left:0px;">
		<script type="text/javascript"><!--
		google_ad_client = "pub-3815888257365205";
		/* 728x90, 创建于09-2-15 */
		google_ad_slot = "5510414093";
		google_ad_width = 728;
		google_ad_height = 90;
		//-->
		</script>
		<script type="text/javascript"
		src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
		</script>
		</div>
		<div style="float:left;height:90px;margin-left:36px;">		
		<script type="text/javascript"><!--
		google_ad_client = "pub-3815888257365205";
		/* 200x90, 创建于 09-2-23 */
		google_ad_slot = "0056571429";
		google_ad_width = 200;
		google_ad_height = 90;
		//-->
		</script>
		<script type="text/javascript"
		src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
		</script>
		</div>
	</div>
	<!------网页正文栏-------->
	<div align="center" id="body_all">
		<!----正文左侧内容--------->
		<div id="body_left" align="left">
			<!---会员信息--->
			<div id="member_info">
				<div id="state_view" style="visibility:view;display:">
				<li id="member_info_row_title">&nbsp;&nbsp;&nbsp; &nbsp;<strong>会员中心</strong> </li>
				<li id="member_info_row">&nbsp;&nbsp;&nbsp; &nbsp;当前状态：<b>游客</b> </li>
				<li id="member_info_row">&nbsp;&nbsp;&nbsp; &nbsp;发表文章&nbsp;&nbsp;&nbsp; &nbsp;我的留言</li>
				<li id="member_info_row">&nbsp;&nbsp;&nbsp; &nbsp;我的空间&nbsp;&nbsp;&nbsp; &nbsp;我的收藏</li>
				<li id="member_info_row">&nbsp;&nbsp;&nbsp; &nbsp;<span class="STYLE2"><a href="login.jsp" target="_self">马上登陆</a></span>&nbsp;&nbsp;&nbsp; &nbsp;<span class="STYLE1"><a href="register.jsp" target="_self"><font color="red">注册会员</font></a></span></li>
				</div>
				<div id="state_hidden" style="visibility:hidden;display:none">
				<li id="member_info_row_title">&nbsp;&nbsp;&nbsp; &nbsp;<strong>会员中心</strong> </li>
				<li id="member_info_row">&nbsp;&nbsp;&nbsp; &nbsp;当前状态：<b><font color="#FF0000"><span id="membername"></span></font></b> </li>
				<li id="member_info_row">&nbsp;&nbsp;&nbsp; &nbsp;<a href="member/newarticle.jsp" target="_self">发表文章</a>&nbsp;&nbsp;&nbsp; &nbsp;我的留言</li>
				<li id="member_info_row">&nbsp;&nbsp;&nbsp; &nbsp;<a href="member/main.jsp" target="_self">我的空间</a>&nbsp;&nbsp;&nbsp; &nbsp;我的收藏</li>
				<li id="member_info_row">&nbsp;&nbsp;&nbsp; &nbsp;<span class="STYLE2"><a href="member/main.jsp" target="_self"><span class="STYLE2">控制面板</span></a></span>&nbsp;&nbsp;&nbsp; &nbsp;<span class="STYLE1"><a href="outlogin.shtml" target="_self">注销登陆</a></span></li>
				</div>
			</div>
			<!----文章点击排行------->
			<div id="note_top">
				<li align="left" id="note_top_row_title">&nbsp;&nbsp;&nbsp; &nbsp;<b>文章TOP</b> </li>
<#list infoalltop as infoalltop>
			<li id="note_top_row">
				<A href="html/${infoalltop.type}/${infoalltop.id}.html" target="_blank" class="STYLE10">
					<#if infoalltop.title?length lt 11>  
					${infoalltop.title}
					<#else> 
					${infoalltop.title[0..10]}
					</#if>
				</A>
			</li>
</#list>
			</div>
			<div id="left_info">
				<li id="left_info_row_title">&nbsp;&nbsp;&nbsp; &nbsp;<b>会员排行</b></li>
<#list membertop as member>
				<li style="height:20px; line-height:20px;float:left; width:150px;">
				&nbsp;&nbsp;&nbsp;&nbsp;
					<#if member.petname?length lt 13>
					${member.petname}
					<#else> 
					${member.petname[0..12]}
					</#if>
				</li>
				<li style="height:20px; line-height:20px; float:left; width:27px;">
				<span class="STYLE6">${member.integral}</span>
				</li>
			
</#list>
			</div>
			
		</div>
		<!--------正文中间部分---------->
		<div id="body_center" align="left">
			<div id="center_info">
				<li align="left" id="center_info_row_title">&nbsp;&nbsp;<span class="STYLE3">&nbsp; <B>
				<a class="headLink" href="html/1003/index.html" target="_blank"><font color="#6C2D00">Java技术教程</font></a> &nbsp;<span class="STYLE4">&amp;</span> &nbsp; 
				<a class="headLink" href="html/1004/index.html" target="_blank"><font color="#6C2D00">ASP技术教程</font></a> &nbsp;<span class="STYLE4">&amp;</span> &nbsp; 
				<a class="headLink" href="html/1002/index.html" target="_blank"><font color="#6C2D00">PHP技术教程</font></a> &nbsp;<span class="STYLE4">&amp;</span> &nbsp;
				<a class="headLink" href="html/1006/index.html" target="_blank"><font color="#6C2D00">网页设计教程</font></a></B></span>
				</li>
<#list infotop as infotop>
			<li id="list_line_index_title">&nbsp;
				<A href="html/${infotop.type}/${infotop.id}.html" target="_blank" class="STYLE10">
				${infotop.title}
				</A>
			</li>
			<li id="list_line_index_time">
				<#if infotop.type="1002">PHP技术教程
				<#elseif infotop.type="1003">JAVA技术教程
				<#elseif infotop.type="1004">ASP技术教程
				<#elseif infotop.type="1006">网页制作教程
				</#if>
				<span class="STYLE6">
				${infotop.date_created?string('dd 日')}
				</span>
			</li>
</#list>
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
			<!----数据库以及做站------>
			<div id="center_info">
				<li align="left" id="center_info_row_title">&nbsp;&nbsp;<span class="STYLE3">&nbsp;<strong>
				<a class="headLink" href="html/1001/index.html" target="_blank"><font color="#6C2D00">网站推广教程</font></a> &nbsp;<span class="STYLE4">&amp;</span> &nbsp; 
				<a class="headLink" href="html/1005/index.html" target="_blank"><font color="#6C2D00">数据库教程</font></a> &nbsp; <span class="STYLE4">&amp;</span> &nbsp;
				<a class="headLink" href="html/1007/index.html" target="_blank"><font color="#6C2D00">图形创意教程</font></a>
				 </strong></span> </li>
				 <!----中上部显示信息--->
<#list infomiddle as infomiddle>
			<li id="list_line_index_title">&nbsp;
				<A href="html/${infomiddle.type}/${infomiddle.id}.html" target="_blank" class="STYLE10">
				${infomiddle.title}
				</A>
			</li>
			<li id="list_line_index_time">
				<#if infomiddle.type="1001">网站推广教程
				<#elseif infomiddle.type="1005">数据库教程
				<#elseif infomiddle.type="1007">图形创意教程
				</#if>				
				<span class="STYLE6">
				${infomiddle.date_created?string('dd 日')}
				</span>
			</li>
</#list>			
			</div>
			<div id="center_info">
				<li align="left" id="center_info_row_title">&nbsp;&nbsp;<span class="STYLE3">&nbsp; <strong>
				<a class="headLink" href="html/1008/index.html" target="_blank"><font color="#6C2D00">系统设计文档</font></a> &nbsp;<span class="STYLE4">&amp;</span> &nbsp; 
				<a class="headLink" href="html/1009/index.html" target="_blank"><font color="#6C2D00">javascript教程</font></a> &nbsp; </strong></span> 
				</li>
				<!---中下部显示信息--->
<#list infocenter as infocenter>
			<li id="list_line_index_title">&nbsp;
				<A href="html/${infocenter.type}/${infocenter.id}.html" target="_blank" class="STYLE10">
				${infocenter.title}
				</A>
			</li>
			<li id="list_line_index_time">
				<#if infocenter.type="1008">系统设计文档
				<#elseif infocenter.type="1009">javascript教程
				</#if>					
				<span class="STYLE6">
				${infocenter.date_created?string('dd 日')}
				</span>
			</li>
</#list>			
			</div>
			<!---休闲放松-->
			<div id="center_info_1">
				<li align="left" id="center_info_1_row_title">&nbsp;&nbsp;<span class="STYLE3">&nbsp; <strong>
		        <a class="headLink" href="html/1010/index.html" target="_blank"><font color="#6C2D00">休闲娱乐文章</font></a> &nbsp;</strong></span> </li>
<#list info1010 as info1010>
			<li id="list_line_index_title">&nbsp;
				<A href="html/1010/${info1010.id}.html" target="_blank" class="STYLE10">
				${info1010.title}
				</A>
			</li>
			<li id="list_line_index_time">
				<span class="STYLE6">
				${info1010.date_created?string('dd 日')}
				</span>
			</li>
</#list>					
			</div>
		</div>
		<!-------网页右侧部分----------->
			<div id="right_image">
				<div id="MainPromotionBanner">
				<div id="SlidePlayer">
				<ul class="Slides">
<#list advtop as advtop>
				<li><a target="_blank" href="${advtop.adv_link}"><img title="网页设计-海乐网" alt="网页设计-海乐网" src="uploadFiles/${advtop.adv_image}"></a></li>
</#list>
				</ul>
				</div>
				<script type="text/javascript">
							TB.widget.SimpleSlide.decoration('SlidePlayer', {eventType:'mouse', effect:'scroll'});
				</script>
				</div>
			</div>
			<div id="right_info">
				<li style="text-align:left;"  id="right_info_row_title">&nbsp;&nbsp;&nbsp; &nbsp;<B>行业新闻</B> </li>
<#list info1000 as info1000>
			<li style="text-align:left;" id="right_info_row">&nbsp;&nbsp;<span class="STYLE6">&nbsp;
			${info1000.date_created?string('dd 日')}</span> 
			<A href="html/${info1000.type}/${info1000.id}.html" target="_blank" class="STYLE10">
				<#if info1000.title?length lt 20>  
				${info1000.title}
				<#else> 
				${info1000.title[0..19]}
				</#if>
			</A>
			</li>
</#list>	
			</div>
			<!----右侧广告位------>
			
			<div id="right_image_adv">
				<img style="cursor:pointer" alt="网站制作教程"  src="image/right_adv1.bmp" height="60" width="298" onclick="return adv_left()">
			</div>
			<div id="right_info_2">
				<li style="text-align:left;"  id="right_info_2_row_title">&nbsp;&nbsp;&nbsp; &nbsp;<B>精华导读</B> 
				</li>
<#list infoshow as infoshow>
			<li style="text-align:left;" id="right_info_row">
			&nbsp;&nbsp;<span class="STYLE6">&nbsp;
			${infoshow.date_created?string('dd 日')}</span> 
			<A href="html/${infoshow.type}/${infoshow.id}.html" target="_blank" class="STYLE10">
				<#if infoshow.title?length lt 20>  
				${infoshow.title}
				<#else> 
				${infoshow.title[0..19]}
				</#if>			
			</A>
			</li>
</#list>					
			</div>
			
			<div id="right_image_adv2">
				<img style="cursor:pointer" alt="网站制作教程"  src="image/right_adv2.bmp" height="60" width="298" onclick="return adv_left()">
			</div>
			<div id="right_info_3">
				<li style="text-align:left;"  id="right_info_3_row_title">&nbsp;&nbsp;&nbsp;<B>文档源码下载</B></li>
<#list info1011 as info1011>
				<li style="text-align:left;"  id="right_info_3_row">
				&nbsp;&nbsp;&nbsp; <span class="STYLE6">
			${info1011.date_created?string('dd 日')}</span> 
			<A href="html/${info1011.type}/${info1011.id}.html" target="_blank" class="STYLE10">
				<#if info1011.title?length lt 20>  
				${info1011.title}
				<#else> 
				${info1011.title[0..19]}
				</#if>			
			</A>
				</li>
</#list>
			</div>
		</div>
	</div>
	<div id="clear"></div>
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
<div align="center" id="link_all">
		<div align="left" style="width:80px; float:left; line-height:20px;">
		<li style="float:left;text-align:center; list-style:none; width:70px;margin-top:8px; margin-left:4px;">友情链接：</li>
		</div>
		<div align="left" id="link_line" style="float:left" >
<#list links as links>
		<li style="float:left;list-style:none; width:85px; margin-left:0px;margin-top:3px;line-height:20px;">
		<a href=${links.adv_link} target=_blank title='${links.adv_title}'><#if links.link_color!=""><font color="${links.link_color}"></#if>${links.adv_title}<#if links.link_color!=""></font></#if></a>
		</li>
</#list>
		</div>		
</div>
		</div>
	</div>
	<#include "bottom.html">
</div>
</body>
</html>