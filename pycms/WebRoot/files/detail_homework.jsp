<%@page import="javax.xml.crypto.Data"%>
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
<title>全校动态监控</title>

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
	href="http://localhost:8080/pycms/files/css/common.css">
<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/pycms/files/css/lightbox.css">
<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/pycms/files/css/notice-detail.css">
<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/pycms/files/css/homework-create.css">



<script type="text/javascript"
	src="http://localhost:8080/pycms/files/js/jquery-1.9.0.js"></script>

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
								<li><a href="http://localhost:8080/pycms/files/all.jsp">全校动态监控</a>
								</li>
							</ul></li>
						<li><a href="#"><i class="fa fa-newspaper-o fa-fw"></i>
								学校动态管理<span class="fa arrow"></span> </a>
							<ul class="nav nav-second-level hide">
								<li><a href="http://localhost:8080/pycms/files/school.jsp">学校动态列表</a>
								</li>
								<li><a
									href="http://localhost:8080/pycms/files/school_fs.jsp">发送学校动态</a>
								</li>
							</ul></li>
						<li><a href="#"><i class="fa fa-image fa-fw"></i>
								Banner管理<span class="fa arrow"></span> </a>
							<ul class="nav nav-second-level hide">
								<li><a href="http://localhost:8080/pycms/files/banner.jsp">Banner列表</a>
								</li>
								<li><a
									href="http://localhost:8080/pycms/files/banner_cj.jsp">创建Banner</a>
								</li>
							</ul>
						</li>
						<li><a href="#"><i class="fa fa-columns fa-fw"></i> Tab管理<span
								class="fa arrow"></span> </a>
							<ul class="nav nav-second-level hide">
								<li><a href="http://localhost:8080/pycms/files/mainTab.jsp">主Tab管理</a>
								</li>
								<li><a
									href="http://localhost:8080/pycms/files/schoolTab.jsp">学校动态Tab管理</a>
								</li>
							</ul>
						</li>
					<li><a
							href="http://localhost:8080/pycms/files/toggle.jsp"><i
								class="fa fa-toggle-on fa-fw"></i> 功能开关</a></li>
						<li><a href="#"><i class="fa fa-line-chart fa-fw"></i>统计分析<span
								class="fa arrow"></span> </a>
							<ul class="nav nav-second-level hide">
								<li><a
									href="http://localhost:8080/pycms/files/school_basic.jsp">学校统计</a>
								</li>
								<li><a
									href="http://localhost:8080/pycms/files/teacher_basic.jsp">教师统计</a>
								</li>
							</ul>
						</li>
						<li><a href="#"><i class="fa fa-database fa-fw"></i>数据管理<span
								class="fa arrow"></span> </a>
							<ul class="nav nav-second-level hide">
								<li><a
									href="http://localhost:8080/pycms/files/department.jsp">部门管理</a>
								</li>
								<li><a href="http://localhost:8080/pycms/files/classes.jsp">班级列表</a>
								</li>
								<li><a
									href="http://localhost:8080/pycms/files/teachers.jsp">教师列表</a>
								</li>
							</ul>
						</li>

						<li><a class="active"
							href="http://localhost:8080/pycms/files/info.jsp"> <i
								class="fa fa-male fa-fw"></i> 个人资料</a>
						</li>
					</ul>
				</div>
				<!-- /.sidebar-collapse -->
			</div>
			<!-- /.navbar-static-side -->
		</nav>
		<ul class="page-breadcrumb breadcrumb">
			<li><i class="fa fa-home"></i> <a href="">Home</a> <i
				class="fa fa-angle-right"></i>
			</li>
			<li><a href="/notice"> 动态列表 </a>
			</li>
		</ul>
		<div id="page-wrapper" data-id="417280" data-type="class"
			data_admin='0' data-role='school_admin' data_uid='517548873900'>
			<div class='hidden' id='res_url' disable_reply_feed_data='1'
				disable_reply_feed='1'
				res_def_img='http://static.peiyu100.com/pycms/img/default-avatar.jpg'
				res_url='homework%2Fdetail%2F417280'></div>
			<div class="row">
				<div class="col-lg-12">


					<div class="panel panel-default">
						<div class="panel-heading">
							<strong>徐灿发布了自然科学作业</strong>
						</div>
						<div class="details-body">
							<!-- main content START -->
							<div data-user-id="117373684463" data-id="84790" class="post-row">
								<div class="dl-left">
									<p>
										<img width="80"
											src="http://static.peiyu100.com/pycms/img/default-avatar.jpg">
									</p>
									<p class="user-name">徐灿</p>
									<p>
										<i class="fa fa-envelope-o"></i><a
											href="http://cms.peiyu100.com/chat/detail/117373684463?href=homework%2Fdetail%2F417280">发私信</a>
									</p>
								</div>

								<div class="dl-right" style='padding: 15px 20px;'>
									<div
										style="line-height:28px;font-size:14px;color:#434343;border:1px solid #ccc;margin:0 0 24px -2px;padding:13px;">



										<div class="section">
											<div>
												<span class="sub-title">科目:</span>
												<div>自然科学</div>
											</div>
											<div>
												<span class="sub-title">班级:</span>
												<div>四年级1班</div>
											</div>
											<div>
												<span class="sub-title">发送对象:</span>
												<div>杨杰伦爸,郭一媛妈,张一飞爸,刘一备爸,诸一亮爸,张飞妈</div>
											</div>
											<div>
												<span class="sub-title">发布人:</span>
												<div>徐灿</div>
											</div>
											<hr class="cut-line">
											<div id="content">
												<span class="sub-title">作业内容:</span>
												<div>
													<p>Ghhhh</p>
												</div>
											</div>
											<hr class="cut-line">
											<div>
												<span class="sub-title">完成时间:</span>
												<div>2015年11月12日 12:00</div>
											</div>
											<div>
												<span class="sub-title">发送时间:</span>
												<div>2015年11月12日 10:29</div>
											</div>
											<hr class="cut-line">
										</div>
										<!-- /.panel-body -->

									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-sm-6">
							<div class="dataTables_info" id="notice-table_info" role="alert"
								aria-live="polite" aria-relevant="all"></div>
						</div>
					</div>
					<div class="panel panel-default reply" >
						<strong>快速回复</strong><br>
						<textarea id="reply-textarea" class="form-control" maxlength="500"></textarea>
						<p class="subto">
							您还可以输入<span class="text-left-num">500</span>个字符
							<button id="btn-reply" class="btn btn-primary">发表评论</button>
						</p>
					</div>
				</div>
			</div>
			<!-- /.row -->
			<div class="modal fade" id="quote-reply-modal" tabindex="-1"
				role="dialog" aria-hidden="true">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
							</button>
							<h4 class="modal-title" id="quote-reply-target">
								回复&nbsp;<span></span>：
							</h4>
						</div>
						<div class="modal-body">
							<textarea id="quote-reply-textarea" class="form-control"
								maxlength="500" rows="5"></textarea>
						</div>
						<div class="modal-footer">
							<p class="text-left">
								您还可以输入<span class="text-left-num">500</span>个字符
							</p>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">取消</button>
							<button id="btn-quote-reply" type="button"
								class="btn btn-primary">回复</button>
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
		src="http://localhost:8080/pycms/files/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/metisMenu.min.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/lightbox.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/common.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/homework-detail.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/bootstrap-confirmation.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/highcharts.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/metisMenu.min.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/jquery.dataTables.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/dataTables.bootstrap.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/common.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/notice-detail.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/notice-index.js"></script>
	<script type="text/javascript">
		var Request = new Object();
		request = GetRequest();
		var id = request["id"];
	
		debugger;
		function getLoad() {
			$
					.post(
							"http://localhost:8080/pycms/all_getInfo",
							{
								infmid : id
							},
							function(data) {
								debugger;
							
								if (data.infm != "") {
									$(".panel-heading").html(
											"<strong>" + data.infm.title
													+ "</strong>");
									$(".user-name").html(data.infm.title);
									//没有附件
									/* $(".dl-right".html("<div style='line-height:28px;font-size:14px;color:#434343;border:1px solid #ccc;margin:0 0 24px -2px;padding:13px;'><div class='section'><div><span class='sub-title'>科目:</span><div>自然科学</div></div><div><span class='sub-title'>班级:</span><div>四年级1班</div></div><div><span class='sub-title'>发送对象:</span><div>杨杰伦爸,郭一媛妈,张一飞爸,刘一备爸,诸一亮爸,张飞妈</div></div><div><span class='sub-title'>发布人:</span><div>徐灿</div></div><span class='sub-title'>作业内容:</span><div><p>Ghhhh</p></div></div><hr class='cut-line'><div><span class='sub-title'>完成时间:</span><div>2015年11月12日 12:00</div></div><div><span class='sub-title'>发送时间:</span><div>2015年11月12日 10:29</div></div><hr class='cut-line'></div>");
 */
									if (data.infm.status == 1) {
									
										$(".panel panel-default reply").h
									}
								}

							});
		}

		function GetRequest() {
			var url = location.search; //获取url中"?"符后的字串 
			var theRequest = new Object();
			if (url.indexOf("?") != -1) {
				var str = url.substr(1);
				strs = str.split("&");
				for ( var i = 0; i < strs.length; i++) {
					theRequest[strs[i].split("=")[0]] = unescape(strs[i]
							.split("=")[1]);
				}
			}
			return theRequest;
		}

		$(document).ready(function() {
			getLoad();
		});
	</script>

</body>
</html>