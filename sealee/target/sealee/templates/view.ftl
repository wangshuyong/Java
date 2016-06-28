<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="keywords" content="${article.note_keyword}">
<meta name="description" content="${article.note_description}">
<title>${article.title}|${sitetype}|</title>
<link rel="stylesheet" href="../../css/style.css" type="text/css">
<link rel="stylesheet" href="../../css/css.css" type="text/css">
<script src="../../js/yu.js" type="text/javascript"></script>
<script src="../../js/tb.js" type="text/javascript"></script>
<script src="../../js/ajax.js" type="text/javascript"></script>
<script src="../../js/prototype.js" type="text/javascript"></script>
<style type="text/css">
<!--
.STYLE1 {color:#FF0000}
.STYLE2 {color:#0000FF}
.STYLE6 {color:#999999}
#Layer1 {
	position:absolute;
	width:145px;
	height:18px;
	z-index:0;
	left: 652px;
	top: 408px;
}
.STYLE9 {
	font-size:14px;
	font-weight:bold;
	color: #c4290a;
}
.STYLE15 {font-size:14px}
.STYLE16 {color: #16387c}
.STYLE17 {
	font-size: 12px;
	color: #000000;
}
.STYLE19 {font-size: 14px; font-weight: bold; }
.reply_bottom {
	border: thin none #16387c;
	background-color: #2782D6;
	width:55px;
	text-align:center;
	color:#FFFFFF;
}
-->
</style>
</head>
<body style="text-align:center;">
<div id="kuang">

<#include "top.html">
<div id="daohang">
	<li class="LiNoPointSearch" style="border:none">栏目导航</li>
	<li class="Lidaohang">
	<a href="../../index.html" target="_self">网站主页</a> >> 
	</li>
	<li class="Lidaohang">
	<a href="index.html" target="_self">${sitetype}</a> >> 
	</li>
	<li class="Lidaohang">
	${article.title}
	</li>
</div>
		
	<div align="center" id="body_all">		
		<!-----正文中间部分-------->
		<div id="body_article" align="left">
			<!--经验分析信息---->
			<div id="view_info">
				<li class="STYLE9" id="view_title">
				<h1 style="font-size:14px;">${article.title}</h1>
				</li>
				<li id="view_title_remark">
					来源：<#if article.source_link!=""><a href="${article.source_link}"></#if>${article.source}</a>
					&nbsp;&nbsp;&nbsp;&nbsp;作者：${article.author}
					&nbsp;&nbsp;&nbsp;&nbsp;时间：${article.date_created?string('yyyy-MM-dd HH:mm:ss')}
					&nbsp;&nbsp;&nbsp;&nbsp;浏览量：<font color="#999999"><span id="view_num"></span></font> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="../../member/newarticle.jsp" target="_blank"><b><font color="#c4290a">我要投稿</font></b></a> 
				</li>
				<li id="view_content">
				<div style="float:right;width:336px;height:280px;">
				<script type="text/javascript"><!--
				google_ad_client = "pub-3815888257365205";
				/* 336x280, 创建于  09-3-12 */
				google_ad_slot = "4493444479";
				google_ad_width = 336;
				google_ad_height = 280;
				//-->
				</script>
				<script type="text/javascript"
				src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
				</script>
				</div>
				${article.content}
				<p align="center">
				<script type="text/javascript"><!--
				google_ad_client = "pub-3815888257365205";
				/* 468x60, 创建于   09-4-11 */
				google_ad_slot = "7480993349";
				google_ad_width = 468;
				google_ad_height = 60;
				//-->
				</script>
				<script type="text/javascript"
				src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
				</script>				
				</p>
				<p align="center">
				<script src="../../ad/ad.js" language="JavaScript"></script>
				</p>
				</li>
				<li  id="view_line">
					<span class="STYLE9"><span class="STYLE16">相关文章</span></span>
				</li>
<#list aboutnew as newabout>
				<li id="view_line_left"><img src="../../image/member_002.gif" border="0" align="absmiddle"/>
				<span class="STYLE17">
				<a href="../../html/${newabout.filetype}/${newabout.title}.html">${newabout.title}</a>
				</span>
				</li>
				<li id="view_line_right">${newabout.date_created?string('yyyy-MM-dd HH:mm:ss')}</li>
</#list>				
				
	      </div>
		  <div id="clear"></div>
		</div>
		<!-----正文右侧部分-------->
		<div id="body_right" align="left">
			<div id="right_info" style="height:600px;">
			<li id="right_info_row_title">&nbsp;&nbsp;&nbsp;&nbsp;<B>推荐信息</B></li>
			<li id="right_info_row">
			&nbsp;&nbsp;&nbsp; 
			<script type="text/javascript"><!--
			google_ad_client = "pub-3815888257365205";
			/* 160x600, ������ 09-6-23 */
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
			<!----右侧广告位------->
			
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
			<#if show.title?length lt 20>
			${show.title}
			<#else>
			${show.title[0..19]}
			</#if>
			</a>
			</A>
</#list>
			</li>
			</div>
		</div>
	</div>
	<div id="clear"></div>
	<div align="center">
		<div id="bottom_adv_left">
		
		</div>
	</div>
	<#include "bottom.html">

</div>
</body>
<script language='javascript'>
	var XMLSender = new ActiveXObject("Microsoft.XMLHTTP" );
        XMLSender.Open("POST","../../ajaxclick.shtml?article=${article.id}",false);
        XMLSender.send();
	var tempNum =  XMLSender.responseText;
	document.getElementById('view_num').innerHTML = tempNum;
</script>
</html>