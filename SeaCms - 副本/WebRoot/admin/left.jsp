<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- 
<script type="text/javascript">
	Ext.onReady( function() {
		//Ext.Msg.alert('ext','welcome you!');
		var addPanel = function(btn, event) {
			var n;
			n = tabPanel.getComponent(btn.id);
			if(n) {
				tabPanel.setActiveTab(n);
				return;
			}
			n = tabPanel.add( {
				id : btn.id,
				title : btn.text,
				html : '<iframe width=100% height=100% src=' + btn.id + ' />',
				//autoLoad : '',
				closable : 'true'
			});
			tabPanel.setActiveTab(n);
		}

		var item1 = new Ext.Panel( {
			title : '用户管理',
			//html : '&lt;empty panel&gt;',
			cls : 'empty',
			items : [ 
				new Ext.Button({
					id : '<%=basePath%>user/User_list',
					text : '用户列表',
					width : '100%',
					listeners : {
						click : addPanel
					}

				}),

				new Ext.Button({
					id : '<%=basePath%>admin/user/User_add.jsp',
					text : '添加用户',
					width : '100%',
					listeners : {
						click : addPanel
					}

				}),
				
				new Ext.Button({
					id : 'User_update',
					text : '编辑用户',
					width : '100%',
					listeners : {
						click : addPanel
					}

				})

				]
		});

		var item2 = new Ext.Panel( {
			title : 'Accordion Item 2',
			html : '&lt;empty panel&gt;',
			cls : 'empty',
			items : [ 
				new Ext.Button({
					id : 'test',
					text : 'test列表',
					width : '100%',
					listeners : {
						click : addPanel
					}

				}),

				]
		});

		var item3 = new Ext.Panel( {
			title : 'Accordion Item 3',
			html : '&lt;empty panel&gt;',
			cls : 'empty'
		});

		var item4 = new Ext.Panel( {
			title : 'Accordion Item 4',
			html : '&lt;empty panel&gt;',
			cls : 'empty'
		});

		var item5 = new Ext.Panel( {
			title : 'Accordion Item 5',
			html : '&lt;empty panel&gt;',
			cls : 'empty'
		});

		var accordion = new Ext.Panel( {
			region : 'west',
			margins : '5 0 5 5',
			split : true,
			width : 210,
			layout : 'accordion',
			items : [ item1, item2, item3, item4, item5 ]
		});

		var tabPanel = new Ext.TabPanel( {
			region : 'center',
			enableTabScroll : true,
			deferredRender : false,
			activeTab : 0,
			items : [ {

				title : 'index',

				//html : 'aaaaaa'
				autoLoad : 'User_add.jsp'
			} ]
		});

		var viewport = new Ext.Viewport( {
			layout : 'border',
			items : [ accordion, tabPanel ]
		});

	});
</script> -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
body,td,th {
	font-family: 宋体;
	font-size: 12px;
}
a:link {
	color: #000099;
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color: #000099;
}
a:hover {
	text-decoration: underline;
	color: #993300;
}
a:active {
	text-decoration: none;
	color: #993300;
}
-->
</style><body>
<table style="margin-left:0px; margin-top:0px; border-right:2px solid #799ae1;border-left:2px solid #799ae1;" width="100%" border="0" cellspacing="0" cellpadding="0" height="490">
  <tr>
    <td width="100%" height="100%" align="left" valign="top" bgcolor="#799ae1" >&nbsp;</td>
  </tr>
  <tr>
    <th height="24" align="left" valign="middle" scope="row"  >&nbsp;&nbsp;&nbsp; <img src="<%=basePath%>image/cbfxt_10.gif" height="20" align="absbottom" /> 系统管理</th>
  </tr>
  <tr>
    <td scope="row" align="left" valign="middle" height="25" >&nbsp;&nbsp;&nbsp;&nbsp;<img src="<%=basePath%>image/tree_closefolder.gif" height="20" align="absbottom"/> <a href="<%=basePath%>user/User_list" target="main"><strong>用户管理</strong></a></td>
  </tr>
  <tr>
    <td scope="row" align="left" valign="middle" height="25" >&nbsp;&nbsp;&nbsp;&nbsp;<img src="<%=basePath%>image/tree_closefolder.gif" height="20" align="absbottom"/> <a href="listsitetype.shtml" target="main"><strong>类别管理</strong></a></td>
  </tr>
  <tr>
    <td scope="row" align="left" valign="middle" height="25" >&nbsp;&nbsp;&nbsp;&nbsp;<img src="<%=basePath%>image/tree_closefolder.gif" height="20" align="absbottom"/><a href="manage/info/new.jsp" target="main"><strong> 信息管理</strong></a></td>
  </tr>

  <tr>
    <td scope="row" align="left" valign="middle" height="20" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="manage/image/cbfxt_ico_new.gif" height="20" align="absbottom"/> <a href="listsiteinfo.shtml?type=1000" target="main">职场生涯</a></td>
  </tr>
  <tr>
    <td scope="row" align="left" valign="middle" height="20" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="manage/image/cbfxt_ico_new.gif" height="20" align="absbottom"/> <a href="listsiteinfo.shtml?type=1001" target="main">IT技术</a></td>
  </tr>
   <tr>
    <td scope="row" align="left" valign="middle" height="20" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="manage/image/cbfxt_ico_new.gif" height="20" align="absbottom"/> <a href="listsiteinfo.shtml?type=1002" target="main">公文百科</a></td>
  </tr>
     <tr>
    <td scope="row" align="left" valign="middle" height="20" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="manage/image/cbfxt_ico_new.gif" height="20" align="absbottom"/> <a href="listsiteinfo.shtml?type=1003" target="main">励志人生</a></td>
  </tr>
       <tr>
    <td scope="row" align="left" valign="middle" height="20" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="manage/image/cbfxt_ico_new.gif" height="20" align="absbottom"/> <a href="listsiteinfo.shtml?type=1004" target="main">医药医学</a></td>
  </tr>
  <tr>
    <td scope="row" align="left" valign="middle" height="20" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="manage/image/cbfxt_ico_new.gif" height="20" align="absbottom"/> <a href="listsiteinfo.shtml?type=1005" target="main">学生专栏</a></td>
  </tr>
  <tr>
    <td scope="row" align="left" valign="middle" height="20" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="manage/image/cbfxt_ico_new.gif" height="20" align="absbottom"/> <a href="listsiteinfo.shtml?type=1006" target="main">网页技术</a></td>
  </tr>
  <tr>
    <td scope="row" align="left" valign="middle" height="20" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="manage/image/cbfxt_ico_new.gif" height="20" align="absbottom"/> <a href="listsiteinfo.shtml?type=1007" target="main">图形创意</a></td>
  </tr>
  <tr>
    <td scope="row" align="left" valign="middle" height="20" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="manage/image/cbfxt_ico_new.gif" height="20" align="absbottom"/> <a href="listsiteinfo.shtml?type=1008" target="main">文档教程</a></td>
  </tr>
  <tr>
    <td scope="row" align="left" valign="middle" height="20" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="manage/image/cbfxt_ico_new.gif" height="20" align="absbottom"/> <a href="listsiteinfo.shtml?type=1009" target="main">javascript</a></td>
  </tr>
    <tr>
    <td scope="row" align="left" valign="middle" height="20" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="manage/image/cbfxt_ico_new.gif" height="20" align="absbottom"/> <a href="listsiteinfo.shtml?type=1010" target="main">休闲娱乐</a></td>
  </tr>
    <tr>
    <td scope="row" align="left" valign="middle" height="20" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="manage/image/cbfxt_ico_new.gif" height="20" align="absbottom"/> <a href="listsiteinfo.shtml?type=1011" target="main">电子书下载</a></td>
  </tr>
  <tr>
    <td scope="row" align="left" valign="middle" height="25" >&nbsp;&nbsp;&nbsp;&nbsp;<img src="manage/image/tree_closefolder.gif" height="22" align="absbottom" /> <a href="manage/info/buildhtml.jsp" target="main"><strong>生成HTML</strong></a></td>
  </tr>
  <tr>
    <td scope="row" align="left" valign="middle" height="25" >&nbsp;&nbsp;&nbsp;&nbsp;<img src="manage/image/tree_closefolder.gif" height="22" align="absbottom" /> <a href="manage/advertise/new.jsp" target="main"><strong>广告管理</strong></a></td>
  </tr>

  <tr>
    <td scope="row" align="left" valign="middle" height="20" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="manage/image/cbfxt_ico_new.gif" height="20" align="absbottom"/> <a href="listadvertise.shtml?type=1" target="main">文字广告</a></td>
  </tr>
  <tr>
    <td scope="row" align="left" valign="middle" height="20" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="manage/image/cbfxt_ico_new.gif" height="20" align="absbottom"/> <a href="listadvertise.shtml?type=2" target="main">图片广告</a></td>
  </tr>
  <tr>
    <td scope="row" align="left" valign="middle" height="20" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="manage/image/cbfxt_ico_new.gif" height="20" align="absbottom"/> <a href="listadvertise.shtml?type=3" target="main">文字链接</a></td>
  </tr>
  <tr>
    <td scope="row" align="left" valign="middle" height="20" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="manage/image/cbfxt_ico_new.gif" height="20" align="absbottom"/> <a href="listadvertise.shtml?type=4" target="main">图片链接</a></td>
  </tr>
  <tr>
    <td scope="row" align="left" valign="middle" height="20" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="manage/image/cbfxt_ico_new.gif" height="20" align="absbottom"/> <a href="listadvertise.shtml?type=5" target="main">首页切换图片</a></td>
  </tr>
  <tr>
    <td scope="row" align="left" valign="middle" height="25" >&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<img src="manage/image/tree_zandian.gif" height="20" align="absbottom" /> <a href="exituser.shtml" target="_blank"><strong>退出登陆</strong></a></td>
  </tr>
</table>
</body>
