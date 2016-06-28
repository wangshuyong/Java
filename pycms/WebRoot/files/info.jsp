<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta name="force-rendering" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge;chrome=1">
<title>个人资料</title>
<link rel="dns-prefetch" href="//static.peiyu100.com">
<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/pycms/files/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/pycms/files/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/pycms/files/css/jquery.fileupload.css">
<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/pycms/files/css/jquery.Jcrop.css">
<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/pycms/files/css/sb-admin-2.css">
<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/pycms/files/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/pycms/files/css/bootstrap-datetimepicker.css">
<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/pycms/files/css/common.css">
<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/pycms/files/css/info.css">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->


<script type="text/javascript">
	
</script>
</head>
<body>

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
				<li><span>欢迎您！测试</span></li>
				<li><a href="http://localhost:8080/pycms/signout"><i
						class="fa fa-power-off"></i>退出</a></li>
			</div>

			<!-- /.navbar-top-links -->
			<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav" id="side-menu">
						<li class=""><a href="#"><i class="fa fa-bullhorn fa-fw"></i>
								动态管理<span class="fa arrow"></span> </a>
							<ul class="nav nav-second-level hide">
								<li><a class="active" href="javascript:;"
									onclick="query_basic()">全校动态监控</a></li>
							</ul>
						</li>
						<li><a href="#"><i class="fa fa-newspaper-o fa-fw"></i>
								学校动态管理<span class="fa arrow"></span> </a>
							<ul class="nav nav-second-level hide">
								<li><a href="http://localhost:8080/pycms/files/school.jsp">学校动态列表</a>
								</li>
								<li><a
									href="http://localhost:8080/pycms/files/school_fs.jsp">发送学校动态</a>
								</li>
							</ul>
						</li>
						<li><a href="#"><i class="fa fa-image fa-fw"></i>
								Banner管理<span class="fa arrow"></span> </a>
							<ul class="nav nav-second-level hide">
								<li><a href="http://localhost:8080/pycms/files/banner.jsp">Banner列表</a>
								</li>
								<li><a
									href="http://localhost:8080/pycms/files/banner_cj.jsp">创建Banner</a>
								</li>
							</ul></li>
						<li><a href="#"><i class="fa fa-columns fa-fw"></i> Tab管理<span
								class="fa arrow"></span> </a>
							<ul class="nav nav-second-level hide">
								<li><a href="http://localhost:8080/pycms/files/mainTab.jsp">主Tab管理</a>
								</li>
								<li><a
									href="http://localhost:8080/pycms/files/schoolTab.jsp">学校动态Tab管理</a>
								</li>
							</ul></li>
						<li><ahref="http://localhost:8080/pycms/files/toggle.jsp">
							<i class="fa fa-toggle-on fa-fw"></i> 功能开关</a>
						</li>

						<li><a href="#"><i class="fa fa-line-chart fa-fw"></i>统计分析<span
								class="fa arrow"></span>
						</a>
							<ul class="nav nav-second-level hide">
								<li><a
									href="http://localhost:8080/pycms/files/school_basic.jsp">学校统计</a>
								</li>
								<li><a
									href="http://localhost:8080/pycms/files/teacher_basic.jsp">教师统计</a>
								</li>
							</ul></li>
						<li><a href="#"><i class="fa fa-database fa-fw"></i>数据管理<span
								class="fa arrow"></span>
						</a>
							<ul class="nav nav-second-level hide">
								<li><a
									href="http://localhost:8080/pycms/files/department.jsp">部门管理</a>
								</li>
								<li><a href="http://localhost:8080/pycms/files/classes.jsp">班级列表</a>
								</li>
								<li><a
									href="http://localhost:8080/pycms/files/teachers.jsp">教师列表</a>
								</li>
							</ul></li>

						<li><a class="active"
							href="http://localhost:8080/pycms/files/info.jsp"> <i
								class="fa fa-male fa-fw"></i> 个人资料</a></li>
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
						<div class="panel-body">
							<div class="bdBox">
								<ul class="list">
									<li class="base on" style="border-left:none"><a href="#">基本信息</a>
									</li>
									<li class="avatar" data-download-client="1"><a
										href="#avatar">头像设置</a>
									</li>
									<li class="password"><a href="#password">密码修改</a>
									</li>
								</ul>
								<div class="infos" data-id="92740">
									<div class="base-form">
										<div class="form-group">
											<label>姓名</label> <input id="info-name" maxlength="10"
												class="form-control" type="text" value="测试">
										</div>
										<div class="form-group">
											<label>昵称</label> <input id="info-nickname" maxlength="20"
												class="form-control" type="text" value="测试">
										</div>
										<div class="form-group">
											<label class="control-label">手机号</label>
											<button id="btn-get-code" class="btn btn-default">获取短信验证码</button>
											<input id="info-mobile" type="mobile" class="form-control"
												placeholder="">
										</div>
										<div class="form-group">
											<label>短信校验码</label> <input id="info-mobile-code"
												maxlength="6" class="form-control" type="text">
										</div>
										<div class="form-group">
											<label>性别</label> <select class="form-control"
												id="info-gender">
												<option value="">请选择</option>
												<option value="1" selected="selected">男</option>
												<option value="2">女</option>
											</select>
										</div>
										<div class="form-group">
											<label>生日</label>
											<div class="input-group">
												<span class="input-group-addon"><i
													class="glyphicon glyphicon-calendar"></i>
												</span> <input id="info-birth" type="text" class="form-control"
													value="2000-01-01">
											</div>
										</div>
										<div class="form-group">
											<button class="btn btn-primary" data-loading-text="保存中…"
												id="btn-base-submit">提交修改</button>
										</div>
									</div>
									<div class="avatar-form">
										<div class="form-group">
											<label>自定义头像</label> <img id="avatar-image"
												src="http://localhost:8080/pycms/files/img/default-avatar.jpg"
												alt>
											<div id="preview-pane">
												<div class="preview-container">
													<img src class="jcrop-preview" alt="预览">
												</div>
											</div>
											<p class="avatar-tips">支持JPG、JPEG、PNG、GIF格式，文件小于500KB</p>

											<div id="btn-avatar-upload"
												class="btn btn-default fileinput-button">
												<span>选择文件</span> <input id="avatar-upload" type="file"
													name="file">
											</div>
											<br>
											<button class="btn btn-primary hide" data-loading-text="保存中…"
												id="btn-avatar-submit">提交修改</button>
										</div>
									</div>
									<div class="password-form">
										<div class="form-group">
											<label>旧密码</label> <input id="info-old-password"
												class="form-control" maxlength="16" type="password">
										</div>
										<div class="form-group">
											<label>新密码</label> <input id="info-new-password"
												class="form-control" maxlength="16" type="password">
										</div>
										<div class="form-group">
											<label>新密码确认</label> <input id="info-new-password-sure"
												class="form-control" maxlength="16" type="password">
										</div>
										<div class="form-group">
											<button class="btn btn-primary" data-loading-text="保存中…"
												id="btn-password-submit">提交修改</button>
										</div>
									</div>
								</div>
								<!-- infos 发布通知 end -->
							</div>
							<!-- /.bdbox -->
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
		src="http://localhost:8080/pycms/files/js/jquery.min.js?v=1448013132"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/bootstrap.min.js?v=1448013132"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/jquery.Jcrop.js?v=1448013132"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/jquery.ui.widget.js?v=1448013132"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/jquery.iframe-transport.js?v=1448013132"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/jquery.fileupload.js?v=1448013132"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/metisMenu.min.js?v=1448013132"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/bootstrap-datetimepicker.js?v=1448013132"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/bootstrap-datetimepicker.zh-CN.js?v=1448013132"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/common.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/info.js"></script>
</body>
</html>