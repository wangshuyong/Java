<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="zh-CN"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="zh-CN"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="zh-CN"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="zh-CN">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta name="force-rendering" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge;chrome=1">
<title>教师统计</title>
<link rel="dns-prefetch" href="//static.peiyu100.com">
<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/pycms/files/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/pycms/files/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/pycms/files/css/metisMenu.min.css">
<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/pycms/files/css/sb-admin-2.css">
<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/pycms/files/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/pycms/files/css/dataTables.bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/pycms/files/css/bootstrap-datetimepicker.css">
<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/pycms/files/css/common.css">
<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/pycms/files/css/statistical-basic.css">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>

<script type="text/javascript" src="http://localhost:8080/pycms/files/js/html5shiv.js"></script><script type="text/javascript" src="http://localhost:8080/pycms/files/js/respond.min.js"></script><link href="http://localhost:8080/pycms/files/html/respond-proxy.html" id="respond-proxy" rel="respond-proxy">
<link href="http://cms.peiyu100.com/static/img/respond.proxy.gif" id="respond-redirect" rel="respond-redirect">
<script src="http://cms.peiyu100.com/static/js/respond.proxy.js"></script>
<![endif]-->
</head>
<body>
	<div id="wrapper" data-static="http://localhost:8080/pycms/files/"
		data-host="http://cms.peiyu100.com" data-role="school_admin">
		<!-- Navigation -->
		<nav class="navbar navbar-cms navbar-static-top" role="navigation">
			<div class="navbar-header">
				<a class="navbar-brand"
					href="http://localhost:8080/pycms/files/all.jsp">陪育CMS（产品测试学校）</a>
			</div>
			<div class="nav navbar-top-links navbar-right"
				style="margin-right:0;">
				<li><span>欢迎您！测试</span></li>
				<li><a href="http://localhost:8080/pycms/signout.do"><i
						class="fa fa-power-off"></i>退出</a></li>
			</div>

			<!-- /.navbar-top-links -->
			<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav" id="side-menu">
						<li ><a href="#"><i
								class="fa fa-bullhorn fa-fw"></i> 动态管理<span class="fa arrow"></span>
						</a>
							<ul class="nav nav-second-level hide">
								<li><a class="active"
									href="http://localhost:8080/pycms/files/all.jsp">全校动态监控</a>
								</li>
							</ul>
						</li>
						<li><a href="#"><i class="fa fa-newspaper-o fa-fw"></i>
								学校动态管理<span class="fa arrow"></span> </a>
							<ul class="nav nav-second-level hide">
								<li><a
									href="http://localhost:8080/pycms/files/school.jsp">学校动态列表</a>
								</li>
								<li><a
									href="http://localhost:8080/pycms/files/school_fs.jsp">发送学校动态</a>
								</li>
							</ul>
						</li>
						<li><a href="#"><i class="fa fa-image fa-fw"></i>
								Banner管理<span class="fa arrow"></span> </a>
							<ul class="nav nav-second-level hide">
								<li><a
									href="http://localhost:8080/pycms/files/banner.jsp">Banner列表</a>
								</li>
								<li><a
									href="http://localhost:8080/pycms/files/banner_cj.jsp">创建Banner</a>
								</li>
							</ul>
						</li>
						<li><a href="#"><i class="fa fa-columns fa-fw"></i> Tab管理<span
								class="fa arrow"></span> </a>
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
								class="fa fa-toggle-on fa-fw"></i> 功能开关</a>
						</li>

						<li class="active"><a href="#"><i class="fa fa-line-chart fa-fw"></i>
								统计分析<span class="fa arrow"></span> </a>
							<ul class="nav nav-second-level hide">
								<li><a
									href="http://localhost:8080/pycms/files/school_basic.jsp">学校统计</a>
								</li>
								<li><a
									href="http://localhost:8080/pycms/files/teacher_basic.jsp">教师统计</a>
								</li>
							</ul>
						</li>
						<li><a href="#"><i class="fa fa-database fa-fw"></i> 数据管理<span
								class="fa arrow"></span> </a>
							<ul class="nav nav-second-level hide">
								<li><a
									href="http://localhost:8080/pycms/files/department.jsp">部门管理</a>
								</li>
								<li><a
									href="http://localhost:8080/pycms/files/classes.jsp">班级列表</a>
								</li>
								<li><a
									href="http://localhost:8080/pycms/files/teachers.jsp">教师列表</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
				<!-- /.sidebar-collapse -->
			</div>
			<!-- /.navbar-static-side -->
		</nav>
		<div id="page-wrapper" data-school-id="110002">
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">教师统计-产品测试学校</div>
						<div style='display:none' id="school_id">110002</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="row">
								<div class="form-list">
									<div class="input-group">
										<span class="input-group-addon">教师名称</span> <input
											class="form-control" type="text" id="teacher-name"
											name='teacher_name'>
									</div>
									<span
										style='float:  left;line-height: 32px;padding-right: 10px;'>时间:</span>
									<div class="input-group">
										<span class="input-group-addon"><i
											class="glyphicon glyphicon-calendar"></i> </span> <input type="text"
											name="start_date" id="start_date" value=""
											class="form-control">
									</div>
									<span
										style='float: left;line-height: 32px;padding-right: 10px;'>&nbsp;至</span>
									<div class="input-group">
										<span class="input-group-addon"><i
											class="glyphicon glyphicon-calendar"></i> </span> <input type="text"
											value="" name="end_date" id="end_date" class="form-control">
									</div>
									<button class="btn btn-default" id="query_basic">查询</button>
									</span>
								</div>
								<div class="col-lg-12">
									<table id="statistical-teacher-table"
										class="table table-bordered table-hover table-striped tr-pointer">
										<thead>
											<tr>
												<th class="hidden">学校名称</th>
												<th class="hidden">日期</th>
												<th>老师姓名</th>
												<th>职务</th>
												<th>是否有效</th>
												<th>覆盖学生数</th>
												<th>覆盖家长数</th>
												<th>通知数量</th>
												<th>作业数量</th>
												<th>附件消息数量</th>
												<th>评论数量</th>
												<th>回复数量</th>
												<th>获取赞数量</th>
												<th class="hidden">师家消息（人数）</th>
												<th>师家消息（条数）</th>
												<th>家师消息（人数）</th>
												<th>家师消息（条数）</th>
											</tr>
										</thead>
										<tbody id='notice-table_tbody'></tbody>
									</table>
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
		src="http://localhost:8080/pycms/files/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/jquery.dataTables.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/dataTables.bootstrap.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/bootstrap-datetimepicker.zh-CN.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/metisMenu.min.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/common.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/statistical-basic.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/statistical-school.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/statistical-index.js"></script>
</body>
</html>