<%@page import="javax.xml.crypto.Data"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta name="force-rendering" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge;chrome=1">
<title>全校动态监控</title>

<link rel="stylesheet" type="text/css" href="http://localhost:8080/pycms/files/css/reset.css">
<link rel="stylesheet" type="text/css" href="http://localhost:8080/pycms/files/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="http://localhost:8080/pycms/files/css/metisMenu.min.css">
<link rel="stylesheet" type="text/css" href="http://localhost:8080/pycms/files/css/sb-admin-2.css">
<link rel="stylesheet" type="text/css" href="http://localhost:8080/pycms/files/css/font-awesome.min.css">  
<link rel="stylesheet" type="text/css" href="http://localhost:8080/pycms/files/css/bootstrap-datetimepicker.css">
<link rel="stylesheet" type="text/css" href="http://localhost:8080/pycms/files/css/dataTables.bootstrap.css">
<link rel="stylesheet" type="text/css" href="http://localhost:8080/pycms/files/css/common.css">

<link rel="stylesheet" type="text/css" href="http://localhost:8080/pycms/files/css/lightbox.css">
<link rel="stylesheet" type="text/css" href="http://localhost:8080/pycms/files/css/notice-detail.css">
<link rel="stylesheet" type="text/css" href="http://localhost:8080/pycms/files/css/homework-create.css">

	


<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/jquery-1.9.0.js"></script>
	
</head>
<body >

	<div id="wrapper" data-static="http://localhost:8080/pycms/files/"
		data-host="http://localhost:8080/pycms" data-role="school_admin">
		<!-- Navigation -->
		<nav class="navbar navbar-cms navbar-static-top" role="navigation">
			<div class="navbar-header">
				<a class="navbar-brand"
					href="http://localhost:8080/pycms/files/all.jsp">陪育CMS（产品测试学校）</a>
			</div>
			<div class="nav navbar-top-links navbar-right"
				style="margin-right:0;">
				<li><span>欢迎您！测试</span>
				</li>
				<li><a href="http://localhost:8080/pycms/signout.do"><i
						class="fa fa-power-off"></i>退出</a>
				</li>
			</div>

			<!-- /.navbar-top-links -->
			<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav" id="side-menu">
						<li class="active"><a href="#"><i
								class="fa fa-bullhorn fa-fw"></i> 动态管理<span class="fa arrow"></span>
							</a>
							<ul class="nav nav-second-level hide">
								<li><a 
									href="http://localhost:8080/pycms/files/all.jsp">全校动态监控</a>
								</li>
							</ul></li>
						<li><a href="#"><i class="fa fa-newspaper-o fa-fw"></i>
								学校动态管理<span class="fa arrow"></span>
							</a>
							<ul class="nav nav-second-level hide">
								<li><a
									href="http://localhost:8080/pycms/files/school.jsp">学校动态列表</a>
								</li>
								<li><a
									href="http://localhost:8080/pycms/files/school_fs.jsp">发送学校动态</a>
								</li>
							</ul></li>
						<li><a href="#"><i class="fa fa-image fa-fw"></i>
								Banner管理<span class="fa arrow"></span>
							</a>
							<ul class="nav nav-second-level hide">
								<li><a
									href="http://localhost:8080/pycms/files/banner.jsp">Banner列表</a>
								</li>
								<li><a
									href="http://localhost:8080/pycms/files/banner_cj.jsp">创建Banner</a>
								</li>
							</ul>
						</li>
						<li><a href="#"><i class="fa fa-columns fa-fw"></i>
								Tab管理<span class="fa arrow"></span>
							</a>
							<ul class="nav nav-second-level hide">
								<li><a
									href="http://localhost:8080/pycms/files/mainTab.jsp">主Tab管理</a>
								</li>
								<li><a
									href="http://localhost:8080/pycms/files/schoolTab.jsp">学校动态Tab管理</a>
								</li>
							</ul>
						</li>
						<li><a
							href="http://localhost:8080/pycms/files/toggle.jsp"><i
								class="fa fa-toggle-on fa-fw"></i> 功能开关</a></li>

						<li><a href="#"><i class="fa fa-line-chart fa-fw"></i>统计分析<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level hide">
								<li><a href="http://localhost:8080/pycms/files/school_basic.jsp">学校统计</a></li>
								<li><a href="http://localhost:8080/pycms/files/teacher_basic.jsp">教师统计</a></li>
							</ul>
						</li>
						<li><a href="#"><i class="fa fa-database fa-fw"></i>数据管理<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level hide">
								<li><a href="http://localhost:8080/pycms/files/department.jsp">部门管理</a></li>
								<li><a href="http://localhost:8080/pycms/files/classes.jsp">班级列表</a></li>
								<li><a href="http://localhost:8080/pycms/files/teachers.jsp">教师列表</a></li>
							</ul>
						</li>

						<li>
                       		 <a class="active" href="http://localhost:8080/pycms/files/info.jsp">
                       		 <i class="fa fa-male fa-fw"></i> 个人资料</a>
                    	</li>
					</ul>
				</div>
				<!-- /.sidebar-collapse -->
			</div>
		 <!-- /.navbar-static-side -->
    </nav>
        <ul class="page-breadcrumb breadcrumb">
        <li>
            <i class="fa fa-home"></i>
            <a href="">Home</a>
            <i class="fa fa-angle-right"></i>
        </li>
                <li>
            <a href="/notice/school">
                学校动态列表            </a>
                    </li>
            </ul>
    <div id="page-wrapper" data-type="school" data-id="6855" data_charge='1' data-role='school_admin' data_admin='0' data_uid='517548873900' >
    <div class='hidden' id='res_url' disable_reply_feed_data='0' disable_reply_feed='0' res_def_img='http://static.peiyu100.com/pycms/img/default-avatar.jpg' res_url='notice%2Fdetail%2Fschool%2F1%2F6855'></div>
        <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div  class="panel-heading">
                                        <strong></strong>
                                    </div>
                <div class="details-body">
                    <!-- 这里引入的是通知头。 -->
                    <!-- main content START -->
<div class="post-row" data-id="6855" data-user-id="517548873900">
    <div class="dl-left">
        <p><img width="80" src="http://static.peiyu100.com/pycms/img/default-avatar.jpg"></p>
        <p class="user-name"></p>
            </div>
    <div class="dl-right">
    </div>
    
      <div class="modal fade survey-preview-modal" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
                    <h4 class="modal-title"></h4>
                </div>
                <div class="modal-body" style="max-height: 450px;">
                    <span id="survey_title"></span>
                    <dl id="select-area-view">
                     <div class="survey-select-view-charts" style="margin: 0px auto; max-width: 497px;  height: 289px;"></div>
                     <div>以下人员选择了该项</div>
                     <div id="user_list">
                     
                     </div>
                    
                    </dl>
                </div>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>
    
</div>

<!-- main content END -->                </div>
            </div>
            <!-- /.panel -->
            <div class="row">
                <div class="col-sm-6">
                    <div class="dataTables_info" id="notice-table_info" role="alert" aria-live="polite" aria-relevant="all">
                                            </div>
                </div>
                            </div>
                        <div class="panel panel-default reply">
                <strong>快速回复</strong><br>
                <textarea id="reply-textarea" class="form-control" maxlength="500"></textarea>
                <p class="subto">您还可以输入<span class="text-left-num">500</span>个字符
                    <button id="btn-reply" class="btn btn-primary">发表评论</button>
                </p>
            </div>
                    </div>
    </div>
    <!-- /.row -->
    <div class="modal fade" id="quote-reply-modal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
                    <h4 class="modal-title" id="quote-reply-target">回复&nbsp;<span></span>：</h4>
                </div>
                <div class="modal-body">
                    <textarea id="quote-reply-textarea" class="form-control" maxlength="500" rows="5"></textarea>
                </div>
                <div class="modal-footer">
                    <p class="text-left">您还可以输入<span class="text-left-num">500</span>个字符</p>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button id="btn-quote-reply" type="button" class="btn btn-primary">回复</button>
                </div>
            </div>
        </div>
    </div>
    </div>
<!-- /#page-wrapper -->
</div>
<div id="download-client-modal" class="modal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog">
        <button class="dialog-close" data-dismiss="modal"></button>
        <a class="btn-download-client" href="http://cms.peiyu100.com/download/client" target="_blank"></a>
    </div>
</div>
 <script type="text/javascript" src="http://localhost:8080/pycms/files/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/bootstrap-confirmation.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/metisMenu.min.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/jquery.dataTables.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/dataTables.bootstrap.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/bootstrap-datetimepicker.zh-CN.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/common.js"></script>
<script src="http://localhost:8080/pycms/files/js/jquery.page.js"></script>


 
 <script type="text/javascript" src="http://localhost:8080/pycms/files/js/highcharts.js"></script>
 <script type="text/javascript" src="http://localhost:8080/pycms/files/js/lightbox.js"></script>
 <script type="text/javascript" src="http://static.peiyu100.com/pycms/js/notice-detail.js"></script>
 <script type="text/javascript" src="http://static.peiyu100.com/pycms/js/notice-index.js"></script>
 <script type="text/javascript">
	var Request = new Object(); 
	request = GetRequest(); 
	var id = request["id"];
	var url = $('#wrapper').attr('data-host');
	 var urlFile = $('#wrapper').attr('data-static');
	    debugger;  
 function getLoad() { 
 	 $.post( 
			 "http://localhost:8080/pycms/all_getInfo",
			 {
			 infmid:id
			  },
			 function(data){
			  debugger;  
			
			  if(data.infm!=""){
			  $(".panel-heading").html("<strong>"+data.infm.title+"</strong>");
			  $(".user-name").html(data.infm.title);
			  
			  var htmlRight ="";
			  htmlRight+="<div><p>"+data.infm.content+"</p>";
			  if(data.infm.attach!=null){
			  	var strs= new Array(); //定义一数组 
				strs=data.infm.attach.split(";"); //字符分割 
			  	for (i=0;i<strs.length ;i++ ) 
				{ 
					htmlRight+="<p> <a href='"+urlFile+"/img/"+strs[i]+"' data-lightbox='content-preview'><img width='300' src='"+urlFile+"/img/"+strs[i]+"' alt></a></p>";
				} 
			   }
			   if(data.infm.status==1){
			  		 htmlRight+="<ul class='item-actions' <li class='quote-reply-main'><i class='fa fa-reply'></i> 回复</li></ul>";
			  		 $("#quote-reply-modal").hide();
			   }
			    htmlRight+="<span class='item-time'>发表于："+data.infm.createtime+"</span></div>";
			    //没有附件
			    //$(".dl-right").html("<div><p>"+data.infm.content+"</p><ul class='item-actions'><li class='quote-reply-main'>回复<i class='fa fa-reply'></i> </li></ul><span class='item-time'>发表于："+data.infm.createtime+"</span></div>");
				$(".dl-right").html(htmlRight);
			  }
			 });
}
			 
function GetRequest() { 
	var url = location.search; //获取url中"?"符后的字串 
	var theRequest = new Object(); 
	if (url.indexOf("?") != -1) { 
		var str = url.substr(1); 
		strs = str.split("&"); 
		for(var i = 0; i < strs.length; i ++) { 
		theRequest[strs[i].split("=")[0]]=unescape(strs[i].split("=")[1]); 
	} 
	} 
	return theRequest; 
} 
			 
			 
$(document).ready(function(){
 getLoad();
});
 </script>

</body>
</html>