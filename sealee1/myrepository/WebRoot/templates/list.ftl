<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="keywords" content="${sitetype.name}">
<meta name="description" content="${sitetype.name}">
<title>${sitetype.name}|网站/网页制作教程-海乐网</title>
<link rel="stylesheet" href="../../css/style.css" type="text/css">
<link rel="stylesheet" href="../../css/css.css" type="text/css">
<script src="../../js/yu.js" type="text/javascript"></script>
<script src="../../js/tb.js" type="text/javascript"></script>
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
<#include "view_top.html">
<div id="listAdvertise">
<!---------广告代码段----------->
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

	<div align="center" id="body_all">
		
		<!-----正文中间部分-------->
		<div id="body_article" align="left">
			<div id="list_info">
				<div align="left" id="list_info_row_title">
						<li id="list_line_li_title">
						&nbsp;&nbsp;<span class="STYLE3">&nbsp;</span> <span class="STYLE9">
						<a class="titleLink" href="../../index.html" target="_self">网站首页</a> &gt;&gt; &nbsp; 
						${sitetype.name}&nbsp; <span class="STYLE4">&gt;&gt;</span> 列表</span></li>
						
				</div>
<#list clInfos as clInfos>
		<div align="left" id="list_info_row">
			<li id="list_line_li_title">
			&nbsp;&nbsp;&nbsp;<span class="STYLE8">&nbsp;</span>
			<A href="${clInfos.id}.html" target="_blank" class="STYLE10">
			${clInfos.title}
			</A>
			</li>
			<li class="STYLE4 STYLE11" id="list_line_li_time">
			${clInfos.date_created?string('yyyy-MM-dd HH:mm:ss')}
			</li>
		</div>
		<div align="left" id="list_info_row_content">
			<li id="list_line_li_content">
			&nbsp;&nbsp;&nbsp;<span class="STYLE8">&nbsp;</span>
			<#if clInfos.show?length lt 90>
			${clInfos.show}
			<#else>
			${clInfos.show[0..89]}
			</#if>
			
			[<A href="${clInfos.id}.html" target="_blank" class="STYLE10"><font style="font-size:11px">阅读全文</font></A>]
			</li>		
		</div>
				
</#list>

				<div align="left" id="list_info_row" style="height:60px;">
				<li style="text-align:center; list-style:none" class="STYLE9 STYLE14">
				</li>
				<li style="text-align:center;list-style:none" class="STYLE9 STYLE14">
				${pageurl}
				</li>
				<li style="text-align:center; list-style:none" class="STYLE9 STYLE14">
				</li>
				</div>
			</div>
			
			<div align="left" style="margin-top:5px; float:left;">
			
			</div>

		</div>
		<!-----正文右侧部分-------->
		<div id="body_right" align="left">
			<!---推荐信息--->
			<div id="right_info" style="height:600px;">
			<li id="right_info_row_title">&nbsp;&nbsp;&nbsp;&nbsp;<B>推荐信息</B> </li>
			<li id="right_info_row">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			<script type="text/javascript"><!--
			google_ad_client = "pub-3815888257365205";
			/* 160x600, 创建于 09-6-23 */
			google_ad_slot = "3769138972";
			google_ad_width = 160;
			google_ad_height = 600;
			//-->
			</script>
			<script type="text/javascript"
			src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
			</script>
			</li>

			</div>
			<!----右侧广告位------>
			
			<div id="right_image_adv">
				<a href="../../youxi-sealee.jsp" target="_blank"><img src="../../image/right_adv1.bmp" height="60" width="298" border="0"></a>
			</div>
			<div id="right_info_2">
			<li id="right_info_2_row_title">&nbsp;&nbsp;&nbsp;&nbsp;<b>精品导读</b> </li>
<#list infoshow as show>
			<li id="right_info_row">
			&nbsp;&nbsp;&nbsp; <span class="STYLE6">
			${show.date_created?string('dd 日')}</span> 
			<a href="../../html/${show.type}/${show.id}.html">
			<#if show.title?length lt 19>
			${show.title}
			<#else>
			${show.title[0..18]}
			</#if>
			</a>
			</A>
</#list>
			</li>
			</div>		
		</div>
	</div>
	<div align="center">
		<div id="bottom_adv_left">
		
		</div>
	</div>
	<div id="clear"></div>
	<#include "view_bottom.html">
</div>
</body>
</html>