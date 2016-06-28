<%@ page language="java" pageEncoding="UTF-8"%>
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
<meta name="keywords" content="海乐网,海乐信息,计算机WEB编程,网站推广,java开发,asp开发,php开价,网页设计,设计文档,javascript">
<meta http-equiv="description" content="海乐网,海乐信息,计算机WEB编程,网站推广,java开发,asp开发,php开价,网页设计,设计文档,javascript">
<title>海乐网-专业的WEB开发技术，网页设计，设计文档，网站推广信息</title>
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
		
				<div id="topAdvertiseLeft">
				 	<ul style="margin-left:0px; margin-top:0px; margin-bottom:0px;">
						<li class="LiPoint"><A href="http://www.51link.com/?rid=admin5" target="_blank">全新51link   文字广告交换交易新标准</A>
						  <!--6.12.11.13-->
</li>
						<li class="LiPoint" ><A href="http://www.zyiis.com/?admin5" target="_blank">售:中易广告联盟程序支持CPC CPA </A></li>
						<li class="LiPoint" ><A href="http://www.t375.cn" target="_blank">无手续费，日付，全新短信联盟！</A></li>
						<li class="LiPoint" ><A href="http://www.1hd.cn?siter=admin5_1" target="_blank">1HD品牌空间=最好服务+最优保障</A>
						  <!--10.31.12.1 -->
						</li>
						<li class="LiPoint" ><A href="http://www.3tvps.com/store/index.php" target="_blank" class="STYLE1">vps促销中</A>
						  <!--11.4.12.5 -->
						</li>
						<li class="LiPoint" ><A href="http://www.163k.com" target="_blank" class="STYLE2">１６３Κ 团 购 网 站 系   统~！</A>
						  <!--10.6.11.7-->
</li>	
				  </ul>
	  </div>
								<div id="topAdvertiseLeft">
				 	<ul style="margin-left:0px;margin-top:0px; margin-bottom:0px; ">
						<li class="LiPoint"><A href="http://www.qidu.org/?admin5" target="_blank">流量联盟-官方收分，无手续费，日付！</A></li>
						<li class="LiPoint" ><A href="http://www.menhutong.com.cn/?rid=admin5-1" target="_blank" class="STYLE1">2008年你还在花钱做网站吗？！</A></li>
						<li class="LiPoint" ><A href="http://www.yisoso.net" target="_blank">爆涨网站流量！注册就送积分+周结算!</A></li>
						<li class="LiPoint" ><A href="http://u.xioo.cn" target="_blank">自定义广告样式联盟 实时数据(周结算)</A>
						  <!--9.27.11.30 -->
						</li>
						<li class="LiPoint" ><A href="http://www.78ip.com/reg.asp" target="_blank">交换链；自选文字图片,１: ２+日结算</A></li>
						<li class="LiPoint" ><A href="http://www.facailian.cn" target="_blank">加入发财流量交换链=网站收入爆涨</A></li>
						
				  </ul>
	  </div>
								<div id="topAdvertiseLeft">
				 	<ul style="margin-left:0px;margin-top:0px; margin-bottom:0px; ">
						<li class="LiPoint"><A href="http://www.biyici.com/user/" target="_blank">爆涨电影站流量,真实返回１: ２以上</A>
						</li>
						<li class="LiPoint" ><A href="http://www.chinavps.cn/vps.php" target="_blank">VPS主机90元/月,独立IP,远程桌面</A></li>
						<li class="LiPoint" ><A href="http://www.souzhuji.com/host" target="_blank">主机聚合网 诚邀ｉｄｃ </A></li>
						<li class="LiPoint" ><A href="http://www.idcincn.com" target="_blank">中国IDC资源网 收录中国优质IDC资源</A>				</li>
						<li class="LiPoint" ><A href="http://www.qjserver.com" target="_blank" class="STYLE1">全新酷睿双核E2180/2G/250G 599元/月</A></li>
						<li class="LiPoint" ><A href="http://www.33ww.com.cn" target="_blank">买优质主机 上虚拟主机评测网</A></li>
						
				  </ul>
	  </div>
								<div id="topAdvertiseLeft">
				 	<ul style="margin-left:0px;margin-top:0px; margin-bottom:0px; ">
						<li class="LiPoint"><A href="http://www.987link.com" target="_blank">交换链加入送10元，流量+赚钱！</A>
						  <!-10.23.11.26-->
</li>
						<li class="LiPoint" ><A href="http://www.adminxy.com" target="_blank">虚拟主机评测</A>
</li>
						<li class="LiPoint" ><A href="http://www.xinanidc.com/User/hostyh.asp" target="_blank" class="STYLE2">２G全能空间１４８元　可开４个网站</A>
						</li>
						<li class="LiPoint" ><A href="http://www.cpa123.cn" target="_blank">网站收益２毛“变”２元   收入暴涨</A></li>
						<li class="LiPoint" ><A href="http://5ywan.com" target="_blank">现金斗地主扎金花，真人对战平台</A></li>
						<li class="LiPoint" ><A href="http://mb.shopex.cn/match2008" target="_blank" class="STYLE1">10万现金求模板 ShopEx电商模板大赛</A></li>
				  </ul>
	  </div>
			
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
				<li id="member_info_row">&nbsp;&nbsp;&nbsp; &nbsp;发表文章&nbsp;&nbsp;&nbsp; &nbsp;我的留言</li>
				<li id="member_info_row">&nbsp;&nbsp;&nbsp; &nbsp;<a href="member/index.jsp" target="_self">我的空间</a>&nbsp;&nbsp;&nbsp; &nbsp;<a href="member/index.jsp" target="_self">我的收藏</a></li>
				<li id="member_info_row">&nbsp;&nbsp;&nbsp; &nbsp;<span class="STYLE2">控制面板</span>&nbsp;&nbsp;&nbsp; &nbsp;<a href="outlogin.shtml" target="_self">注销登陆</a></li>				
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
				<A href="thread-article-<bean:write name="infoalltop" property="id"/>.html" target="_blank" class="STYLE10">
			<script language="javascript">
			var temptitle = '<bean:write name="infoalltop" property="title"/>';
			document.write(temptitle.substring(0,13));
			</script>
				</A>
			</li>
</logic:iterate>
			</div>
			
			<div id="left_adv">
				<div align="left" id="left_adv_row">&nbsp;&nbsp;&nbsp;&nbsp;<A href="http://www.zshen.com" target="_blank"> 专业平面设计制作</A></div>
				<div align="left" id="left_adv_row">&nbsp;&nbsp;&nbsp; &nbsp;<A href="http://www.zshen.com" target="_blank">影视广告制作</A></div>
				<div align="left" id="left_adv_row">&nbsp;&nbsp;&nbsp; &nbsp;<A href="http://www.zshen.com" target="_blank">画册设计制作</A></div>
				<div align="left" id="left_adv_row">&nbsp;&nbsp;&nbsp; &nbsp;<A href="http://www.zshen.com" target="_blank">企业网站设计制作</A></div>
				<div align="left" id="left_adv_row">&nbsp;&nbsp;&nbsp; &nbsp;<A href="http://www.zshen.com" target="_blank">专业钢结构信息</A></div>
				<div align="left" id="left_adv_row">&nbsp;&nbsp;&nbsp; &nbsp;<A href="http://www.zshen.com" target="_blank">专业钢结构信息展示平台</A></div>
			</div>
			
			<div id="left_info">
				<li id="left_info_row_title">&nbsp;&nbsp;&nbsp; &nbsp;<strong>会员排行</strong> </li>
<%int i=0;%>
<logic:iterate id="membertop" name="membertop" indexId="idx">
			
				<li style="height:20px; line-height:20px; list-style:inside; float:left; width:150px;">
				&nbsp;&nbsp;&nbsp; &nbsp;<font color="#FF0000"><b><%=++i%> .</b></font> <A href="thread-article-<bean:write name="membertop" property="username"/>.html" target="_blank" class="STYLE10">
			<script language="javascript">
			var temptitle = '<bean:write name="membertop" property="petname"/>';
			document.write(temptitle.substring(0,13));
			</script>
				</A>
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
				<a class="headLink" href="articleList-index-1003.html" target="_blank"><font color="#6C2D00">JSP</font></a> &nbsp;<span class="STYLE4">&amp;</span> &nbsp; 
				<a class="headLink" href="articleList-index-1004.html" target="_blank"><font color="#6C2D00">ASP</font></a> &nbsp; <span class="STYLE4">&amp;</span> &nbsp; 
				<a class="headLink" href="articleList-index-1002.html" target="_blank"><font color="#6C2D00">PHP</font></a> &nbsp; <span class="STYLE4">&amp;</span> &nbsp;
				<a class="headLink" href="articleList-index-1006.html" target="_blank"><font color="#6C2D00">网页设计</font></a></strong></span></li>
			  	
				<!---首页显示分类内容--->	
<logic:iterate id="infotop" name="infotop" indexId="idx">
			<li id="list_line_index_title">&nbsp;
				<A href="thread-article-<bean:write name="infotop" property="id"/>.html" target="_blank" class="STYLE10">
				<bean:write name="infotop" property="title"/>
				</A>
			</li>
			<li id="list_line_index_time">
			[ <logic:equal name="infotop" property="type" value="1002">PHP开发</logic:equal><logic:equal name="infotop" property="type" value="1003">JSP开发</logic:equal><logic:equal name="infotop" property="type" value="1004">ASP开发</logic:equal><logic:equal name="infotop" property="type" value="1006">网页技术</logic:equal> ] 
				<span class="STYLE6">
				<bean:write name="infotop" property="date_created" format="dd 日"/>
				</span>
			</li>
</logic:iterate>
		  </div>
			<div id="center_ad1"><img src="image/ad1.gif" width="485" height="60"></div>
			<!----数据库以及做站------->
			<div id="center_info">
				<li align="left" id="center_info_row_title">&nbsp;&nbsp;<span class="STYLE3">&nbsp;<strong>
				<a class="headLink" href="articleList-index-1001.html" target="_blank"><font color="#6C2D00">网站推广</font></a> &nbsp;<span class="STYLE4">&amp;</span> &nbsp; 
				<a class="headLink" href="articleList-index-1005.html" target="_blank"><font color="#6C2D00">数据库应用</font></a> &nbsp; <span class="STYLE4">&amp;</span> &nbsp;
				<a class="headLink" href="articleList-index-1007.html" target="_blank"><font color="#6C2D00">图形创意</font></a>
				 </strong></span> </li>
				 <!----中上部显示分类信息---->
<logic:iterate id="infomiddle" name="infomiddle" indexId="idx">
			<li id="list_line_index_title">&nbsp;
				<A href="thread-article-<bean:write name="infomiddle" property="id"/>.html" target="_blank" class="STYLE10">
				<bean:write name="infomiddle" property="title"/>
				</A>
			</li>
			<li id="list_line_index_time">
			[ <logic:equal name="infomiddle" property="type" value="1001">网站推广</logic:equal><logic:equal name="infomiddle" property="type" value="1005">数据库应用</logic:equal><logic:equal name="infomiddle" property="type" value="1007">图形创意</logic:equal> ] 
				<span class="STYLE6">
				<bean:write name="infomiddle" property="date_created" format="dd 日"/>
				</span>
			</li>
</logic:iterate>				
				
			</div>
			
			
			<div id="center_info">
				<li align="left" id="center_info_row_title">&nbsp;&nbsp;<span class="STYLE3">&nbsp; <strong>
				<a class="headLink" href="articleList-index-1008.html" target="_blank"><font color="#6C2D00">文档教程</font></a> &nbsp;<span class="STYLE4">&amp;</span> &nbsp; 
				<a class="headLink" href="articleList-index-1009.html" target="_blank"><font color="#6C2D00">javascript</font></a> &nbsp; </strong></span> 
				</li>
				<!---中下部显示分类信息---->
<logic:iterate id="infocenter" name="infocenter" indexId="idx">
			<li id="list_line_index_title">&nbsp;
				<A href="thread-article-<bean:write name="infocenter" property="id"/>.html" target="_blank" class="STYLE10">
				<bean:write name="infocenter" property="title"/>
				</A>
			</li>
			<li id="list_line_index_time">
			[ <logic:equal name="infocenter" property="type" value="1008">文档教程</logic:equal><logic:equal name="infocenter" property="type" value="1009">javascript</logic:equal> ] 
				<span class="STYLE6">
				<bean:write name="infocenter" property="date_created" format="dd 日"/>
				</span>
			</li>
</logic:iterate>					
				
			</div>
			<!---休闲放松-->
			<div id="center_info_1">
				<li align="left" id="center_info_1_row_title">&nbsp;&nbsp;<span class="STYLE3">&nbsp; <strong>
		        <a class="headLink" href="articleList-index-1010.html" target="_blank"><font color="#6C2D00">休闲娱乐</font></a> &nbsp;</strong></span> </li>
<logic:iterate id="info1010" name="info1010" indexId="idx">
			<li id="list_line_index_title">&nbsp;
				<A href="thread-article-<bean:write name="info1010" property="id"/>.html" target="_blank" class="STYLE10">
				<bean:write name="info1010" property="title"/>
				</A>
			</li>
			<li id="list_line_index_time">
			[ <logic:equal name="info1010" property="type" value="1010">休闲娱乐</logic:equal> ] 
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
				<li><a target="_blank" href="http://www.zshen.com/"><img src="image/01.jpg"></a></li>
				<li><a target="_blank" href="http://www.zshen.com/"><img src="image/02.jpg"></a></li>
				<li><a target="_blank" href="http://www.zshen.com/"><img src="image/03.jpg"></a></li>
				<li><a target="_blank" href="http://www.zshen.com/"><img src="image/04.jpg"></a></li>
				<li><a target="_blank" href="http://www.zshen.com/"><img src="image/05.jpg"></a></li>
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
			<A href="thread-article-<bean:write name="info1000" property="id"/>.html" target="_blank" class="STYLE10"><bean:write name="info1000" property="title"/></A>
			</li>
</logic:iterate>	
		
			</div>
			<!----右侧广告位------->
			
			<div id="right_image_adv">
				<img src="image/right_adv1.bmp" height="60" width="298">
			</div>
			<div id="right_info_2">
				<li id="right_info_2_row_title">&nbsp;&nbsp;&nbsp; &nbsp;<strong>精品导读</strong> 
				</li>
<logic:iterate id="infoshow" name="infoshow" indexId="idx">
			<li id="right_info_row">
			
			&nbsp;&nbsp;&nbsp; <span class="STYLE6">&nbsp;
			<bean:write name="infoshow" property="date_created" format="dd 日" /></span> 
			<A href="thread-article-<bean:write name="infoshow" property="id"/>.html" target="_blank" class="STYLE10">
			
			<script language="javascript">
			var temptitle = '<bean:write name="infoshow" property="title"/>';
			document.write(temptitle.substring(0,22));
			</script>
			</A>
			</li>
</logic:iterate>					
			</div>
			
			<div id="right_image_adv2">
				<img src="image/right_adv2.bmp" height="60" width="298">
			</div>
			
			<div id="right_info_3">
				<li id="right_info_3_row_title">&nbsp;&nbsp;&nbsp;<strong>常用工具</strong></li>
				<li id="right_info_3_row">
				&nbsp;&nbsp;&nbsp; <A href="http://www.ip138.com" target="_blank">IP查询</A>
				&nbsp;&nbsp;&nbsp; <A href="http://www.hao123.com/haoserver/kuaidi.htm" target="_blank">快递查询</A>
				&nbsp;&nbsp;&nbsp; <A href="http://www.hao123.com/haoserver/showjicc.htm" target="_blank">手机号码</A>
				&nbsp;&nbsp;&nbsp; <A href="http://weather.news.sina.com.cn" target="_blank">天气预报</A>
				</li>
				<li id="right_info_3_row">
				&nbsp;&nbsp;&nbsp; <A href="http://www.ip138.com/post/" target="_blank">邮编区号</A>
				&nbsp;&nbsp;&nbsp; <A href="http://flights.ctrip.com/Domestic/SearchFlights.aspx" target="_blank">旅行航班</A>
				&nbsp;&nbsp;&nbsp; <A href="http://www.hao123.com/ss/lccx.htm" target="_blank">列车时刻</A>
				&nbsp;&nbsp;&nbsp; <A href="http://translate.google.cn/translate_t?hl=zh-CN#" target="_blank">在线翻译</A>
				</li>
				<li id="right_info_3_row">
				&nbsp;&nbsp;&nbsp; <A href="http://www.hao123.com/haoserver/wn.htm" target="_blank">万年历</A>
				&nbsp;&nbsp;&nbsp; <A href="http://bus.mapbar.com" target="_blank">公交线路</A>
				&nbsp;&nbsp;&nbsp; <A href="http://map.baidu.com/" target="_blank">在线地图</A>
				&nbsp;&nbsp;&nbsp; <A href="http://www.pconline.com.cn/market/" target="_blank">电脑价格</A>
				</li>
				<li id="right_info_3_row">
				&nbsp;&nbsp;&nbsp; <A href="http://alexa.chinaz.com" target="_blank">Alexa排名查询</A>
				&nbsp;&nbsp;<A href="http://link.cnkuai.cn/pr.asp?act=search" target="_blank">PR值查询</A>
				&nbsp;&nbsp;<A href="http://www.123cha.com/search_engine" target="_blank">搜索收录和反向链接</A>
				</li>
				<li id="right_info_3_row">
				&nbsp;&nbsp;&nbsp; <A href="http://www.hao123.com/soft/sogoupy/default.htm" target="_blank">搜狗拼音输入法</A>
				&nbsp;&nbsp;<A href="http://www.hao123.com/soft/360anquan/default.htm" target="_blank">360安全卫士</A>
				&nbsp;&nbsp;<A href="http://www.hao123.com/soft/winrar/default.htm" target="_blank">WinRAR 中文版</A>
				</li>	
				<li id="right_info_3_row">
				&nbsp;&nbsp;&nbsp; <A href="http://www.hao123.com/soft/mympc/default.htm" target="_blank">暴风影音</A>
				&nbsp;&nbsp;<A href="http://www.hao123.com/soft/Thunder/default.htm" target="_blank">迅雷</A>
				&nbsp;&nbsp;<A href="http://www.hao123.com/soft/wom/default.htm" target="_blank">优化大师</A>
				&nbsp;&nbsp;<A href="http://www.hao123.com/soft/adobereader/default.htm" target="_blank">Adobe Reader中文版</A>
				</li>
				<li id="right_info_3_row">
				&nbsp;&nbsp;&nbsp; <A href="http://www.linkwan.com/gb/broadmeter/SpeedAuto/" target="_blank">网速测试</A>
				&nbsp;&nbsp;<A href="http://www.miibeian.gov.cn/" target="_blank">网站备案</A>
				&nbsp;&nbsp;<A href="http://www.hao123.com/haoserver/jianfanzh.htm" target="_blank">简体字繁体字转换</A>
				</li>	
			</div>
			
		</div>
	</div>
	
	<div align="center" id="bottom_adv">
		<div id="bottom_adv_left"><img src="image/hb666.gif" height="70" width="978"></div>
	</div>
	<div align="center">
		<div id="bottom_adv_left">
		<jsp:include page="link.jsp"></jsp:include>
		</div>
	</div>
	<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>
