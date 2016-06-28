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
<title>Banner管理</title>
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
	href="http://localhost:8080/pycms/files/css/lightbox.css">
<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/pycms/files/css/common.css">
<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/pycms/files/css/notice-banner.css">
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
						<li "><a href="#"><i
								class="fa fa-bullhorn fa-fw"></i> 动态管理<span class="fa arrow"></span>
						</a>
							<ul class="nav nav-second-level hide">
								<li><a class="active"
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
						<li class="active"><a href="#"><i class="fa fa-image fa-fw"></i>
								Banner管理<span class="fa arrow"></span>
						</a>
							<ul class="nav nav-second-level hide">
								<li><a
									href="http://localhost:8080/pycms/files/banner.jsp">Banner列表</a>
								</li>
								<li><a
									href="http://localhost:8080/pycms/files/banner_cj.jsp">创建Banner</a>
								</li>
							</ul></li>
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
							</ul></li>
						<li><a
							href="http://localhost:8080/pycms/files/toggle.jsp"><i
								class="fa fa-toggle-on fa-fw"></i> 功能开关</a></li>

						<li><a href="#"><i class="fa fa-line-chart fa-fw"></i>
								统计分析<span class="fa arrow"></span>
						</a>
							<ul class="nav nav-second-level hide">
								<li><a
									href="http://localhost:8080/pycms/files/school_basic.jsp">学校统计</a>
								</li>
								<li><a
									href="http://localhost:8080/pycms/files/teacher_basic.jsp">教师统计</a>
								</li>
							</ul></li>
						<li><a href="#"><i class="fa fa-database fa-fw"></i>
								数据管理<span class="fa arrow"></span>
						</a>
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
							</ul></li>
					</ul>
				</div>
				<!-- /.sidebar-collapse -->
			</div>
			<!-- /.navbar-static-side -->
		</nav>
		<div id="page-wrapper" data-role="school_admin">
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							Banner管理
							<button id="btn-banner-release" class="btn btn-primary">保存排序</button>
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="row">
								<div class="col-lg-12">
									<div class="input-group">
										<select id="target-tab" class="form-control">
											<option data-id="2004" value="学校新闻">学校新闻</option>
											<option data-id="2005" value="学知堂">学知堂</option>
											<option data-id="2287" value="新闻资讯">新闻资讯</option>
										</select>
									</div>
								</div>
								<div class="col-lg-12">
									<table id="banner-table"
										class="table table-bordered table-hover table-striped">
										<thead>
											<tr>
												<th>顺序</th>
												<th>名称</th>
												<th>图片预览</th>
												<th>所属Tab</th>
												<th>上线时间</th>
												<th>结束时间</th>
												<th>创建者</th>
												<th>创建时间</th>
												<th>管理</th>
											</tr>
										</thead>
										<tbody>
											<tr class="items" data-id="568" data-type="1"
												data-feed-id="6673">
												<td class="order">0</td>
												<td class="title">1234567zaq</td>
												<td><a
													href="http://static.file.peiyu100.com/20141001/2015/11/19/18/48/fe76f660-1e54-476a-890c-ec9cb187c7ef.png"
													data-lightbox="banner-preview-568"><img
														src="http://static.file.peiyu100.com/20141001/2015/11/19/18/48/fe76f660-1e54-476a-890c-ec9cb187c7ef.png"
														height="40" alt>
												</a>
												</td>
												<td>学校新闻</td>
												<td>2015-11-19 02:00:00</td>
												<td>2015-11-30 18:00:00</td>
												<td>测试</td>
												<td>2015-11-19 18:47:45</td>
												<td class="table-edit"><a class="btn-off"><span
														title="下线" class="fa fa-arrow-down"></span>
												</a> <a class="btn-del"><span title="删除"
														class="fa fa-remove"></span>
												</a> <a class="link-compile">编辑</a></td>
											</tr>
											<tr class="items" data-id="545" data-type="1"
												data-feed-id="6393">
												<td class="order">0</td>
												<td class="title">健健康康卡</td>
												<td><a
													href="http://static.file.peiyu100.com/20141001/2015/11/9/10/54/f418451f-b540-456b-8549-da15fd03eae9.jpg"
													data-lightbox="banner-preview-545"><img
														src="http://static.file.peiyu100.com/20141001/2015/11/9/10/54/f418451f-b540-456b-8549-da15fd03eae9.jpg"
														height="40" alt>
												</a>
												</td>
												<td>新闻资讯</td>
												<td>2015-11-09 10:54:48</td>
												<td>2015-11-26 10:00:00</td>
												<td>测试</td>
												<td>2015-11-09 10:54:46</td>
												<td class="table-edit"><a class="btn-off"><span
														title="下线" class="fa fa-arrow-down"></span>
												</a> <a class="btn-del"><span title="删除"
														class="fa fa-remove"></span>
												</a> <a class="link-compile">编辑</a></td>
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
		src="http://localhost:8080/pycms/files/js/bootstrap-confirmation.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/metisMenu.min.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/jquery.dataTables.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/dataTables.bootstrap.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/lightbox.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/common.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/notice-banner.js"></script>
</body>
</html>