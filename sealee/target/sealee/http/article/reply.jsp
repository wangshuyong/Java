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
String info_id = "";
if(request.getAttribute("info_id")!=null&&!request.getAttribute("info_id").equals("")){
	info_id = (String)request.getAttribute("info_id");
}
System.out.println("已经执行到了这个页面");
%>
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
<html>
</head>
				<li  id="view_noline"><BR>
                <strong>评论:</strong><span class="STYLE17">请自觉遵守互联网相关政策法规，作者管理后台可以删除恶意评论、广告和违禁词语。</span>
				</li>
<html:form action="../../reply.shtml" method="post" onsubmit="check();return false;">
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
