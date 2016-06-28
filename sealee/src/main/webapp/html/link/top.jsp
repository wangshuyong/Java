
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="keywords" content="网页设计，网页设计教程">
<meta name="description" content="提供网页设计相关教程资料">
<title></title>
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="Shortcut Icon" href="favicon.ico">
<link rel="Bookmark" href="favicon.ico">

<div id="topest">	
	  <div align="right" style="width:400px; margin-left:550px;">
	  <ul style=" text-align: right">
		<li class="LiNoPointTop" style="border:none"><a href="../../login.jsp" target="_self">会员登录</a></li>
		<li class="LiNoPointTop"><a href="../../register.jsp" target="_self">注册会员</a></li>
		<li class="LiNoPointTop"><a href="javascript:bookmarkit()">添加收藏</a></li>
	  </ul>
	  </div>
	</div>
	<div id="divBorder">
	  <div id="topLogo"></div>
	  <div id="banner_right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<h1 style="font-size:12px; display:inline"></h1></div>
	  <div id="banner"><img alt=""  src="../../image/banne1_sealee.gif"  border="0" height="60" width="468"/></div>
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
	<!------搜索栏----->
	<form id="search_form" name="search_form" action="" method="post">
	<div id="search">
		<ul style=" text-align:center">
			<li class="LiNoPointSearch" style="border:none">搜索热门：</li>
			<li class="LiNoPointSearch">
			<a href="../../searchinfo.shtml?urlcondition=jsp" target="_self">JSP源码</a>
			</li>
			<li class="LiNoPointSearch">
			<a href="../../searchinfo.shtml?urlcondition=%CD%F8%D2%B3%C9%E8%BC%C6" target="_self">网页设计</a>
			</li>
			<li class="LiNoPointSearch">
			<a href="../../searchinfo.shtml?urlcondition=%CD%F8%D5%BE%CD%C6%B9%E3" target="_self">网站推广</a>
			</li>
			<li class="LiNoPointSearch">
			<a href="../../searchinfo.shtml?urlcondition=%C9%E8%BC%C6%CE%C4%B5%B5" target="_self">设计文档</a>
			</li>
			<li class="LiNoPointSearch">
			<a href="../../searchinfo.shtml?urlcondition=java" target="_self">JAVA开发</a>
			</li>
			<li class="LiNoPointSearch" style="margin-left:200px; width:300px; line-height:27px;">
			<nobr>智能搜索：<input align="absmiddle" type="text" name="condition" id="condition">
			  <input type="image" src="../../image/btn_search.gif" name="button" value="提交" onClick="return searchcheck()"/>   </nobr>		
			</li>
	  </ul>
	</div>
	</form>

<script language="javascript">
	function searchcheck(){
		if(document.search_form.condition.value==''){
			alert('对不起，请输入查询条件！');
			return false;
			document.search_form.condition.focus();
		}else{
			var tempurl = document.search_form.condition.value;
			search_form.action = "../../searchinfo.shtml?urlcondition="+tempurl;
			search_form.submit();
		}
	}
	
	function bookmarkit(){
	window.external.addfavorite("/","")
	}
	function rundemo(k){
		var democode=document.getElementById(k).value
		var demowin=window.open()
		
		demowin.document.open();
		demowin.document.write(democode)
		demowin.document.close();
	}

</script>