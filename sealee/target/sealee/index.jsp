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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="y_key" content="662168cba92c1f9b" />
<meta name="verify-v1" content="nTm8Dxznc5R2V6pRAqJWMouH0Op+1GjR9Cgf9S34L7A=" />
<title></title>
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
<body style="text-align:center;" onLoad="ajax_user()">
<div id="kuang">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="Shortcut Icon" href="favicon.ico">
<link rel="Bookmark" href="favicon.ico">
<div align="center">
    <div id="topest" style="margin-top:0px;">	
	  <div align="right" style="width:400px; margin-left:550px;">
	  <ul style=" text-align: right">
		<li class="LiNoPointTop" style="border:none"><a href="login.jsp" target="_self">会员登录</a></li>
		<li class="LiNoPointTop"><a href="register.jsp" target="_self">注册会员</a></li>
		<li class="LiNoPointTop"><a href="javascript:bookmarkit()">添加收藏</a></li>
	  </ul>
	  </div>
</div>
	<div id="divBorder">
	  <div id="topLogo"></div>
	  <div id="banner_right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<h1 style="font-size:12px; display:inline">王树勇</h1></div>
	  <div id="banner"><img alt="文件柜" src="image/jianyan.jpg"  border="0" height="60" width="468"/></div>  
	</div>
	<div id="top">
	  <ul style=" text-align:center; margin-left:0px;">
		<li class="LiNoPoint" style="border:none;">
		<a class="topLink" href="index.html" target="_self"><font color="#FFFFFF">主页</font></a>
		</li>
		<li class="LiNoPoint">
		<a class="topLink" href="html/1000/index.jsp" target="_self"><font color="#FFFFFF">职场生涯</font></a>
		</li>
		<li class="LiNoPoint">
		<a class="topLink" href="html/1001/index.jsp" target="_self"><font color="#FFFFFF">IT技术</font></a>
		</li>
		<li class="LiNoPoint"><a class="topLink" href="html/1002/index.jsp"  target="_self"> <font color="#FFFFFF">公文百科</font></a></li>
		<li class="LiNoPoint"><a class="topLink" href="html/1003/index.jsp" target="_self"><font color="#FFFFFF">励志书籍</font></a></li>
		<li class="LiNoPoint"><a class="topLink" href="html/1004/index.jsp" target="_self"><font color="#FFFFFF">医药医学</font></a></li>
		<li class="LiNoPoint"><a class="topLink" href="html/1005/index.jsp" target="_self"><font color="#FFFFFF">学生专栏</font></a></li>
		<li class="LiNoPoint">
		<a class="topLink" href="html/1006/index.jsp" target="_self"><font color="#FFFFFF">网页设计教程</font></a>
		</li>
		<li class="LiNoPoint">
		<a class="topLink" href="html/1007/index.jsp" target="_self"><font color="#FFFFFF">图形创意</font></a>
		</li>
		<li class="LiNoPoint">
		<a class="topLink" href="html/1008/index.jsp" target="_self"><font color="#FFFFFF">系统设计文档</font></a>
		</li>
		<li class="LiNoPoint">
		<a class="topLink" href="html/1009/index.jsp" target="_self"><font color="#FFFFFF">javascript教程</font></a>
		</li>
	  </ul>
	</div>
	<form id="search_form" name="search_form" action="" method="post">
	<div id="search">
		<ul style=" text-align:center">
			<li class="LiNoPointSearch" style="border:none">搜索热门：</li>
			<li class="LiNoPointSearch">
			<a href="searchinfo.shtml?urlcondition=jsp" target="_self">职业生涯</a>
			</li>
			<li class="LiNoPointSearch">
			<a href="searchinfo.shtml?urlcondition=%CD%F8%D2%B3%C9%E8%BC%C6" target="_self">IT技术</a>
			</li>
			<li class="LiNoPointSearch">
			<a href="searchinfo.shtml?urlcondition=%CD%F8%D5%BE%CD%C6%B9%E3" target="_self">公文百科</a>
			</li>
			<li class="LiNoPointSearch">
			<a href="searchinfo.shtml?urlcondition=%C9%E8%BC%C6%CE%C4%B5%B5" target="_self">励志书籍</a>
			</li>
			<li class="LiNoPointSearch">
			<a href="searchinfo.shtml?urlcondition=java" target="_self">医药医学</a>
			</li>
			<li class="LiNoPointSearch" style="margin-left:200px; width:300px; line-height:27px;"><nobr>智能搜索：<input align="absmiddle" type="text" name="condition">
			  <input type="image" src="image/btn_search.gif" name="button" value="提交" onClick=""/>   </nobr>		
			</li>
	  </ul>
	</div>
	</form>
	</div>
<script language="javascript">
	function searchcheck(){
		if(document.search_form.condition.value==''){
			alert('对不起，请输入查询条件！');
			return false;
			document.search_form.condition.focus();
		}else{
			var tempurl = document.search_form.condition.value;
			search_form.action = "searchinfo.shtml?urlcondition="+tempurl;
			search_form.submit();
		}
	}
	function getcondition(){
		
		document.wirte(tempurl);
	}
	function bookmarkit(){
	window.external.addfavorite("/","-专业的WEB开发技术，编程技术，网页设计，设计文档，网站推广教程")
	}
	function rundemo(k){
		var democode=document.getElementById(k).value
		var demowin=window.open()
		
		demowin.document.open();
		demowin.document.write(democode)
		demowin.document.close();
	}

</script>	
	
	<!------网页正文栏-------->
   
	<div align="center" id="body_all">
		<!----正文左侧内容--------->
		<div id="body_left" align="left">
			<!---会员信息--->
			<div id="member_info">
				<li id="member_info_row_title">&nbsp;&nbsp;&nbsp; &nbsp;<strong>会员中心</strong></li>
			     <%if(member!=null&&!member.equals("")){%>
				<li id="member_info_row">&nbsp;&nbsp;&nbsp; &nbsp;当前用户：<strong><font color="#FF0000"><%=member%></font></strong> </li>
				<li id="member_info_row">&nbsp;&nbsp;&nbsp; &nbsp;<a href="member/newarticle.jsp" target="_self">发表文章</a>&nbsp;&nbsp;&nbsp; &nbsp;我的留言</li>
				<li id="member_info_row">&nbsp;&nbsp;&nbsp; &nbsp;<a href="member/index.jsp" target="_self">我的空间</a>&nbsp;&nbsp;&nbsp; &nbsp;<a href="member/index.jsp" target="_self">我的收藏</a></li>
				<li id="member_info_row">&nbsp;&nbsp;&nbsp; &nbsp;<a href="member/main.jsp" target="_self"><span class="STYLE2">控制面板</span></a>&nbsp;&nbsp;&nbsp; &nbsp;<a href="outlogin.shtml" target="_self">注销登</a></li>				
	<%}else{%>
				<li id="member_info_row">&nbsp;&nbsp;&nbsp; &nbsp;当前状态：<strong>游客</strong> </li>
				<li id="member_info_row">&nbsp;&nbsp;&nbsp; &nbsp;发表文章&nbsp;&nbsp;&nbsp; &nbsp;我的留言</li>
				<li id="member_info_row">&nbsp;&nbsp;&nbsp; &nbsp;我的空间&nbsp;&nbsp;&nbsp; &nbsp;我的收藏</li>
				<li id="member_info_row">&nbsp;&nbsp;&nbsp; &nbsp;<span class="STYLE2"><a href="login.jsp" target="_self">马上登录</a></span>&nbsp;&nbsp;&nbsp; &nbsp;<span class="STYLE1"><a href="register.jsp" target="_self"><font color="red">注册会员</font></a></span></li>
				<%}%>
			</div>
			
			<div id="left_info">
				<li id="left_info_row_title">&nbsp;&nbsp;&nbsp; &nbsp;<b>会员排行</b></li>
				<li style="height:20px; line-height:20px;float:left; width:150px;">
				&nbsp;&nbsp;&nbsp;&nbsp;
					ying
				</li>
				<li style="height:20px; line-height:20px; float:left; width:27px;">
				<span class="STYLE6">30</span>
				</li>
			
				<li style="height:20px; line-height:20px;float:left; width:150px;">
				&nbsp;&nbsp;&nbsp;&nbsp;
					可可
				</li>
				<li style="height:20px; line-height:20px; float:left; width:27px;">
				<span class="STYLE6">22</span>
				</li>
			
				<li style="height:20px; line-height:20px;float:left; width:150px;">
				&nbsp;&nbsp;&nbsp;&nbsp;
					周小姐
				</li>
				<li style="height:20px; line-height:20px; float:left; width:27px;">
				<span class="STYLE6">20</span>
				</li>
			
				<li style="height:20px; line-height:20px;float:left; width:150px;">
				&nbsp;&nbsp;&nbsp;&nbsp;
					glamey
				</li>
				<li style="height:20px; line-height:20px; float:left; width:27px;">
				<span class="STYLE6">10</span>
				</li>
			
				<li style="height:20px; line-height:20px;float:left; width:150px;">
				&nbsp;&nbsp;&nbsp;&nbsp;
					小谢
				</li>
				<li style="height:20px; line-height:20px; float:left; width:27px;">
				<span class="STYLE6">10</span>
				</li>
			
				<li style="height:20px; line-height:20px;float:left; width:150px;">
				&nbsp;&nbsp;&nbsp;&nbsp;
					花泽静
				</li>
				<li style="height:20px; line-height:20px; float:left; width:27px;">
				<span class="STYLE6">10</span>
				</li>
			
				<li style="height:20px; line-height:20px;float:left; width:150px;">
				&nbsp;&nbsp;&nbsp;&nbsp;
					chinanpn
				</li>
				<li style="height:20px; line-height:20px; float:left; width:27px;">
				<span class="STYLE6">10</span>
				</li>
			
				<li style="height:20px; line-height:20px;float:left; width:150px;">
				&nbsp;&nbsp;&nbsp;&nbsp;
					turen
				</li>
				<li style="height:20px; line-height:20px; float:left; width:27px;">
				<span class="STYLE6">0</span>
				</li>
			
			</div>
            <!----文章点击排行�------->
			<div id="note_top">
				<li align="left" id="note_top_row_title">&nbsp;&nbsp;&nbsp; &nbsp;<strong>本周TOP</strong> </li>
<logic:iterate id="infoalltop" name="infoalltop" indexId="idx">
			<li id="note_top_row">
				<A href="html/<bean:write name="infoalltop" property="type"/>/<bean:write name="infoalltop" property="title"/>.html" target="_blank" class="STYLE10">
			<script language="javascript">
			var temptitle = '<bean:write name="infoalltop" property="title"/>';
			document.write(temptitle.substring(0,11));
			</script>
				</A>
			</li>
</logic:iterate>
			</div>
			
		</div>
		<!--------正文中间部分---------->
		<div id="body_center" align="left">
			<div id="center_info" >
				<li align="left" id="center_info_row_title">&nbsp;&nbsp;<span class="STYLE3">&nbsp; <B>
				<a class="headLink" href="html/1003/index.html" target="_blank"><font color="#6C2D00">职业生涯</font></a> &nbsp;<span class="STYLE4">&amp;</span> &nbsp; 
				<a class="headLink" href="html/1004/index.html" target="_blank"><font color="#6C2D00">公文百科</font></a> &nbsp;<span class="STYLE4">&amp;</span> &nbsp; 
				<a class="headLink" href="html/1002/index.html" target="_blank"><font color="#6C2D00">励志书籍</font></a> &nbsp;<span class="STYLE4">&amp;</span> &nbsp;
				<a class="headLink" href="html/1006/index.html" target="_blank"><font color="#6C2D00">网页设计教程</font></a></B></span>
				</li>
			<li id="list_line_index_title">&nbsp;
				<A href="html/1006/4ecd45a4-1863-4ec8-a005-cc165146a095.html" target="_blank" class="STYLE10">
				网页设计中CSS属性简介
				</A>
			</li>
			<li id="list_line_index_time">
				网页设计教程
				<span class="STYLE6">
				18 日
				</span>
			</li>
			<li id="list_line_index_title">&nbsp;
				<A href="html/1006/faa7520e-b46f-4a9b-84c9-99bd90046898.html" target="_blank" class="STYLE10">
				网页制作常用特殊符号汇总
				</A>
			</li>
			<li id="list_line_index_time">
				网页设计教程
				<span class="STYLE6">
				18 日
				</span>
			</li>
		
		  </div>
			
			<div id="center_info">
				<li align="left" id="center_info_row_title">&nbsp;&nbsp;<span class="STYLE3">&nbsp;<strong>
				<a class="headLink" href="html/1001/index.html" target="_blank"><font color="#6C2D00">医药医学</font></a> &nbsp;<span class="STYLE4">&amp;</span> &nbsp; 
				<a class="headLink" href="html/1005/index.html" target="_blank"><font color="#6C2D00">保健养生</font></a> &nbsp; <span class="STYLE4">&amp;</span> &nbsp;
				<a class="headLink" href="html/1007/index.html" target="_blank"><font color="#6C2D00">图形创意教程</font></a>
  </strong></span> </li>
				 <!----中上部显示信息--->
			
			<li id="list_line_index_title">&nbsp;
				<A href="html/1005/a138c04d-9aae-425c-9b5c-70228f13af1f.html" target="_blank" class="STYLE10">
				如何解决Sqlserver占用内存问题
				</A>
			</li>
			<li id="list_line_index_time">
				数据库教程
								<span class="STYLE6">
				03 日
				</span>
			</li>
			<li id="list_line_index_title">&nbsp;
				<A href="html/1001/67170f06-ddb9-423c-820c-f3c8262a02b6.html" target="_blank" class="STYLE10">
				网站顶部文字对整体页面的影响
				</A>
			</li>
			<li id="list_line_index_time">
				网站推广教程
								<span class="STYLE6">
				03 日
				</span>
			</li>
		</div>
           
          
			<div id="center_info">
				<li align="left" id="center_info_row_title">&nbsp;&nbsp;<span class="STYLE3">&nbsp; <strong>
				<a class="headLink" href="html/1008/index.html" target="_blank"><font color="#6C2D00">系统设计文档</font></a> &nbsp;<span class="STYLE4">&amp;</span> &nbsp; 
				<a class="headLink" href="html/1009/index.html" target="_blank"><font color="#6C2D00">javascript教程</font></a> &nbsp; </strong></span> 
				</li>
				<!---中下部显示信息--->
			<li id="list_line_index_title">&nbsp;
				<A href="html/1009/aba64d03-3038-4721-9068-a73c3c710d00.html" target="_blank" class="STYLE10">
				JavaScript递增和递减运算符使用方法
				</A>
			</li>
			<li id="list_line_index_time">
				javascript教程
				<span class="STYLE6">
				18 日
				</span>
			</li>
		</div>
	  </div>
      <div align="left" id="right_info"> 
         <div align="right" id="right_info" >
               <li align="left" id="center_info_row_title">&nbsp;&nbsp;<span class="STYLE3">&nbsp; <B>
				<a class="headLink" href="html/1003/index.html" target="_blank"><font color="#6C2D00">职业生涯</font></a> &nbsp;<span class="STYLE4">&amp;</span> &nbsp; 
				<a class="headLink" href="html/1004/index.html" target="_blank"><font color="#6C2D00">公文百科</font></a> &nbsp;<span class="STYLE4">&amp;</span> &nbsp; 
				<a class="headLink" href="html/1002/index.html" target="_blank"><font color="#6C2D00">励志书籍</font></a> &nbsp;<span class="STYLE4">&amp;</span> &nbsp;
				<a class="headLink" href="html/1006/index.html" target="_blank"><font color="#6C2D00">网页设计教程</font></a></B></span>
				</li>
			<li id="list_line_index_title">&nbsp;
				<A href="html/1006/4ecd45a4-1863-4ec8-a005-cc165146a095.html" target="_blank" class="STYLE10">
				网页设计中CSS属性简介
				</A>
			</li>
    </div>
    <div align="right" id="right_info" >
   <li align="left" id="center_info_row_title">&nbsp;&nbsp;<span class="STYLE3">&nbsp; <B>
				<a class="headLink" href="html/1003/index.html" target="_blank"><font color="#6C2D00">职业生涯</font></a> &nbsp;<span class="STYLE4">&amp;</span> &nbsp; 
				<a class="headLink" href="html/1004/index.html" target="_blank"><font color="#6C2D00">公文百科</font></a> &nbsp;<span class="STYLE4">&amp;</span> &nbsp; 
				<a class="headLink" href="html/1002/index.html" target="_blank"><font color="#6C2D00">励志书籍</font></a> &nbsp;<span class="STYLE4">&amp;</span> &nbsp;
				<a class="headLink" href="html/1006/index.html" target="_blank"><font color="#6C2D00">网页设计教程</font></a></B></span>
				</li>
			<li id="list_line_index_title">&nbsp;
				<A href="html/1006/4ecd45a4-1863-4ec8-a005-cc165146a095.html" target="_blank" class="STYLE10">
				网页设计中CSS属性简介
				</A>
			</li>
    </div>
    <div align="right" id="right_info" >
   <li align="left" id="center_info_row_title">&nbsp;&nbsp;<span class="STYLE3">&nbsp; <B>
				<a class="headLink" href="html/1003/index.html" target="_blank"><font color="#6C2D00">职业生涯</font></a> &nbsp;<span class="STYLE4">&amp;</span> &nbsp; 
				<a class="headLink" href="html/1004/index.html" target="_blank"><font color="#6C2D00">公文百科</font></a> &nbsp;<span class="STYLE4">&amp;</span> &nbsp; 
				<a class="headLink" href="html/1002/index.html" target="_blank"><font color="#6C2D00">励志书籍</font></a> &nbsp;<span class="STYLE4">&amp;</span> &nbsp;
				<a class="headLink" href="html/1006/index.html" target="_blank"><font color="#6C2D00">网页设计教程</font></a></B></span>
				</li>
			<li id="list_line_index_title">&nbsp;
				<A href="html/1006/4ecd45a4-1863-4ec8-a005-cc165146a095.html" target="_blank" class="STYLE10">
				网页设计中CSS属性简介
				</A>
			</li>
    </div>
    </div>
	  <div align="center" id="bottom">
		<div align="center" id="bottom_line"><a href="links.shtml" target="_self">友情链接</a>　-  
		<a href="note.jsp" target="_self">网站声明</a>　- 
		<a href="advertise.jsp" target="_self">广告服务</a> - 
		<A href="javascript:QQChat('408199514')">建议反馈 有问必答</a>　-
		<a href="contact.jsp" target="_self">联系我们</a></div>
		<div align="center" id="bottom_line">Copyright @  <B>网页设计教程</B> All Rights Reserved		</div>
		<div align="center" id="bottom_line"><a href="http://" target="_blank">豫ICP备号</a></div>
		<div align="center" id="bottom_line">	费奥网为您提供<a href="http://">网页设计</a>、<a href="http://">网页设计教程</a>、<a href="">网页制作教程</a>、<a href="">网站制作教程</a>、<a href="">设计文档</a>、<a href="">网站设计文档</a>以及<a href=""></a>
		<script src="http://s68.cnzz.com/stat.php?id=1205456&web_id=1205456" language="JavaScript" charset="gb2312"></script>
		<script language="javascript" type="text/javascript" src="http://js.users.51.la/2463304.js"></script>
<noscript><a href="http://www.51.la/?2463304" target="_blank"><img alt="&#x6211;&#x8981;&#x5566;&#x514D;&#x8D39;&#x7EDF;&#x8BA1;" src="http://img.users.51.la/2463304.asp" style="border:none" /></a></noscript></div>
      </div>
    </div>
<script language="javascript">
function QQChat(qqnumber) {
    try {
        new ActiveXObject("TimwpDll.TimwpCheck");
        location.href = 'Tencent://Message/?menu=yes&exe=&uin=' + qqnumber + '&websiteName=bbsmax&info=';
    } catch (e) {
        alert("你没有安装QQ或浏览器不支持，不能与该用户直接对话");
    }
}

</script></div>
</body>
</html>