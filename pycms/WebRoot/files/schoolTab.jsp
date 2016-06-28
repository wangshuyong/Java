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
<title>学校动态Tab管理</title>
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
	href="http://localhost:8080/pycms/files/css/common.css">
<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/pycms/files/css/tab.css">
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
						<li class="active"><a href="#"><i class="fa fa-columns fa-fw"></i> Tab管理<span
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

						<li><a href="#"><i class="fa fa-line-chart fa-fw"></i>
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
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							学校动态Tab管理
							<button id="btn-tab-release" data-loading-text="发布中…"
								class="btn btn-primary">发布</button>
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="row">
								<div class="col-lg-12">
									<button class="btn btn-success" id="btn-tab-add">新建Tab</button>
								</div>
								<div class="col-lg-12">
									<table id="tab-table"
										class="table table-bordered table-hover table-striped">
										<thead>
											<tr>
												<th>顺序</th>
												<th>标签名称</th>
												<th>状态</th>
												<th>发布人</th>
												<th>发布时间</th>
												<th>管理</th>
											</tr>
										</thead>
										<tbody>
											<tr class="items" data-id="2004" data-type="1"
												data-status="0">
												<td class="order">1</td>
												<td class="title">学校新闻</td>
												<td class="status">上线</td>
												<td>测试</td>
												<td>2015-11-14 14:43:07</td>
												<td class="table-edit"><a class="btn-edit"><span
														title="编辑" class="fa fa-pencil"></span> </a>
												</td>
											</tr>
											<tr class="items" data-id="2000" data-type="4"
												data-status="0">
												<td class="order">2</td>
												<td class="title">教育热点</td>
												<td class="status">上线</td>
												<td></td>
												<td>2015-03-12 18:09:22</td>
												<td class="table-edit"></td>
											</tr>
											<tr class="items sortable" data-id="2005" data-type="3"
												data-status="0">
												<td class="order">3</td>
												<td class="title">学知堂</td>
												<td class="status">上线</td>
												<td>测试</td>
												<td>2015-11-14 14:43:07</td>
												<td class="table-edit"><a class="btn-edit"><span
														title="编辑" class="fa fa-pencil"></span> </a> <a
													class="btn-del"><span title="删除" class="fa fa-remove"></span>
												</a>
												</td>
											</tr>
											<tr class="items sortable" data-id="2287" data-type="3"
												data-status="0">
												<td class="order">4</td>
												<td class="title">新闻资讯</td>
												<td class="status">上线</td>
												<td>测试</td>
												<td>2015-11-14 14:43:07</td>
												<td class="table-edit"><a class="btn-edit"><span
														title="编辑" class="fa fa-pencil"></span> </a> <a
													class="btn-del"><span title="删除" class="fa fa-remove"></span>
												</a>
												</td>
											</tr>
											<tr class="items" id="last_td" data-id="2002" data-type="2"
												data-status="0">
												<td class="order">5</td>
												<td class="title">教育政策</td>
												<td class="status">上线</td>
												<td></td>
												<td>2014-10-28 00:16:00</td>
												<td class="table-edit"></td>
											</tr>
										</tbody>
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
			<div class="modal fade tab-edit-modal" role="dialog">
				<div class="modal-dialog modal-sm">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
							</button>
							<h4 class="modal-title">修改Tab</h4>
						</div>
						<div class="modal-body">
							<input class="form-control" maxlength="4" type="text"
								id="tab-title" placeholder="Tab名称"> <br> <select
								class="form-control" id="tab-status">
								<option value="2">下线</option>
								<option value="0">上线</option>
							</select>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">取消</button>
							<button id="btn-submit" type="button" class="btn btn-primary">确定</button>
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
		src="http://localhost:8080/pycms/files/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/jquery-ui.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/metisMenu.min.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/jquery.dataTables.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/dataTables.bootstrap.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/common.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/tab.js"></script>
</body>
</html>