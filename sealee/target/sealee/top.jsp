<%@ page language="java" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="Shortcut Icon" href="favicon.ico">
<link rel="Bookmark" href="favicon.ico">
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
	  <div id="banner_right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <h1 style="font-size:12px; display:inline">
	  如何制作网站，如何制作网页，怎样/怎么制作网页，海乐网提供专业的网站制作教程，网页制作教程，网页设计教程。
	  </h1>
	  </div>
	  <div id="banner"><img alt="网页设计教程-海乐网" src="image/banne1_sealee.gif"  border="0" height="60" width="468"/></div>  
	</div>
	<div id="top">	
	  <ul style=" text-align:center; margin-left:0px;">
		<li class="LiNoPoint" style="border:none;">
		<a class="topLink" href="index.html" target="_self"><font color="#FFFFFF">主页</font></a>
		</li>
		<li class="LiNoPoint">
		<a class="topLink" href="html/1000/index.html" target="_self"><font color="#FFFFFF">行业动态</font></a>
		</li>
		<li class="LiNoPoint">
		<a class="topLink" href="html/1001/index.html" target="_self"><font color="#FFFFFF">网站推广</font></a>
		</li>
		<li class="LiNoPoint">
		<a class="topLink" href="html/1002/index.html" target="_self"><font color="#FFFFFF">PHP教程</font></a>
		</li>
		<li class="LiNoPoint">
		<a class="topLink" href="html/1003/index.html" target="_self"><font color="#FFFFFF">JAVA教程</font></a>
		</li>
		<li class="LiNoPoint">
		<a class="topLink" href="html/1004/index.html" target="_self"><font color="#FFFFFF">ASP教程</font></a>
		</li>
		<li class="LiNoPoint">
		<a class="topLink" href="html/1005/index.html" target="_self"><font color="#FFFFFF">数据库教程</font></a>
		</li>
		<li class="LiNoPoint">
		<a class="topLink" href="html/1006/index.html" target="_self"><font color="#FFFFFF">网页设计教程</font></a>
		</li>
		<li class="LiNoPoint">
		<a class="topLink" href="html/1007/index.html" target="_self"><font color="#FFFFFF">图形创意</font></a>
		</li>
		<li class="LiNoPoint">
		<a class="topLink" href="html/1008/index.html" target="_self"><font color="#FFFFFF">系统设计文档</font></a>
		</li>
		<li class="LiNoPoint">
		<a class="topLink" href="html/1009/index.html" target="_self"><font color="#FFFFFF">javascript教程</font></a>
		</li>
	  </ul>
	</div>
	<form id="search_form" name="search_form" action="" method="post">
	<div id="search">
		<ul style=" text-align:center">
			<li class="LiNoPointSearch" style="border:none">搜索热门：</li>
			<li class="LiNoPointSearch">
			<a href="searchinfo.shtml?urlcondition=jsp" target="_self">JSP源码</a>
			</li>
			<li class="LiNoPointSearch">
			<a href="searchinfo.shtml?urlcondition=%CD%F8%D2%B3%C9%E8%BC%C6" target="_self">网页设计</a>
			</li>
			<li class="LiNoPointSearch">
			<a href="searchinfo.shtml?urlcondition=%CD%F8%D5%BE%CD%C6%B9%E3" target="_self">网站推广</a>
			</li>
			<li class="LiNoPointSearch">
			<a href="searchinfo.shtml?urlcondition=%C9%E8%BC%C6%CE%C4%B5%B5" target="_self">设计文档</a>
			</li>
			<li class="LiNoPointSearch">
			<a href="searchinfo.shtml?urlcondition=JAVA" target="_self">JAVA</a>
			</li>
			<li class="LiNoPointSearch" style="margin-left:200px; width:300px; line-height:27px;"><nobr>智能搜索：<input align="absmiddle" type="text" name="condition">
			  <input type="image" src="image/btn_search.gif" name="button" value="提交" onClick=/>   </nobr>		
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
			search_form.action = "searchinfo.shtml?urlcondition="+tempurl;
			search_form.submit();
		}
	}
	
	function bookmarkit(){
	window.external.addfavorite("/","专业的WEB开发网站推广技术")
	}
	function rundemo(k){
		var democode=document.getElementById(k).value
		var demowin=window.open()
		
		demowin.document.open();
		demowin.document.write(democode)
		demowin.document.close();
	}

</script>