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
<title>教师列表</title>
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
	href="http://localhost:8080/pycms/files/css/school-teachers.css">
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
						<li ><a href="#"><i
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
						<li class="active"><a href="#"><i class="fa fa-database fa-fw"></i>
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
		<ul class="page-breadcrumb breadcrumb">
			<li><i class="fa fa-home"></i> <a
				href="http://cms.peiyu100.com/">Home</a> <i
				class="fa fa-angle-right"></i></li>
			<li><a href="/data/school"> 学校管理 </a></li>
		</ul>
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading" style='line-height:34px'>
							教师列表 <a href="http://cms.peiyu100.com/data/school/add/teacher"
								class="btn btn-success" style="float:right">添加老师</a>
							<div style="clear:both"></div>
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="row">
								<form class="form-list">
									<div class="input-group">
										<span class="input-group-addon">姓名</span> <input
											class="form-control" type="text" id="teacher-name">
									</div>
								</form>
								<div class="col-lg-12">
									<table id="teachers-table"
										class="table table-bordered table-hover table-striped">
										<thead>
											<tr>
												<th>姓名</th>
												<th>登录名</th>
												<th>性别</th>
												<th>手机号</th>
												<th>是否信息主任</th>
												<th>职务</th>
												<th>其他职务</th>
												<th>任课信息</th>
												<th>设置年级主任</th>
												<th>管理</th>
											</tr>
										</thead>
										<tbody>
											<tr class="items" data-uid="117373684248">
												<td class="name">m</td>
												<td>maxiaohui110002</td>
												<td>女</td>
												<td></td>
												<td>是</td>
												<td>班主任</td>
												<td>物理教师</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/teacher_classes/117373684248">任课信息</a>
												</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/set_grade_admin/110002/117373684248">设置年级主任</a>
												</td>
												<td class="table-edit"><a class="btn-edit"
													href="http://cms.peiyu100.com/data/school/teacher_edit/117373684248"><span
														title="编辑" class="fa fa-pencil"></span>
												</a> <a class="btn-del"><span title="删除"
														class="fa fa-remove"></span>
												</a></td>
											</tr>
											<tr class="items" data-uid="117373684252">
												<td class="name">柴雯</td>
												<td>chaiwen110002</td>
												<td>女</td>
												<td></td>
												<td>否</td>
												<td>任课教师</td>
												<td>行为艺术教师</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/teacher_classes/117373684252">任课信息</a>
												</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/set_grade_admin/110002/117373684252">设置年级主任</a>
												</td>
												<td class="table-edit"><a class="btn-edit"
													href="http://cms.peiyu100.com/data/school/teacher_edit/117373684252"><span
														title="编辑" class="fa fa-pencil"></span>
												</a> <a class="btn-del"><span title="删除"
														class="fa fa-remove"></span>
												</a></td>
											</tr>
											<tr class="items" data-uid="117373684357">
												<td class="name">冯超</td>
												<td>fengchao110002</td>
												<td>男</td>
												<td></td>
												<td>否</td>
												<td>任课教师</td>
												<td>美术老师</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/teacher_classes/117373684357">任课信息</a>
												</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/set_grade_admin/110002/117373684357">设置年级主任</a>
												</td>
												<td class="table-edit"><a class="btn-edit"
													href="http://cms.peiyu100.com/data/school/teacher_edit/117373684357"><span
														title="编辑" class="fa fa-pencil"></span>
												</a> <a class="btn-del"><span title="删除"
														class="fa fa-remove"></span>
												</a></td>
											</tr>
											<tr class="items" data-uid="118565519558">
												<td class="name">胡一文</td>
												<td>huyiwen110002</td>
												<td>男</td>
												<td></td>
												<td>否</td>
												<td>教师</td>
												<td></td>
												<td><a
													href="http://cms.peiyu100.com/data/school/teacher_classes/118565519558">任课信息</a>
												</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/set_grade_admin/110002/118565519558">设置年级主任</a>
												</td>
												<td class="table-edit"><a class="btn-edit"
													href="http://cms.peiyu100.com/data/school/teacher_edit/118565519558"><span
														title="编辑" class="fa fa-pencil"></span>
												</a> <a class="btn-del"><span title="删除"
														class="fa fa-remove"></span>
												</a></td>
											</tr>
											<tr class="items" data-uid="117373684253">
												<td class="name">黄启华</td>
												<td>huangqihua110002</td>
												<td>男</td>
												<td></td>
												<td>否</td>
												<td>任课教师</td>
												<td>地理老师</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/teacher_classes/117373684253">任课信息</a>
												</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/set_grade_admin/110002/117373684253">设置年级主任</a>
												</td>
												<td class="table-edit"><a class="btn-edit"
													href="http://cms.peiyu100.com/data/school/teacher_edit/117373684253"><span
														title="编辑" class="fa fa-pencil"></span>
												</a> <a class="btn-del"><span title="删除"
														class="fa fa-remove"></span>
												</a></td>
											</tr>
											<tr class="items" data-uid="117373684360">
												<td class="name">霍永刚</td>
												<td>huoyonggang110002</td>
												<td>男</td>
												<td></td>
												<td>否</td>
												<td>任课教师</td>
												<td>劳技老师</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/teacher_classes/117373684360">任课信息</a>
												</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/set_grade_admin/110002/117373684360">设置年级主任</a>
												</td>
												<td class="table-edit"><a class="btn-edit"
													href="http://cms.peiyu100.com/data/school/teacher_edit/117373684360"><span
														title="编辑" class="fa fa-pencil"></span>
												</a> <a class="btn-del"><span title="删除"
														class="fa fa-remove"></span>
												</a></td>
											</tr>
											<tr class="items" data-uid="117373684355">
												<td class="name">李斌</td>
												<td>libin110002</td>
												<td>男</td>
												<td></td>
												<td>否</td>
												<td>任课教师</td>
												<td>生物老师</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/teacher_classes/117373684355">任课信息</a>
												</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/set_grade_admin/110002/117373684355">设置年级主任</a>
												</td>
												<td class="table-edit"><a class="btn-edit"
													href="http://cms.peiyu100.com/data/school/teacher_edit/117373684355"><span
														title="编辑" class="fa fa-pencil"></span>
												</a> <a class="btn-del"><span title="删除"
														class="fa fa-remove"></span>
												</a></td>
											</tr>
											<tr class="items" data-uid="117373684247">
												<td class="name">李亚滨</td>
												<td>liyabin110002</td>
												<td>男</td>
												<td></td>
												<td>是</td>
												<td>班主任</td>
												<td>政治老师</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/teacher_classes/117373684247">任课信息</a>
												</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/set_grade_admin/110002/117373684247">设置年级主任</a>
												</td>
												<td class="table-edit"><a class="btn-edit"
													href="http://cms.peiyu100.com/data/school/teacher_edit/117373684247"><span
														title="编辑" class="fa fa-pencil"></span>
												</a> <a class="btn-del"><span title="删除"
														class="fa fa-remove"></span>
												</a></td>
											</tr>
											<tr class="items" data-uid="118565511405">
												<td class="name">梁志侠</td>
												<td>liangzhixia110002</td>
												<td>男</td>
												<td></td>
												<td>否</td>
												<td>教师</td>
												<td></td>
												<td><a
													href="http://cms.peiyu100.com/data/school/teacher_classes/118565511405">任课信息</a>
												</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/set_grade_admin/110002/118565511405">设置年级主任</a>
												</td>
												<td class="table-edit"><a class="btn-edit"
													href="http://cms.peiyu100.com/data/school/teacher_edit/118565511405"><span
														title="编辑" class="fa fa-pencil"></span>
												</a> <a class="btn-del"><span title="删除"
														class="fa fa-remove"></span>
												</a></td>
											</tr>
											<tr class="items" data-uid="117373684467">
												<td class="name">刘毅</td>
												<td>liuyi110002</td>
												<td>男</td>
												<td></td>
												<td>否</td>
												<td>任课教师</td>
												<td>心理老师</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/teacher_classes/117373684467">任课信息</a>
												</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/set_grade_admin/110002/117373684467">设置年级主任</a>
												</td>
												<td class="table-edit"><a class="btn-edit"
													href="http://cms.peiyu100.com/data/school/teacher_edit/117373684467"><span
														title="编辑" class="fa fa-pencil"></span>
												</a> <a class="btn-del"><span title="删除"
														class="fa fa-remove"></span>
												</a></td>
											</tr>
											<tr class="items" data-uid="117373684466">
												<td class="name">马楠</td>
												<td>manan110002</td>
												<td>女</td>
												<td></td>
												<td>否</td>
												<td>任课教师</td>
												<td>心理老师</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/teacher_classes/117373684466">任课信息</a>
												</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/set_grade_admin/110002/117373684466">设置年级主任</a>
												</td>
												<td class="table-edit"><a class="btn-edit"
													href="http://cms.peiyu100.com/data/school/teacher_edit/117373684466"><span
														title="编辑" class="fa fa-pencil"></span>
												</a> <a class="btn-del"><span title="删除"
														class="fa fa-remove"></span>
												</a></td>
											</tr>
											<tr class="items" data-uid="119066052348">
												<td class="name">米奇</td>
												<td>miqimiqi110002</td>
												<td>男</td>
												<td>131****5900</td>
												<td>否</td>
												<td>高教</td>
												<td>教务主任</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/teacher_classes/119066052348">任课信息</a>
												</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/set_grade_admin/110002/119066052348">设置年级主任</a>
												</td>
												<td class="table-edit"><a class="btn-edit"
													href="http://cms.peiyu100.com/data/school/teacher_edit/119066052348"><span
														title="编辑" class="fa fa-pencil"></span>
												</a> <a class="btn-del"><span title="删除"
														class="fa fa-remove"></span>
												</a></td>
											</tr>
											<tr class="items" data-uid="117373684359">
												<td class="name">宿银伟</td>
												<td>suyinwei110002</td>
												<td>男</td>
												<td></td>
												<td>否</td>
												<td>任课教师</td>
												<td>自然科学老师</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/teacher_classes/117373684359">任课信息</a>
												</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/set_grade_admin/110002/117373684359">设置年级主任</a>
												</td>
												<td class="table-edit"><a class="btn-edit"
													href="http://cms.peiyu100.com/data/school/teacher_edit/117373684359"><span
														title="编辑" class="fa fa-pencil"></span>
												</a> <a class="btn-del"><span title="删除"
														class="fa fa-remove"></span>
												</a></td>
											</tr>
											<tr class="items" data-uid="117373684464">
												<td class="name">王海朋</td>
												<td>wanghaipeng110002</td>
												<td>男</td>
												<td></td>
												<td>否</td>
												<td>任课教师</td>
												<td>舞蹈老师</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/teacher_classes/117373684464">任课信息</a>
												</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/set_grade_admin/110002/117373684464">设置年级主任</a>
												</td>
												<td class="table-edit"><a class="btn-edit"
													href="http://cms.peiyu100.com/data/school/teacher_edit/117373684464"><span
														title="编辑" class="fa fa-pencil"></span>
												</a> <a class="btn-del"><span title="删除"
														class="fa fa-remove"></span>
												</a></td>
											</tr>
											<tr class="items" data-uid="117373684361">
												<td class="name">王瑞娜</td>
												<td>wangruina110002</td>
												<td>女</td>
												<td></td>
												<td>否</td>
												<td>任课教师</td>
												<td>计算机老师</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/teacher_classes/117373684361">任课信息</a>
												</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/set_grade_admin/110002/117373684361">设置年级主任</a>
												</td>
												<td class="table-edit"><a class="btn-edit"
													href="http://cms.peiyu100.com/data/school/teacher_edit/117373684361"><span
														title="编辑" class="fa fa-pencil"></span>
												</a> <a class="btn-del"><span title="删除"
														class="fa fa-remove"></span>
												</a></td>
											</tr>
											<tr class="items" data-uid="117373354200">
												<td class="name">王树勇</td>
												<td>wangshuyong110002</td>
												<td>男</td>
												<td>130****6772</td>
												<td>是</td>
												<td>数学教师</td>
												<td></td>
												<td><a
													href="http://cms.peiyu100.com/data/school/teacher_classes/117373354200">任课信息</a>
												</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/set_grade_admin/110002/117373354200">设置年级主任</a>
												</td>
												<td class="table-edit"><a class="btn-edit"
													href="http://cms.peiyu100.com/data/school/teacher_edit/117373354200"><span
														title="编辑" class="fa fa-pencil"></span>
												</a> <a class="btn-del"><span title="删除"
														class="fa fa-remove"></span>
												</a></td>
											</tr>
											<tr class="items" data-uid="117373684249">
												<td class="name">王艳芳</td>
												<td>wangyanfang110002</td>
												<td>男</td>
												<td></td>
												<td>否</td>
												<td>班主任</td>
												<td>英语老师</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/teacher_classes/117373684249">任课信息</a>
												</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/set_grade_admin/110002/117373684249">设置年级主任</a>
												</td>
												<td class="table-edit"><a class="btn-edit"
													href="http://cms.peiyu100.com/data/school/teacher_edit/117373684249"><span
														title="编辑" class="fa fa-pencil"></span>
												</a> <a class="btn-del"><span title="删除"
														class="fa fa-remove"></span>
												</a></td>
											</tr>
											<tr class="items" data-uid="117373684250">
												<td class="name">魏正傲</td>
												<td>weizhengao110002</td>
												<td>男</td>
												<td></td>
												<td>否</td>
												<td>任课教师</td>
												<td>体育教师</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/teacher_classes/117373684250">任课信息</a>
												</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/set_grade_admin/110002/117373684250">设置年级主任</a>
												</td>
												<td class="table-edit"><a class="btn-edit"
													href="http://cms.peiyu100.com/data/school/teacher_edit/117373684250"><span
														title="编辑" class="fa fa-pencil"></span>
												</a> <a class="btn-del"><span title="删除"
														class="fa fa-remove"></span>
												</a></td>
											</tr>
											<tr class="items" data-uid="117373684462">
												<td class="name">吴迪</td>
												<td>wudi110002</td>
												<td>女</td>
												<td></td>
												<td>否</td>
												<td>任课教师</td>
												<td>信息技术老师</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/teacher_classes/117373684462">任课信息</a>
												</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/set_grade_admin/110002/117373684462">设置年级主任</a>
												</td>
												<td class="table-edit"><a class="btn-edit"
													href="http://cms.peiyu100.com/data/school/teacher_edit/117373684462"><span
														title="编辑" class="fa fa-pencil"></span>
												</a> <a class="btn-del"><span title="删除"
														class="fa fa-remove"></span>
												</a></td>
											</tr>
											<tr class="items" data-uid="115869555804">
												<td class="name">吴老师</td>
												<td>wangnan110002</td>
												<td>男</td>
												<td></td>
												<td>是</td>
												<td>年级主任</td>
												<td>数学老师</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/teacher_classes/115869555804">任课信息</a>
												</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/set_grade_admin/110002/115869555804">设置年级主任</a>
												</td>
												<td class="table-edit"><a class="btn-edit"
													href="http://cms.peiyu100.com/data/school/teacher_edit/115869555804"><span
														title="编辑" class="fa fa-pencil"></span>
												</a> <a class="btn-del"><span title="删除"
														class="fa fa-remove"></span>
												</a></td>
											</tr>
											<tr class="items" data-uid="117373684145">
												<td class="name">吴秋颖</td>
												<td>wuqiuying110002</td>
												<td>女</td>
												<td></td>
												<td>是</td>
												<td>年级主任</td>
												<td>数学老师</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/teacher_classes/117373684145">任课信息</a>
												</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/set_grade_admin/110002/117373684145">设置年级主任</a>
												</td>
												<td class="table-edit"><a class="btn-edit"
													href="http://cms.peiyu100.com/data/school/teacher_edit/117373684145"><span
														title="编辑" class="fa fa-pencil"></span>
												</a> <a class="btn-del"><span title="删除"
														class="fa fa-remove"></span>
												</a></td>
											</tr>
											<tr class="items" data-uid="117373684251">
												<td class="name">吴全成</td>
												<td>wuquancheng110002</td>
												<td>男</td>
												<td></td>
												<td>否</td>
												<td>任课教师</td>
												<td>思想品德老师</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/teacher_classes/117373684251">任课信息</a>
												</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/set_grade_admin/110002/117373684251">设置年级主任</a>
												</td>
												<td class="table-edit"><a class="btn-edit"
													href="http://cms.peiyu100.com/data/school/teacher_edit/117373684251"><span
														title="编辑" class="fa fa-pencil"></span>
												</a> <a class="btn-del"><span title="删除"
														class="fa fa-remove"></span>
												</a></td>
											</tr>
											<tr class="items" data-uid="117373684463">
												<td class="name">徐灿</td>
												<td>xucan110002</td>
												<td>女</td>
												<td></td>
												<td>否</td>
												<td>任课教师</td>
												<td>形体老师</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/teacher_classes/117373684463">任课信息</a>
												</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/set_grade_admin/110002/117373684463">设置年级主任</a>
												</td>
												<td class="table-edit"><a class="btn-edit"
													href="http://cms.peiyu100.com/data/school/teacher_edit/117373684463"><span
														title="编辑" class="fa fa-pencil"></span>
												</a> <a class="btn-del"><span title="删除"
														class="fa fa-remove"></span>
												</a></td>
											</tr>
											<tr class="items" data-uid="117373684146">
												<td class="name">尹栋华</td>
												<td>yindonghua110002</td>
												<td>男</td>
												<td>185****2635</td>
												<td>是</td>
												<td>班主任</td>
												<td>语文教师</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/teacher_classes/117373684146">任课信息</a>
												</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/set_grade_admin/110002/117373684146">设置年级主任</a>
												</td>
												<td class="table-edit"><a class="btn-edit"
													href="http://cms.peiyu100.com/data/school/teacher_edit/117373684146"><span
														title="编辑" class="fa fa-pencil"></span>
												</a> <a class="btn-del"><span title="删除"
														class="fa fa-remove"></span>
												</a></td>
											</tr>
											<tr class="items" data-uid="117373684356">
												<td class="name">余波</td>
												<td>yubo110002</td>
												<td>男</td>
												<td></td>
												<td>否</td>
												<td>任课教师</td>
												<td>音乐教师</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/teacher_classes/117373684356">任课信息</a>
												</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/set_grade_admin/110002/117373684356">设置年级主任</a>
												</td>
												<td class="table-edit"><a class="btn-edit"
													href="http://cms.peiyu100.com/data/school/teacher_edit/117373684356"><span
														title="编辑" class="fa fa-pencil"></span>
												</a> <a class="btn-del"><span title="删除"
														class="fa fa-remove"></span>
												</a></td>
											</tr>
											<tr class="items" data-uid="117373684354">
												<td class="name">余云浩</td>
												<td>yuyunhao110002</td>
												<td>男</td>
												<td></td>
												<td>否</td>
												<td>任课教师</td>
												<td>历史教师</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/teacher_classes/117373684354">任课信息</a>
												</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/set_grade_admin/110002/117373684354">设置年级主任</a>
												</td>
												<td class="table-edit"><a class="btn-edit"
													href="http://cms.peiyu100.com/data/school/teacher_edit/117373684354"><span
														title="编辑" class="fa fa-pencil"></span>
												</a> <a class="btn-del"><span title="删除"
														class="fa fa-remove"></span>
												</a></td>
											</tr>
											<tr class="items" data-uid="117373684468">
												<td class="name">张博</td>
												<td>zhangbo110002</td>
												<td>男</td>
												<td></td>
												<td>否</td>
												<td>任课教师</td>
												<td>心理老师</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/teacher_classes/117373684468">任课信息</a>
												</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/set_grade_admin/110002/117373684468">设置年级主任</a>
												</td>
												<td class="table-edit"><a class="btn-edit"
													href="http://cms.peiyu100.com/data/school/teacher_edit/117373684468"><span
														title="编辑" class="fa fa-pencil"></span>
												</a> <a class="btn-del"><span title="删除"
														class="fa fa-remove"></span>
												</a></td>
											</tr>
											<tr class="items" data-uid="117373684465">
												<td class="name">张长明</td>
												<td>zhangchangming110002</td>
												<td>男</td>
												<td></td>
												<td>否</td>
												<td>任课教师</td>
												<td>心理老师</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/teacher_classes/117373684465">任课信息</a>
												</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/set_grade_admin/110002/117373684465">设置年级主任</a>
												</td>
												<td class="table-edit"><a class="btn-edit"
													href="http://cms.peiyu100.com/data/school/teacher_edit/117373684465"><span
														title="编辑" class="fa fa-pencil"></span>
												</a> <a class="btn-del"><span title="删除"
														class="fa fa-remove"></span>
												</a></td>
											</tr>
											<tr class="items" data-uid="117373684358">
												<td class="name">张亚光</td>
												<td>zhangyaguang110002</td>
												<td>男</td>
												<td></td>
												<td>否</td>
												<td>任课教师</td>
												<td>思维拓展老师</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/teacher_classes/117373684358">任课信息</a>
												</td>
												<td><a
													href="http://cms.peiyu100.com/data/school/set_grade_admin/110002/117373684358">设置年级主任</a>
												</td>
												<td class="table-edit"><a class="btn-edit"
													href="http://cms.peiyu100.com/data/school/teacher_edit/117373684358"><span
														title="编辑" class="fa fa-pencil"></span>
												</a> <a class="btn-del"><span title="删除"
														class="fa fa-remove"></span>
												</a></td>
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
			<div class="modal fade migrate-teacher-modal" role="dialog">
				<div class="modal-dialog modal-sm">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
							</button>
							<h4 class="modal-title">转移学校</h4>
						</div>
						<div class="modal-body">
							<select class="form-control" id="school_id">
								<option value="">请选择学校</option>
								<option value="110447">北京市通州区东方小学</option>
								<option value="110446">北京市劲松职业高中常营校区</option>
								<option value="110445">白家庄小学教学研讨会</option>
								<option value="110444">北京市大峪中学</option>
								<option value="110443">清华大学附属中学丰台学校</option>
								<option value="110442">清华大学附属中学奥森学校</option>
								<option value="110441">清华大学附属中学朝阳学校</option>
								<option value="110440">清华大学附属中学永丰校区</option>
								<option value="110439">清华大学附属中学上地学校</option>
								<option value="110438">清华大学附属中学本校</option>
								<option value="110437">北京师范大学附属中学京西分校</option>
								<option value="110436">北京市房山区良乡中学</option>
								<option value="110435">北京市朝阳区黑庄户中心小学</option>
								<option value="110434">北京市平谷区第五中学</option>
								<option value="110433">北京市平谷中学</option>
								<option value="110432">北京市昌平区大东流中心小学</option>
								<option value="110431">北京市朝阳区实验小学罗马嘉园分校</option>
								<option value="110430">北京市第五十七中学</option>
								<option value="110429">北京市朝阳区国美家园小学</option>
								<option value="110428">北京市第八中学怡海分校国际部</option>
								<option value="110427">北京市朝阳区团结湖小学</option>
								<option value="110426">北京市平谷区第八小学</option>
								<option value="110425">北京市平谷区大兴庄学区</option>
								<option value="110424">北京市房山区长沟镇北正完全小学</option>
								<option value="110423">北京市上庄第二中学</option>
								<option value="110422">工大实验学校</option>
								<option value="110421">香山小学</option>
								<option value="110420">西颐小学</option>
								<option value="110419">科大附中</option>
								<option value="110418">育鹰小学（东校区）</option>
								<option value="110417">育英学校（中学部）</option>
								<option value="110416">海淀第二实验小学（汇源）</option>
								<option value="110415">六郎庄小学（分部）</option>
								<option value="110414">中关村三小（万柳部）</option>
								<option value="110413">花园村二小</option>
								<option value="110412">回民小学</option>
								<option value="110411">教师进修学校（北校区）</option>
								<option value="110410">地大附中</option>
								<option value="110409">海淀区实验二小（清宁）</option>
								<option value="110408">六郎庄小学</option>
								<option value="110407">中关村三小（本部）</option>
								<option value="110406">人大附中第二分校</option>
								<option value="110405">第十九中学</option>
								<option value="110404">海淀区实验二小（当代）</option>
								<option value="110403">民族小学</option>
								<option value="110402">教师进修学校（南校区）</option>
								<option value="110401">育鹰小学（西校区）</option>
								<option value="110400">育英学校（小学部）</option>
								<option value="110399">海淀第二实验小学（橡树）</option>
								<option value="110398">陶行知中学（交大附中西校区）</option>
								<option value="110397">北大附中香山分校</option>
								<option value="110396">羊坊店中心小学</option>
								<option value="110395">昌平区马池口中心上念头小学</option>
								<option value="110394">昌平区马池口中心白浮小学</option>
								<option value="110393">昌平区南邵镇中心幼儿园</option>
								<option value="110392">北京王府幼儿园</option>
								<option value="110391">北京王府外国语学校</option>
								<option value="110390">北京市昌平实验小学</option>
								<option value="110389">北京市昌平区阳坊中学</option>
								<option value="110388">北京市昌平区燕丹学校</option>
								<option value="110387">北京市昌平区西贯市回民小学</option>
								<option value="110386">北京市昌平区天通苑新起点幼儿园</option>
								<option value="110385">北京市昌平区十三陵镇中心幼儿园</option>
								<option value="110384">北京市昌平区上苑中心小学</option>
								<option value="110383">北京市昌平区平西府中学</option>
								<option value="110382">北京市昌平区南口学校</option>
								<option value="110381">北京市昌平区南口铁道北小学</option>
								<option value="110380">北京市昌平区马池口中学</option>
								<option value="110379">北京市昌平区利民学校</option>
								<option value="110378">北京市昌平区霍营中心小学</option>
								<option value="110377">北京市昌平区华成幼儿园</option>
								<option value="110376">北京市昌平区工业幼儿园</option>
								<option value="110375">北京市昌平区二一学校</option>
								<option value="110374">北京市昌平区第五中学</option>
								<option value="110373">北京市昌平区第四中学</option>
								<option value="110372">北京市昌平区崔村中学</option>
								<option value="110371">北京市昌平区崔村中心小学</option>
								<option value="110370">北京市昌平区城北中心小学</option>
								<option value="110369">北京市昌平区昌盛园小学</option>
								<option value="110368">北京市昌平区北七家中学</option>
								<option value="110367">北京市昌平第二实验小学</option>
								<option value="110366">北京市蓓蕾幼儿园</option>
								<option value="110365">北京昌平雨竹学校</option>
								<option value="110364">北京昌平汇佳幼儿园</option>
								<option value="110363">北方交通大学附属中学第一分校</option>
								<option value="110362">北京市房山区燕山星城小学</option>
								<option value="110361">北京市房山区长沟镇长沟中心小学</option>
								<option value="110360">北京市房山区长沟镇龙泉河完全小学</option>
								<option value="110359">北京大学附属小学丰台分校</option>
								<option value="110358">北京市温泉第二中学</option>
								<option value="110357">北京市大兴区榆垡镇第二中心小学</option>
								<option value="110356">北京市朝阳区定福庄第一小学</option>
								<option value="110355">北京市昌平区教育委员会办公室</option>
								<option value="110354">北方工业大学附属中学</option>
								<option value="110353">北京市第一六六中学</option>
								<option value="110352">北京市团结湖第三中学</option>
								<option value="110351">北京市东城区新开路东总布小学</option>
								<option value="110350">北京市第五中学分校</option>
								<option value="110349">北京市燕山东风中学</option>
								<option value="110348">北京市虎城中学</option>
								<option value="110347">首都师范大学附属实验学校小学部</option>
								<option value="110346">北京市海淀区清华附中永丰学校</option>
								<option value="110345">北京市通州区永顺小学</option>
								<option value="110344">北京市东城区东四十四条小学</option>
								<option value="110343">北京市平谷区峪口中学</option>
								<option value="110342">北京市东城区史家小学分校</option>
								<option value="110341">北京市西城区厂桥小学</option>
								<option value="110340">北京市朝阳区将台洼小学</option>
								<option value="110339">北京市通州区民族小学</option>
								<option value="110338">昌平区马池口中心横桥小学</option>
								<option value="110337">昌平区马池口中心奤夿屯小学</option>
								<option value="110336">昌平区马池口中心百泉庄小学</option>
								<option value="110335">昌平区马池口中心楼自庄小学</option>
								<option value="110334">北京市怀柔区第一中学</option>
								<option value="110333">北京市朝阳区黑庄户教辅中心</option>
								<option value="110332">北京市燕山星城中学</option>
								<option value="110331">北京市石景山区实验幼儿园</option>
								<option value="110330">北京市石景山区实验小学</option>
								<option value="110329">北京市石景山中学</option>
								<option value="110328">北京市石景山区教委</option>
								<option value="110327">北方工业大学附属小学</option>
								<option value="110326">北京市大兴区庞各庄中学</option>
								<option value="110325">艺美小学</option>
								<option value="110324">北京市东城区师范学校附属小学</option>
								<option value="110323">北京市东城区和平里第二小学</option>
								<option value="110322">北京市海淀区七一小学</option>
								<option value="110321">首都师范大学大兴附属中学</option>
								<option value="110320">北京市大兴区兴海学校</option>
								<option value="110319">北京市通州区西集中学</option>
								<option value="110318">北京市昌平区天通苑学校</option>
								<option value="110317">北京市第一二五中学</option>
								<option value="110316">北京市第八十中学</option>
								<option value="110315">北京市通州区马驹桥镇中心小学</option>
								<option value="110314">北京市平谷区第四中学</option>
								<option value="110313">中国人民解放军空军后勤部蓝天幼儿园</option>
								<option value="110312">北京市昌平区阳坊中心后白虎涧小学</option>
								<option value="110311">北京市昌平阳坊中心四家庄小学</option>
								<option value="110310">北京市昌平区阳坊中心小学</option>
								<option value="110309">北京市昌平区巩华中心小学</option>
								<option value="110308">北京市大兴区魏善庄镇第一中心小学</option>
								<option value="110307">北京市第九十七中学</option>
								<option value="110306">北京市怀柔区红螺寺中学</option>
								<option value="110305">北京市第七十一中学</option>
								<option value="110304">北京市昌平区十三陵中心泰陵园小学</option>
								<option value="110303">北京市房山区周口店中学</option>
								<option value="110302">北京科技大学附属小学</option>
								<option value="110301">北京市长辛店第一中学</option>
								<option value="110300">北京小学万年花城分校</option>
								<option value="110299">北京市燕山前进中学</option>
								<option value="110298">大兴区魏善庄镇后大营完全小学</option>
								<option value="110297">北京市大兴区魏善庄镇王各庄完全小学</option>
								<option value="110296">北京市黑庄户中学</option>
								<option value="110295">大兴区魏善庄镇第一中心小学西芦垡完小</option>
								<option value="110294">北京市东城区文汇小学</option>
								<option value="110293">北京市房山区河北镇河北中心校</option>
								<option value="110292">北京市昌平区回龙观中学</option>
								<option value="110291">北京市大兴区亦庄中学</option>
								<option value="110290">北京市昌平区十三陵中心小学</option>
								<option value="110289">北京市海淀区白水洼小学</option>
								<option value="110288">北京市通州区永顺镇中心小学</option>
								<option value="110287">北京市昌平区城南中心邓庄小学</option>
								<option value="110286">北京市昌平区城南中心旧县小学</option>
								<option value="110285">北京市大兴区安定镇西芦各庄完全小学</option>
								<option value="110284">北京航空航天大学附属中学</option>
								<option value="110283">330校外管家</option>
								<option value="110282">中馆村2小</option>
								<option value="110281">中馆村1小</option>
								<option value="110280">香山山小学</option>
								<option value="110279">前门门小学</option>
								<option value="110278">首都师范大学附属中学大兴北校区</option>
								<option value="110277">北京市第一六五中学</option>
								<option value="110276">北京市第五十五中学</option>
								<option value="110275">北京市石景山外语实验小学分校</option>
								<option value="110274">北京市昌平区东小口中心小学</option>
								<option value="110273">北京市海淀区东升实验小学</option>
								<option value="110272">北京市东城区金台书院小学</option>
								<option value="110271">北京市房山区实验中学</option>
								<option value="110270">北京市朝阳区劲松第三小学</option>
								<option value="110269">北方交通大学附属中学第二分校</option>
								<option value="110268">北京市昌平区城北中心三街小学</option>
								<option value="110267">北京教育科学研究院丰台学校</option>
								<option value="110266">清华大学附属中学奥森校区</option>
								<option value="110265">北京医科大学附属小学</option>
								<option value="110264">北京市海淀区中关村第一小学</option>
								<option value="110263">北京市石景山区金顶街第四小学</option>
								<option value="110262">北京市朝阳区半壁店小学</option>
								<option value="110261">清华大学附属中学朝阳学校高中部</option>
								<option value="110260">清华大学附属中学朝阳学校初中部</option>
								<option value="110259">北京工业大学实验学校本部</option>
								<option value="110258">北京工业大学实验学校分部</option>
								<option value="110257">北京市石景山区台京学校</option>
								<option value="110256">北京市朝阳区芳草地国际学校教育辅助中心</option>
								<option value="110255">北京市东城区地坛小学</option>
								<option value="110254">北京市朝阳区劲松第一小学</option>
								<option value="110253">通州区西马庄小学</option>
								<option value="110252">通州区范庄小学</option>
								<option value="110251">北京市通州区中山街小学</option>
								<option value="110250">通州区焦王庄小学</option>
								<option value="110249">北京市朝阳区垂杨柳第四小学</option>
								<option value="110248">北京市和平北路学校</option>
								<option value="110247">清华大学附属中学朝阳学校小学部</option>
								<option value="110246">北京市文汇中学</option>
								<option value="110245">北京市海淀区实验小学丰台分校</option>
								<option value="110244">清华大学附属中学朝阳学校新源西里学区</option>
								<option value="110243">北京市第九中学分校</option>
								<option value="110242">清华大学附属中学朝阳学校新源里学区</option>
								<option value="110241">北京市石景山区水泥厂小学</option>
								<option value="110240">北京市石景山区金顶街第二小学</option>
								<option value="110239">北京市朝阳区定辛庄小学</option>
								<option value="110238">北京市大兴区第三小学</option>
								<option value="110237">北京市第二十四中学</option>
								<option value="110236">通州区乔庄小学</option>
								<option value="110235">北京景山学校</option>
								<option value="110234">北京市朝阳区松榆里小学</option>
								<option value="110233">通州区龙旺庄小学</option>
								<option value="110232">北京市朝阳区武圣庙小学</option>
								<option value="110231">通州区发电厂小学</option>
								<option value="110230">北京市第二十一中学</option>
								<option value="110229">北京市第一四二中学</option>
								<option value="110228">北京市房山区窦店中学</option>
								<option value="110227">北京市大兴区黄村镇第二中心小学</option>
								<option value="110226">北京市昌平区第三中学</option>
								<option value="110225">北京师范大学大兴附属小学</option>
								<option value="110224">北京市东城区安外三条小学</option>
								<option value="110223">北京市石景山区玉泉路小学</option>
								<option value="110222">北京市大兴区第七小学</option>
								<option value="110221">北京市大兴区黄村镇第三中心小学</option>
								<option value="110220">北京小学大兴分校</option>
								<option value="110219">全国青少年足球校长培训班</option>
								<option value="110218">北京市大兴区第六小学</option>
								<option value="110217">北京市东城区春江小学</option>
								<option value="110216">北京市昌平区马池口中心小学</option>
								<option value="110215">北京市昌平区天通苑小学</option>
								<option value="110214">首都师范大学附属中学</option>
								<option value="110213">北京市怀柔区第一小学</option>
								<option value="110212">首都师范大学附属中学大兴南校区</option>
								<option value="110211">北京市怀柔区怀柔镇中心小学</option>
								<option value="110210">北京市怀柔区第五中学</option>
								<option value="110209">密云县河南寨镇中心小学</option>
								<option value="110208">密云县果园小学</option>
								<option value="110207">北京市顺义区第五中学</option>
								<option value="110206">北京市顺义区高丽营学校</option>
								<option value="110205">北京市怀柔区第三中学</option>
								<option value="110204">北京市顺义区杨镇中心小学校</option>
								<option value="110203">北京市怀柔区杨宋镇中心小学</option>
								<option value="110202">密云县第四小学</option>
								<option value="110201">北京市怀柔区庙城学校</option>
								<option value="110200">密云县第五中学</option>
								<option value="110199">北京市顺义区高丽营第二小学</option>
								<option value="110198">密云县第六中学</option>
								<option value="110197">密云县第二小学</option>
								<option value="110196">北京市密云县第一小学</option>
								<option value="110195">密云县第六小学</option>
								<option value="110194">密云县第三小学</option>
								<option value="110193">北京师范大学密云实验中学</option>
								<option value="110192">北京市顺义区第三中学</option>
								<option value="110191">北京市怀柔区第二小学</option>
								<option value="110190">首都师范大学附属密云中学</option>
								<option value="110189">北京市密云县第二中学</option>
								<option value="110188">北京市顺义区杨镇第二中学</option>
								<option value="110187">昌平区城北中心东关小学</option>
								<option value="110186">北京市石景山外语实验小学</option>
								<option value="110185">北京市东城区校尉胡同小学</option>
								<option value="110184">北京市通州区梨园镇中心小学</option>
								<option value="110183">北京市第二十五中学</option>
								<option value="110182">北京市石景山区西黄村小学</option>
								<option value="110181">北京市石景山区五里坨小学</option>
								<option value="110180">北京市昌平区城北中心六街小学</option>
								<option value="110179">北京市大兴区安定镇东白塔完全小学</option>
								<option value="110178">北京市大兴区安定镇后安定完全小学</option>
								<option value="110177">北京市大兴区安定镇通马坊完全小学</option>
								<option value="110176">北京市顺义区北务中心幼儿园</option>
								<option value="110175">北京市昌平区城北中心西关小学</option>
								<option value="110174">北京市第九中学</option>
								<option value="110173">北京市朝阳区豆各庄中心小学</option>
								<option value="110172">北京市昌平区小汤山中心小学马坊学校</option>
								<option value="110171">北京市昌平区小汤山中心小学</option>
								<option value="110170">北京市第一一五中学</option>
								<option value="110169">北京市西城区西四北四条小学</option>
								<option value="110168">北京市昌平实验中学</option>
								<option value="110167">北京市东城区和平里第三小学</option>
								<option value="110166">北京市昌平区城南中心小学</option>
								<option value="110165">北京市东城区分司厅小学</option>
								<option value="110164">北京市东城区北锣鼓巷小学</option>
								<option value="110163">北京市大兴区第五小学</option>
								<option value="110162">北京汇文中学</option>
								<option value="110161">北京市昌平区南邵镇三合庄小学</option>
								<option value="110160">北京市昌平区南邵镇何营小学</option>
								<option value="110159">首都师范大学附属中学昌平学校</option>
								<option value="110158">北京市第二十二中学</option>
								<option value="110157">北京市昌平区第二中学</option>
								<option value="110156">北京市昌平区财贸幼儿园</option>
								<option value="110155">中国传媒大学附属中学</option>
								<option value="110154">北京市昌平区下庄学校</option>
								<option value="110153">北京市昌平区兴寿学校</option>
								<option value="110152">北京师范大学大兴附属中学</option>
								<option value="110151">北京市呼家楼中学</option>
								<option value="110150">北京市昌平区南邵中心小学</option>
								<option value="110149">北京市昌平区南口镇小学</option>
								<option value="110148">北京市昌平区前锋学校</option>
								<option value="110147">北京市大兴区第八中学</option>
								<option value="110146">北方交大附中</option>
								<option value="110145">中国石油大学附属中学</option>
								<option value="110144">北京市东城区织染局小学</option>
								<option value="110143">北京市朝阳区苇沟小学</option>
								<option value="110142">北京市光明小学</option>
								<option value="110141">北京市昌平区南邵中学</option>
								<option value="110140">北京市东城区新景小学</option>
								<option value="110139">北京陈经纶中学帝景分校</option>
								<option value="110138">北京陈经纶中学嘉铭分校</option>
								<option value="110137">北京陈经纶中学保利分校</option>
								<option value="110136">北京市大兴区安定镇中心小学</option>
								<option value="110135">北京林业大学附属小学</option>
								<option value="110134">北京市东城区回民实验小学</option>
								<option value="110133">北京现代职业学校</option>
								<option value="110132">北京市东城区革新里小学</option>
								<option value="110131">北京市东城区天坛南里小学</option>
								<option value="110130">北京第一师范学校附属小学</option>
								<option value="110129">北京市崇文小学</option>
								<option value="110128">北京市前门外国语学校</option>
								<option value="110127">北京市东城区板厂小学</option>
								<option value="110126">北京市第一七一中学</option>
								<option value="110125">北京市陈经纶中学</option>
								<option value="110124">北京宏志中学</option>
								<option value="110123">北京市东城区和平里第四小学</option>
								<option value="110122">北京市东城区和平里第一小学</option>
								<option value="110121">北京市东城区青年湖小学</option>
								<option value="110120">北京市大兴区第二中学</option>
								<option value="110119">中国人民大学附属小学朝阳学校</option>
								<option value="110118">中国人民大学附属中学朝阳学校</option>
								<option value="110117">北京市第五十中学分校</option>
								<option value="110116">北京市延庆第一中学</option>
								<option value="110115">北京市东城区宝华里小学</option>
								<option value="110114">北京市房山区石楼中学</option>
								<option value="110113">北京市第十四中学大兴安定分校</option>
								<option value="110112">北京市大兴区青云店中学</option>
								<option value="110111">小学课堂教学中有效提问与追问的技艺研究</option>
								<option value="110110">新媒体促进中小学家校合作研修会</option>
								<option value="110109">北京市朝阳区老君堂小学</option>
								<option value="110108">驷骑中天学校</option>
								<option value="110107">北京市大兴区魏善庄镇第二中心小学</option>
								<option value="110106">北京市大兴区团河小学</option>
								<option value="110105">北京市大兴区狼垡中学</option>
								<option value="110104">北京市大兴区亦庄镇第一中心小学</option>
								<option value="110103">北京市大兴区红星中学</option>
								<option value="110102">北京市第九十六中学</option>
								<option value="110101">北京市门头沟区坡头中学</option>
								<option value="110100">北京市朝阳区垂杨柳中心小学杨柳校区</option>
								<option value="110099">北京市通州区运河小学</option>
								<option value="110098">垂杨柳中心小学金都校区</option>
								<option value="110097">北京市第二十七中学</option>
								<option value="110096">北京市朝阳区新升小学</option>
								<option value="110095">北京市崇文门中学</option>
								<option value="110094">北京市龙潭中学</option>
								<option value="110093">北京市朝阳区牌坊小学南校区</option>
								<option value="110092">北京市朝阳区西直河小学</option>
								<option value="110091">北京市朝阳区祁庄小学</option>
								<option value="110090">北京市朝阳区牌坊小学</option>
								<option value="110089">北京市朝阳区实验小学</option>
								<option value="110088">北京市朝阳区张家店小学</option>
								<option value="110087">北京市朝阳区万子营民族小学</option>
								<option value="110086">北京市朝阳区垂杨柳中心小学</option>
								<option value="110085">北京市大兴区榆垡镇第一中心小学</option>
								<option value="110084">北京市大兴区榆垡中学</option>
								<option value="110083">北京市朝阳区慧忠北里第二小学</option>
								<option value="110082">北京市密云县第五小学</option>
								<option value="110081">北京市东城区回民小学</option>
								<option value="110080">中国石油大学附属小学</option>
								<option value="110079">北京市大兴区滨河小学</option>
								<option value="110078">北京市东城区景泰小学</option>
								<option value="110077">北京教育学院附属丰台实验学校</option>
								<option value="110076">北京市朝阳区北皋中心小学</option>
								<option value="110075">北京市朝阳区望欣园小学</option>
								<option value="110074">北京市朝阳区驼房营小学</option>
								<option value="110073">北京市第一一四中学</option>
								<option value="110072">北京市通州区七零九零幼儿园</option>
								<option value="110071">北京市平谷区第一小学</option>
								<option value="110070">北京市东城区定安里小学</option>
								<option value="110069">北京市通州区教师研修中心实验学校</option>
								<option value="110068">北京市昌平区城关小学</option>
								<option value="110067">北京市东城区培新小学</option>
								<option value="110066">北京市大兴区孙村中学</option>
								<option value="110065">北京市大兴区旧宫中学</option>
								<option value="110064">北京市第十一中学分校</option>
								<option value="110063">北京市第一零九中学</option>
								<option value="110062">北京市朝阳区安贞里第二小学</option>
								<option value="110061">北京市高家园中学</option>
								<option value="110060">北京市第十一中学</option>
								<option value="110059">北京市门头沟区育园小学</option>
								<option value="110058">北京市东城区天坛东里小学</option>
								<option value="110057">北京市大兴区第二小学</option>
								<option value="110056">北京市朝阳区十八里店小学</option>
								<option value="110055">酒仙桥一中分部</option>
								<option value="110054">北京市朝阳区安慧里中心小学</option>
								<option value="110053">陪育实验小学</option>
								<option value="110052">北京市大兴区德茂中学</option>
								<option value="110051">望星城幼儿园</option>
								<option value="110050">北京市昌平区百善学校</option>
								<option value="110049">北京市第十五中学南口学校</option>
								<option value="110048">北京市昌平区二毛学校</option>
								<option value="110047">北京市朝阳区王四营中心小学</option>
								<option value="110046">北京市朝阳区安贞里第一小学</option>
								<option value="110045">北京市门头沟区龙泉小学</option>
								<option value="110044">北京市朝阳区上辛堡小学</option>
								<option value="110043">北京市朝阳区南湖中园小学望花路校区</option>
								<option value="110042">北京师范大学第四附属中学</option>
								<option value="110041">北京市清河中学</option>
								<option value="110040">北京市房山区琉璃河水泥厂学校</option>
								<option value="110039">北京市朝阳外国语学校北苑分校（小学部）</option>
								<option value="110038">教育信息技术之行</option>
								<option value="110037">北京市朝阳区教研中心附属学校</option>
								<option value="110036">北京市东城区体育馆路小学</option>
								<option value="110035">北京市西城区白纸坊小学</option>
								<option value="110034">北京市东城区前门小学</option>
								<option value="110033">北京市房山区长沟中学</option>
								<option value="110032">北京印刷学院附属小学</option>
								<option value="110031">北京市朝阳区望京南湖东园小学</option>
								<option value="110030">北京市海淀区定慧里小学</option>
								<option value="110029">北京市朝阳区酒仙桥第二小学</option>
								<option value="110028">北京市朝阳区安苑北里小学</option>
								<option value="110027">北京一中PEQ教学模式研究活动</option>
								<option value="110026">北京市朝阳区高家园小学</option>
								<option value="110025">北京市朝阳区将台路小学</option>
								<option value="110024">北京市朝阳区奶子房小学</option>
								<option value="110023">北京市昌平区流村中学</option>
								<option value="110022">北京市朝阳区酒仙桥中心小学</option>
								<option value="110021">北京市五路居一中安华里校区</option>
								<option value="110020">北京市石景山区苹果园第二小学</option>
								<option value="110019">北京市第五十四中学</option>
								<option value="110018">北京市三里屯一中</option>
								<option value="110017">北京市朝阳区大山子第二小学</option>
								<option value="110016">北京市东城区花市小学</option>
								<option value="110015">北京教育科学研究院附属实验中学</option>
								<option value="110014">北京市门头沟区东辛房小学</option>
								<option value="110013">北京市第一中学</option>
								<option value="110012">慈航教育</option>
								<option value="110011">北京市昌平区南七家村实验学校</option>
								<option value="110010">北京慈航教育公司</option>
								<option value="110009">北京市第五十中学</option>
								<option value="110008">北京市第一实验小学房山分校</option>
								<option value="110007">北京市东城区黑芝麻胡同小学</option>
								<option value="110006">北京市广渠门中学</option>
								<option value="110005">北京市朝阳区南湖中园小学主校区</option>
								<option value="110004">北京师范大学昌平附属学校</option>
								<option value="110003">北京市第六十五中学</option>
								<option value="110002">产品测试学校</option>
								<option value="110001">陪育小学</option>
							</select>
						</div>
						<div class="modal-body">
							<input class="form-control" maxlength="20" type="text"
								id="migrate-comment" placeholder="转校原因">
						</div>
						<div class="modal-body hidden duplication-of-name">
							<input class="form-control" maxlength="2" type="text"
								id="duplication-discern" placeholder="重名标识 限非中文2位字符">
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">取消</button>
							<button id="btn-migrate-teacher-sure" type="button"
								data-loading-text="转移中…" class="btn btn-primary">转移</button>
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade teacher-del-modal" role="dialog">
				<div class="modal-dialog modal-sm">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
							</button>
							<h4 class="modal-title">
								删除教师<span></span>
							</h4>
						</div>
						<div class="modal-body">
							<input class="form-control" maxlength="20" type="text"
								id="reason" placeholder="删除原因">
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">取消</button>
							<button id="btn-del-sure" type="button" class="btn btn-danger">删除</button>
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
		src="http://localhost:8080/pycms/files/js/jquery.dataTables.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/dataTables.bootstrap.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/metisMenu.min.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/common.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/school-teachers.js"></script>
</body>
</html>