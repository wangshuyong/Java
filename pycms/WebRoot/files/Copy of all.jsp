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
<link rel="stylesheet" type="text/css" href="http://localhost:8080/pycms/files/css/notice.css">

<style>
*{ margin:0; padding:0; list-style:none;}
a{ text-decoration:none;}
a:hover{ text-decoration:none;}
.tcdPageCode{padding: 15px 20px;text-align: left;color: #ccc;text-align:center;}
.tcdPageCode a{display: inline-block;color: #428bca;display: inline-block;height: 25px;	line-height: 25px;	padding: 0 10px;border: 1px solid #ddd;	margin: 0 2px;border-radius: 4px;vertical-align: middle;}
.tcdPageCode a:hover{text-decoration: none;border: 1px solid #428bca;}
.tcdPageCode span.current{display: inline-block;height: 25px;line-height: 25px;padding: 0 10px;margin: 0 2px;color: #fff;background-color: #428bca;	border: 1px solid #428bca;border-radius: 4px;vertical-align: middle;}
.tcdPageCode span.disabled{	display: inline-block;height: 25px;line-height: 25px;padding: 0 10px;margin: 0 2px;	color: #bfbfbf;background: #f2f2f2;border: 1px solid #bfbfbf;border-radius: 4px;vertical-align: middle;}
</style>

<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/jquery.min.js"></script>
	

	
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
									href="http://localhost:8080/pycms/all_allInfo.do">全校动态监控</a>
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
						<li>
							<ahref="http://localhost:8080/pycms/files/toggle.jsp"><i class="fa fa-toggle-on fa-fw"></i> 功能开关</a>
						</li>

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
		<div class='hidden' id='sessionUid'>517548873900</div>
		<div class='hidden' id='image_url'>http://localhost:8080/pycms/files/img/</div>
		<div class='hidden' id='is_all_all'>1</div>

		<!-- background:#F7F7F7;filter:alpha(opacity=50);-moz-opacity:0.50;opacity:0.50;透明背景颜色 -->
		<div style=' position:relative;' id="page-wrapper" data-type="class"
			data-is-all="1" data-role="school_admin" is-index=''>
			<div id='shop_loading'
				style='margin:0 auto;bottom: 0;display: none;left: 0;outline: 0 none;overflow: hidden;position: absolute;right: 0;top: 0;z-index: 1051;'>
				<div style='position:fixed;z-index:1111;left:0;right:0;'>
					<center style='padding-top:100px;'>
						<img src="http://localhost:8080/pycms/files/img/zhuan_ju.gif" />
					</center>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">全校动态监控</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="row">
								<div class="form-list">
								
							
								 
									<div class="input-group">
										<select class="form-control" id="notice-type" name="Information.type">
											<option value="">全部</option>
											<option value="通知">通知</option>
											<option value="作业">作业</option>
											<option value="投票">投票</option>
											<option value="问卷">问卷</option>
										</select>
									</div>
									<div class="input-group">
										<span class="input-group-addon">发送时间</span> <input type="text"
											class="form-control" id="start-date" name="Information.createtime" style='width:118px;'>
									</div>
									<div class="input-group">
										<span class="input-group-addon">结束时间</span> <input type="text"
											class="form-control" id="end-date" name="">
									</div>
									<div class="input-group">
										<!-- input class="form-control" type="text" id="notice-author"-->
										<select id="notice-author" name="Information.author" class="form-control">
											<option value="">选择发布人</option>
											<c:forEach items="${teacherList}" var="teacher" >
												<option value="${teacher.name}">${teacher.name}</option>
											</c:forEach>
										</select>
									</div>
									<div class="input-group">
										<span class="input-group-addon">标题</span> <input
											class="form-control" type="text" id="notice-title" name="Information.title">
									</div>
									<button id="query_basic"   onClick="findTData()";
										class="btn btn-default">查询</button>
								
								</div>
								<div class="col-lg-12">
									<table id="notice-table"
										class="table table-bordered table-hover table-striped">
										<thead>
											<tr>
												<th valign="middle">类型</th>
												<th>标题</th>
												<th>科目</th>
												<th>回复/参与数</th>
												<th style='width:100px;'>发起人</th>
												<th id='time_sort'>发送时间</th>
												<th>结束时间</th>
												<th>管理</th>
											</tr>
										</thead>
										
										

										<!-- 班级动态、全校动态监控 -->
										<tbody id='notice-table-tbody'>
										</tbody>
										<tr><td colspan="8"><div align="right">
										<button id="firstPage">首页</button> 
										<button id="previous">上一页</button> 
										<button id="next">下一页</button> 
										<button id="last">尾页</button> 
										</div></td></tr>
									</table>
									<div class="tcdPageCode"></div>
								</div>
							</div>
							<!-- /.row -->
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
			</div>
			<!-- /.row -->
			<div class="modal fade survey-release-modal" tabindex="-1"
				role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-sm">
					<div class="modal-content">
						<div class="modal-body">
							<h3 class="share-complete">共享成功！</h3>
							<h3 class="share-sure">请选择模板库分类</h3>
							<div id="share-survey-category-area" class="share-sure">
								<select class="form-control" id="share-survey-category">
									<option value="">一级分类</option>
									<option value="6">学生问卷</option>
									<option value="5">教师问卷</option>
									<option value="1">家长问卷</option>
								</select> <select class="form-control" id="share-survey-sub-category">
									<option value="">二级分类</option>
									<option value="14" class="hidden" data-category-id="1">教育教学</option>
									<option value="13" class="hidden" data-category-id="1">假期安全</option>
									<option value="12" class="hidden" data-category-id="1">暑期综合调查问卷</option>
									<option value="11" class="hidden" data-category-id="1">暑期计划</option>
									<option value="10" class="hidden" data-category-id="1">家庭教育</option>
									<option value="9" class="hidden" data-category-id="1">教育关注</option>
									<option value="8" class="hidden" data-category-id="1">对教师满意度调查</option>
									<option value="7" class="hidden" data-category-id="1">校园安全</option>
									<option value="4" class="hidden" data-category-id="6">学生学习</option>
									<option value="3" class="hidden" data-category-id="5">师生沟通</option>
									<option value="2" class="hidden" data-category-id="1">综合</option>
								</select>
							</div>
						</div>
						<div class="modal-footer share-sure">
							<button id="btn-share-survey-tpl-submit" type="button"
								class="btn btn-primary share-sure" data-loading-text="共享中…">共享</button>
							<button id="btn-share-survey-tpl-cancel" type="button"
								class="btn btn-cancel">不共享</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /#page-wrapper -->
	</div>
	<div id="download-client-modal" class="modal" tabindex="-1"
		role="dialog" aria-hidden="true" data-backdrop="static">
		<div class="modal-dialog">
			<button class="dialog-close" data-dismiss="modal"></button>
			<a class="btn-download-client"
				href="http://cms.peiyu100.com/download/client" target="_blank"></a>
		</div>
	</div>

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
 <script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/notice.js"></script>  
		
		<script type="text/javascript" src="/http://localhost:8080/pycms/filesjs/jquery.page.js"></script>
		
<script type="text/javascript">
	alert(1);
		window.onload = findTData();
	  function findTData(){ 
	  alert(2);
			 $.post(
			 "http://localhost:8080/pycms/all_allInfo.do",
			 {type:$("#notice-type").val(),
			 author:$("#notice-author").val(),
			 startDate:$("#start-date").val(),
			 endDate:$("#end-date").val(),
			 title:$("#notice-title").val()},
			 function(data){
			 alert(data);
				if(data.length===0){
					$("#notice-table-tbody").html("没有数据");
					return false;
				}
				var topTitle="置顶";
				var htmlbody;
				for(var i = 0; i<data.length;i++){
					
					htmlbody+="<tr><td>"+data[i].type+"</td><td>"+data[i].title+"</td><td>"+data[i].subject_id+"</td><td>"+data[i].count+"/"+data[i].participantCount+"</td><td style='width:100px;'>"+data[i].author+"</td><td>"+data[i].createtime+"</td><td>"+data[i].changetime+"</td><td><a >"+data[i].is_top+"</a><a >删除</a></td></tr>";
				}
				$("#notice-table-tbody").html(htmlbody);
			});	
	 }
	 
	  
</script> 

</body>
</html>