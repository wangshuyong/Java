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
<title>动态管理</title>
<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/pycms/files/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/pycms/files/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/pycms/files/css/jquery.fileupload.css">
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
	href="http://localhost:8080/pycms/files/css/notice-create.css">
<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/pycms/files/css/homework-create.css">
<link rel="stylesheet" type="text/css" href="http://localhost:8080/pycms/files/css/notice.css">
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
						<li ><a href="#"><i
								class="fa fa-bullhorn fa-fw"></i> 动态管理<span class="fa arrow"></span>
						</a>
							<ul class="nav nav-second-level hide">
								<li><a class="active"
									href="http://localhost:8080/pycms/files/all.jsp">全校动态监控</a>
								</li>
							</ul></li>
						<li class="active"><a href="#"><i class="fa fa-newspaper-o fa-fw"></i>
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
		<div id="page-wrapper" data-role="school_admin" data-type="school"
			data-is-banner="0">
			<div style='display:none' id='is_edit'>0</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="target-area">
						<div class="form-group">
							<label>发送范围</label> <select id="target-scope"
								class="form-control">
								<option value="0">老师和家长</option>
								<option value="1">老师</option>
								<option value="2">家长</option>
							</select> <select id="target-grade" class="form-control not-first">
								<option value="0">全部年级</option>
								<option data-grade-type="1" value="11">一年级</option>
								<option data-grade-type="1" value="12">二年级</option>
								<option data-grade-type="1" value="13">三年级</option>
								<option data-grade-type="1" value="14">四年级</option>
								<option data-grade-type="1" value="15">五年级</option>
								<option data-grade-type="1" value="16">六年级</option>
								<option data-grade-type="2" value="21">初一</option>
								<option data-grade-type="2" value="22">初二</option>
								<option data-grade-type="2" value="23">初三</option>
								<option data-grade-type="3" value="31">高一</option>
								<option data-grade-type="3" value="32">高二</option>
								<option data-grade-type="3" value="33">高三</option>
							</select>
						</div>
						<div class="form-group">
							<label>所属标签</label> <select id="target-tab" class="form-control">
								<option value="">请选择Tab</option>
								<option value="2004">学校新闻</option>
								<option value="2005">学知堂</option>
								<option value="2287">新闻资讯</option>
							</select>
						</div>
					</div>
					<!-- btn-heading end -->
					<div class="panel panel-default">
						<div class="panel-body">
							<div>
								<ul class="list">
									<li class="notice on" style="border-left:none"><a href="#">发送学校动态</a>
									</li>
								<!-- 	<li class="vote"><a href="#vote">发送投票</a>
									</li>
									<li class="survey"><a href="#survey">发送问卷</a>
									</li>
									<li class="survey-tpl"><a href="#survey-tpl">问卷模板库</a>
									</li> -->
								</ul>
								<div class='forms'>
									<div class="notice list-1">
										 <div id="form-1">
											<label class="col-sm-2 control-label">学校动态标题</label> <input
												id="notice-title" type="text" class="form-control"
												maxlength="50" value=""> <br>
										</div>
										<div id="form-2">
											<label class="col-sm-2 control-label">学校动态内容</label>
											<textarea id="notice-content" maxlength="2000"
												class="form-control textarea" rows="6"></textarea>
										</div>
										<div id="form-uni-code" class="notice-live-show"
											style="display: none">
											<label class="col-sm-2 control-label">唯一标识</label> <input
												type="text" class="form-control" id="notice-uni-code"
												value="">
										</div>
										<div id="form-4">
											<label class="col-sm-2 control-label notice-live-hide">定时发送</label>
											<label class="col-sm-2 control-label notice-live-show"
												style="display: none">直播开始时间</label>
											<div class="input-group">
												<span class="input-group-addon"><i
													class="glyphicon glyphicon-calendar"></i>
												</span> <input type="text" class="form-control"
													id="notice-intended-time" value="">
											</div>
										</div>
										<div id="form-live-end-time" class="notice-live-show"
											style="display: none">
											<label class="col-sm-2 control-label">直播结束时间</label>
											<div class="input-group">
												<span class="input-group-addon"><i
													class="glyphicon glyphicon-calendar"></i>
												</span> <input type="text" class="form-control"
													id="notice-live-end-time" value="">
											</div>
										</div>
										<div id="form-5">
											<label class="col-sm-2 control-label">上传图片</label> <span
												class="btn btn-default fileinput-button"> <i
												class="glyphicon glyphicon-plus"></i> <span>选择图片</span> 
												<input id="notice-image-upload" type="file" name="file"
												multiple="multiple"> </span>
											<p>只支持png、jpg、jpeg、gif文件，最大体积10M</p>
										</div>
										<div id="notice-file-progress">
											<div
												class="progress-bar progress-bar-success progress-bar-striped"
												aria-valuemin="0" aria-valuemax="100"></div>
										</div>
										<ul id="files">
										</ul>
										<!-- <div class="school-push">
											<input id="school-notice-push" type="checkbox"> <label
												for="school-notice-push">发送push通知</label>
										</div> -->
										<div class="form-6" style='display:none'>
											<label class="col-sm-2 control-label ">关闭评论</label>
											<div class="notice-need-reply" style="margin-top:23px;">
												<input id="notice-is-reply" type="checkbox"> <label
													for="notice-is-reply">如勾选此项，则任何用户不允许在该条通知下进行评论。</label>
											</div>
										</div>
										<button id="notice-submit" type="button"
											class="btn btn-primary btn-publish notice-live-hide">发送学校动态</button>
										<button id="notice-live-submit" type="button"
											class="btn btn-primary btn-publish notice-live-show"
											style="display: none">发送视频直播</button>
									</div> 
									<!-- <div>
										<span class='zhuan_juhua2' style="display:none;"> <img
											class='zhuan_juhua2' style="width:25px;"
											src='http://localhost:8080/pycms/files/img/zhuan_ju.gif' /> </span>
									</div> -->
									<!-- list-1 消息通知 end -->
									<div class='homework list-4'>
										<!-- <div class="panel-body">
											<form id="homework-form" role="form">
												<div class="form-group">
													<label>科目</label> <select id="homework-subject"
														class="form-control">
														<option value="">选择科目</option>
													</select>
												</div>
										<div class="form-group">
                                            <label>标题</label>
                                            <input id="homework-title" class="form-control" type="text">
                                        </div>
												<div class="form-group">
													<label>作业内容</label>
													<textarea id="homework-content" class="form-control"></textarea>
												</div>
												<div class="form-group" id='homework-wcsj'>
													<label>提交时间</label>
													<div class="input-group">
														<span class="input-group-addon"><i
															class="glyphicon glyphicon-calendar"></i>
														</span> <input type="text" class="form-control"
															id="homework-deadline" value="2015-11-20 08:00">
													</div>
												</div>
												<div class="form-group">
													<label>定时发送</label>
													<div class="input-group">
														<span class="input-group-addon"><i
															class="glyphicon glyphicon-calendar"></i>
														</span> <input type="text" class="form-control"
															id="homework-send-time" value="">
													</div>
												</div>
												<div class="form-group">
													<label>附件</label>
													<div>
														<span class="btn btn-default fileinput-button"> <i
															class="glyphicon glyphicon-plus"></i> <span>选择附件</span> <input
															id="homework-file-upload" type="file" name="file">
														</span> <span class='loading_homework' style="display:none;">
															<img style="width:25px;"
															src='http://localhost:8080/pycms/files/img/zhuan_ju.gif' />
															<i style="color:red;cursor:pointer;"
															class="btn-file-del fa fa-remove"></i> </span>
														<p class="upload-tips">只支持doc/docx、xls/xlsx、ppt/pptx、rar、zip，文件最大体积70M</p>
														<ul id="homework-files">
														</ul>
													</div>
												</div>
												<div class="form-group">
													<label>图片</label>
													<div>
														<span class="btn btn-default fileinput-button"> <i
															class="glyphicon glyphicon-plus"></i> <span>选择图片</span> <input
															id="homework-image-upload" type="file" name="file"
															multiple="multiple"> </span>
														<p class="upload-tips">只支持jpeg/jpg、png、gif文件，最大体积5M</p>
														<ul id="homework-images">
														</ul>
													</div>
												</div>
												<div class="form-group">
													<span class="btn btn-primary" data-loading-text="创建中…"
														id="btn-submit">发送作业</span>
												</div>
											</form>
										</div> -->
									</div> 
									<!-- list-2 发送作业 end -->
								<!-- 	 <div class="vote list-2">
										<div class="form-1">
											<label class="col-sm-2 control-label">投票标题</label> <input
												id="vote-title" type="text" class="form-control"
												maxlength="30"> <br>
										</div>
										<div class="form-2">
											<label class="col-sm-2 control-label">投票类型</label> <select
												id="vote-type">
												<option value="1">单选</option>
												<option value="2">多选</option>
											</select> <br>
										</div>
										<div class="time-area">
											<label class="col-sm-2 control-label">生效时间</label>
											<div class="input-group">
												<span class="input-group-addon"><i
													class="glyphicon glyphicon-calendar"></i>
												</span> <input type="text" class="form-control"
													id="vote-start-date" value="2015-11-19 18:00">
											</div>
											<span>&nbsp;至</span>
											<div class="input-group">
												<span class="input-group-addon"><i
													class="glyphicon glyphicon-calendar"></i>
												</span> <input type="text" class="form-control" id="vote-end-date">
											</div>
											<br>
										</div>
										<div class="options" id="vote-option">
											<label class="col-sm-2 control-label">投票选项</label>
											<div class="opt-right">
												<div class="vote-options"></div>
												<div class="add-option">
													<img
														src="http://localhost:8080/pycms/files/img/icon-add.png"
														alt> <span>加选项</span>
												</div>
											</div>
											right end
										</div>  
										投票选项 end
										 <p class="result">
											<label class="col-sm-2 control-label">投票结果可见</label> <input
												type="radio" id="but3" class="vote-result-public"
												name='but2' value="1" /><label for="but3"
												class="col-sm-2 control-label">允许</label> <input
												type="radio" id="but4" class="vote-result-public checked"
												name='but2' value="0" checked="checked" /><label for="but4"
												class="col-sm-2 control-label">不允许</label>
										</p>
										<div class="school-push school-vote-push">
											<input id="school-vote-push" type="checkbox"> <label
												for="school-vote-push">发送push通知</label>
										</div>
										<div class="form-6" style='display:none'>
											<label class="col-sm-2 control-label">关闭评论</label>
											<div class="notice-need-reply" style="margin:20px 0 3px;">
												<input id="notice-is-reply-vote" type="checkbox"> <label
													for="notice-is-reply-vote">如勾选此项，则任何用户不允许在该条通知下进行评论。</label>
											</div>
										</div>
										<button style="margin-top:25px;" id="vote-submit"
											type="button" data-loading-text="发送中…"
											class="btn btn-primary btn-publish">发送投票</button> 
									</div> -->
									<!-- list-2 发起提问 end -->
									<!-- <div class="survey list-3">
										<a id="link-survey-tpl" href="#survey-tpl">使用问卷模板</a>
										<div class="form-1" style="margin-bottom:18px;">
											<span>问卷标题</span> <input type="text" id="survey-title"
												class="form-control" maxlength="30">
										</div>
										<div class="form-1" style="margin-top:0px;">
											<span style="float:left;"> 问卷导语
												<div style="font-size:12px;color:#787878;">（选 填）</div> </span>
											<textarea id="survey-intro" maxlength="200"
												class="form-control textarea"
												style="height:100px;margin-left:4px;" onkeyup='countChar();'></textarea>
										</div>
										<div class="notice-need-reply"
											style="margin-top:-18px;margin-bottom:22px;">
											<div style="font-size:12px;color:#787878;">
												&nbsp;您还可以输入<b id='limit_num'>200</b>个字
											</div>
										</div>
										<script>
											function countChar() {
												var num = 200 - document
														.getElementById('survey-intro').value.length;
												if (num <= 0) {
													commModal.alert({
														content : '最多只能输入200个字'
													});
													$('#survey-intro')
															.val(
																	$(
																			'#survey-intro')
																			.val()
																			.substring(
																					0,
																					200));
													num = 0;
													$("#limit_num").css(
															'color', 'red');
												}
												/* if(num<0){
												     $("#limit_num").css('color','red');
													$('#survey-intro').val($('#survey-intro').val().substring(0,200));
													num=0;
												     alert('问卷导语限制200字以内！');
												 }else{
												     $("#limit_num").css('color','');
												 }*/
												document
														.getElementById('limit_num').innerHTML = num;
											}
										</script>
										<div class="time-area">
											<span>生效时间</span>
											<div class="input-group">
												<span class="input-group-addon"><i
													class="glyphicon glyphicon-calendar"></i>
												</span> <input type="text" class="form-control"
													id="survey-start-date" value="2015-11-19 18:00">
											</div>
											<span>&nbsp;至</span>
											<div class="input-group">
												<span class="input-group-addon"><i
													class="glyphicon glyphicon-calendar"></i>
												</span> <input type="text" class="form-control"
													id="survey-end-date">
											</div>
											<br>
										</div>
										<ul id="survey-questions">
										</ul>
										<div id="question">
											<div style="width:550px\0;">
												<label class="col-sm-2 control-label">选择题型</label> <input
													type="radio" id="but" name="question-type" value="single"
													class="checked" checked="checked"><label for="but"
													class="col-sm-2 control-label">单选题</label> <input
													type="radio" id="but1" name="question-type" value="multi"><label
													for="but1" class="col-sm-2 control-label">多选题</label> <input
													type="radio" id="but2" name="question-type" value="text"><label
													for="but2" class="col-sm-2 control-label">填空题</label>
											</div>
											<button id="survey-question-add" class="btn btn-default">增加题目</button>
										</div>
										<div class="school-push school-survey-push">
											<input id="school-survey-push" type="checkbox"> <label
												for="school-survey-push">发送push通知</label>
										</div>
										<button id="survey-submit" type="button"
											data-loading-text="发送中…" class="btn btn-primary btn-publish">发送问卷</button>
									</div> -->
									<!-- list-3问卷调查 end -->
									<!-- 问卷模板库 start -->
									<div class="survey-tpl">
										 <!-- <form class="form-list">
											<div class="input-group">
												<select class="form-control" id="survey-category">
													<option value="">一级分类</option>
													<option value="6">学生问卷</option>
													<option value="5">教师问卷</option>
													<option value="1">家长问卷</option>
												</select>
											</div>
											<div class="input-group">
												<select class="form-control" id="survey-sub-category">
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
											<div class="input-group">
												<span class="input-group-addon">问卷标题</span> <input
													class="form-control" type="text" id="survey-tpl-title">
											</div>
										</form>  -->
										<!-- <div class="col-lg-12">
											<table id="survey-table"
												class="table table-bordered table-hover table-striped">
												<thead>
													<tr>
														<th>一级分类</th>
														<th>二级分类</th>
														<th>问卷标题（点击查看）</th>
														<th>问卷导语</th>
														<th>选择</th>
													</tr>
												</thead>
												<tbody>
													<tr class="items" data-id="80">
														<td>学生问卷</td>
														<td>学生学习</td>
														<td class="title">关于“海洋、海韵、海娃”活动课程的调查问卷</td>
														<td>尊敬的各位家长、同学： ...</td>
														<td><a class="choose-survey">选择该模板</a>
														</td>
													</tr>
													<tr class="items" data-id="77">
														<td>家长问卷</td>
														<td>教育教学</td>
														<td class="title">家长调查问卷-11</td>
														<td>尊敬的家长： 您好！ 为了...</td>
														<td><a class="choose-survey">选择该模板</a>
														</td>
													</tr>
													<tr class="items" data-id="76">
														<td>学生问卷</td>
														<td>学生学习</td>
														<td class="title">和老师说说心里话</td>
														<td>我们是陪育100通讯公司，接受...</td>
														<td><a class="choose-survey">选择该模板</a>
														</td>
													</tr>
													<tr class="items" data-id="75">
														<td>学生问卷</td>
														<td>学生学习</td>
														<td class="title">统计广渠门中学新初一、新高一学生近三年内参加科技竞赛情况</td>
														<td>各位家长，各位同学，您们好！ ...</td>
														<td><a class="choose-survey">选择该模板</a>
														</td>
													</tr>
													<tr class="items" data-id="74">
														<td>家长问卷</td>
														<td>教育关注</td>
														<td class="title">广渠门中学家长问卷</td>
														<td>尊敬的家长，您好！ 开...</td>
														<td><a class="choose-survey">选择该模板</a>
														</td>
													</tr>
													<tr class="items" data-id="73">
														<td>家长问卷</td>
														<td>教育关注</td>
														<td class="title">广渠门中学家长问卷</td>
														<td>尊敬的家长，您好！ 您...</td>
														<td><a class="choose-survey">选择该模板</a>
														</td>
													</tr>
													<tr class="items" data-id="72">
														<td>学生问卷</td>
														<td>学生学习</td>
														<td class="title">初二思品学科第二框《孝敬父母》调查问卷</td>
														<td>各位家长，您好。请孩子放学回家...</td>
														<td><a class="choose-survey">选择该模板</a>
														</td>
													</tr>
													<tr class="items" data-id="71">
														<td>家长问卷</td>
														<td>教育关注</td>
														<td class="title">宝贝，快来回答Cici老师的提问吧。</td>
														<td>请家长在今天孩子放学的时候帮助...</td>
														<td><a class="choose-survey">选择该模板</a>
														</td>
													</tr>
													<tr class="items" data-id="69">
														<td>家长问卷</td>
														<td>教育关注</td>
														<td class="title">高二年级家长会讲座反馈问卷</td>
														<td>高二年级的各位家长，您好。请您...</td>
														<td><a class="choose-survey">选择该模板</a>
														</td>
													</tr>
													<tr class="items" data-id="68">
														<td>家长问卷</td>
														<td>教育关注</td>
														<td class="title">广渠门中学家庭教育家长问卷11</td>
														<td></td>
														<td><a class="choose-survey">选择该模板</a>
														</td>
													</tr>
													<tr class="items" data-id="67">
														<td>学生问卷</td>
														<td>学生学习</td>
														<td class="title">学生学情问卷调查</td>
														<td>各位家长好，请您与孩子共同完成...</td>
														<td><a class="choose-survey">选择该模板</a>
														</td>
													</tr>
													<tr class="items" data-id="66">
														<td>家长问卷</td>
														<td>综合</td>
														<td class="title">学生担任班务需求问卷</td>
														<td></td>
														<td><a class="choose-survey">选择该模板</a>
														</td>
													</tr>
													<tr class="items" data-id="64">
														<td>学生问卷</td>
														<td>学生学习</td>
														<td class="title">家长关注孩子学习调查</td>
														<td>各位家长您好： ...</td>
														<td><a class="choose-survey">选择该模板</a>
														</td>
													</tr>
													<tr class="items" data-id="63">
														<td>家长问卷</td>
														<td>综合</td>
														<td class="title">孩子的成绩选用等级方式汇报还是分数汇报的的形式</td>
														<td>汇报成绩的方式</td>
														<td><a class="choose-survey">选择该模板</a>
														</td>
													</tr>
													<tr class="items" data-id="62">
														<td>学生问卷</td>
														<td>学生学习</td>
														<td class="title">您的孩子在家看课外书吗?</td>
														<td>您的孩子在家看课外书吗? 他在...</td>
														<td><a class="choose-survey">选择该模板</a>
														</td>
													</tr>
													<tr class="items" data-id="60">
														<td>学生问卷</td>
														<td>学生学习</td>
														<td class="title">孩子哪些学科学的比较吃力？</td>
														<td></td>
														<td><a class="choose-survey">选择该模板</a>
														</td>
													</tr>
													<tr class="items" data-id="59">
														<td>家长问卷</td>
														<td>综合</td>
														<td class="title">您的孩子在家看课外书吗?</td>
														<td>您的孩子在家看课外书吗? 他在...</td>
														<td><a class="choose-survey">选择该模板</a>
														</td>
													</tr>
													<tr class="items" data-id="57">
														<td>家长问卷</td>
														<td>家庭教育</td>
														<td class="title">班务问卷</td>
														<td>本学期您在班级管理方面有什么改...</td>
														<td><a class="choose-survey">选择该模板</a>
														</td>
													</tr>
													<tr class="items" data-id="55">
														<td>家长问卷</td>
														<td>暑期综合调查问卷</td>
														<td class="title">暑期问卷</td>
														<td>各位家长: 暑期到了.有个小问...</td>
														<td><a class="choose-survey">选择该模板</a>
														</td>
													</tr>
													<tr class="items" data-id="54">
														<td>学生问卷</td>
														<td>学生学习</td>
														<td class="title">小学生英语兴趣调查问卷</td>
														<td>请你认真阅读此问卷，并认真选择...</td>
														<td><a class="choose-survey">选择该模板</a>
														</td>
													</tr>
													<tr class="items" data-id="53">
														<td>家长问卷</td>
														<td>家庭教育</td>
														<td class="title">期末家长调查问卷</td>
														<td></td>
														<td><a class="choose-survey">选择该模板</a>
														</td>
													</tr>
													<tr class="items" data-id="52">
														<td>家长问卷</td>
														<td>暑期计划</td>
														<td class="title">期末家长调查问卷</td>
														<td>针对孩子本学习的读书情况，家长...</td>
														<td><a class="choose-survey">选择该模板</a>
														</td>
													</tr>
													<tr class="items" data-id="51">
														<td>家长问卷</td>
														<td>综合</td>
														<td class="title">三年级5班学生情况调查问卷</td>
														<td>家长您好：为了更有利于您的孩子...</td>
														<td><a class="choose-survey">选择该模板</a>
														</td>
													</tr>
													<tr class="items" data-id="50">
														<td>学生问卷</td>
														<td>学生学习</td>
														<td class="title">您的孩子在暑期学会了什么生存技能？</td>
														<td>为了孩子能适应未来的生活，希望...</td>
														<td><a class="choose-survey">选择该模板</a>
														</td>
													</tr>
													<tr class="items" data-id="49">
														<td>家长问卷</td>
														<td>暑期计划</td>
														<td class="title">假期加强语文基础和数学计算的必要性</td>
														<td>请您根据孩子的情况分析选择关于...</td>
														<td><a class="choose-survey">选择该模板</a>
														</td>
													</tr>
													<tr class="items" data-id="44">
														<td>家长问卷</td>
														<td>暑期综合调查问卷</td>
														<td class="title">期末家长调查问卷</td>
														<td></td>
														<td><a class="choose-survey">选择该模板</a>
														</td>
													</tr>
													<tr class="items" data-id="42">
														<td>学生问卷</td>
														<td>学生学习</td>
														<td class="title">“单词突击赢“学习意向调查</td>
														<td>尊敬的家长：目前我校正在为您的...</td>
														<td><a class="choose-survey">选择该模板</a>
														</td>
													</tr>
													<tr class="items" data-id="41">
														<td>家长问卷</td>
														<td>暑期综合调查问卷</td>
														<td class="title">小学生暑期安全调查问卷</td>
														<td></td>
														<td><a class="choose-survey">选择该模板</a>
														</td>
													</tr>
													<tr class="items" data-id="40">
														<td>家长问卷</td>
														<td>对教师满意度调查</td>
														<td class="title">某某教师民主测评问卷</td>
														<td></td>
														<td><a class="choose-survey">选择该模板</a>
														</td>
													</tr>
													<tr class="items" data-id="39">
														<td>家长问卷</td>
														<td>暑期计划</td>
														<td class="title">学生暑期计划问卷</td>
														<td>亲爱的家长，您好！暑假是每个夏...</td>
														<td><a class="choose-survey">选择该模板</a>
														</td>
													</tr>
													<tr class="items" data-id="38">
														<td>教师问卷</td>
														<td>师生沟通</td>
														<td class="title">家长会数学学科调查</td>
														<td></td>
														<td><a class="choose-survey">选择该模板</a>
														</td>
													</tr>
													<tr class="items" data-id="36">
														<td>家长问卷</td>
														<td>综合</td>
														<td class="title">某某教师民主评测表--思想品德</td>
														<td>1.清正廉洁、一心为公、依法办...</td>
														<td><a class="choose-survey">选择该模板</a>
														</td>
													</tr>
													<tr class="items" data-id="34">
														<td>家长问卷</td>
														<td>家庭教育</td>
														<td class="title">一年级学生家长调查问卷</td>
														<td>尊敬的家长： 您好!您的孩子步...</td>
														<td><a class="choose-survey">选择该模板</a>
														</td>
													</tr>
													<tr class="items" data-id="33">
														<td>学生问卷</td>
														<td>学生学习</td>
														<td class="title">黑芝麻胡同小学——我为老师写评语</td>
														<td>亲爱的同学们： 本学期...</td>
														<td><a class="choose-survey">选择该模板</a>
														</td>
													</tr>
													<tr class="items" data-id="32">
														<td>家长问卷</td>
														<td>家庭教育</td>
														<td class="title">学生参与家务劳动情况调查</td>
														<td>现在的孩子大都是独生子女，常以...</td>
														<td><a class="choose-survey">选择该模板</a>
														</td>
													</tr>
													<tr class="items" data-id="31">
														<td>学生问卷</td>
														<td>学生学习</td>
														<td class="title">上辛堡小学校外活动调查问卷</td>
														<td>通过踏青春游活动，可以让学生亲...</td>
														<td><a class="choose-survey">选择该模板</a>
														</td>
													</tr>
													<tr class="items" data-id="30">
														<td>家长问卷</td>
														<td>家庭教育</td>
														<td class="title">学生行为习惯调查问卷</td>
														<td></td>
														<td><a class="choose-survey">选择该模板</a>
														</td>
													</tr>
													<tr class="items" data-id="29">
														<td>家长问卷</td>
														<td>教育关注</td>
														<td class="title">四年级学生自律行为习惯调查问卷（9-11周岁儿童）</td>
														<td></td>
														<td><a class="choose-survey">选择该模板</a>
														</td>
													</tr>
													<tr class="items" data-id="28">
														<td>家长问卷</td>
														<td>家庭教育</td>
														<td class="title">家庭教育观念的调查问卷</td>
														<td></td>
														<td><a class="choose-survey">选择该模板</a>
														</td>
													</tr>
													<tr class="items" data-id="27">
														<td>家长问卷</td>
														<td>家庭教育</td>
														<td class="title">学生背景情况调查问卷</td>
														<td></td>
														<td><a class="choose-survey">选择该模板</a>
														</td>
													</tr>
													<tr class="items" data-id="26">
														<td>家长问卷</td>
														<td>家庭教育</td>
														<td class="title">家庭教育观念的调查问卷</td>
														<td></td>
														<td><a class="choose-survey">选择该模板</a>
														</td>
													</tr>
													<tr class="items" data-id="25">
														<td>家长问卷</td>
														<td>教育关注</td>
														<td class="title">家长对教育发展关注调查问卷</td>
														<td></td>
														<td><a class="choose-survey">选择该模板</a>
														</td>
													</tr>
													<tr class="items" data-id="24">
														<td>家长问卷</td>
														<td>综合</td>
														<td class="title">广渠门中学家庭教育家长问卷</td>
														<td></td>
														<td><a class="choose-survey">选择该模板</a>
														</td>
													</tr>
													<tr class="items" data-id="23">
														<td>家长问卷</td>
														<td>对教师满意度调查</td>
														<td class="title">家长对教师工作满意度调查问卷</td>
														<td></td>
														<td><a class="choose-survey">选择该模板</a>
														</td>
													</tr>
													<tr class="items" data-id="22">
														<td>家长问卷</td>
														<td>校园安全</td>
														<td class="title">中学生学校周边安全的调查问卷</td>
														<td></td>
														<td><a class="choose-survey">选择该模板</a>
														</td>
													</tr>
													<tr class="items" data-id="20">
														<td>家长问卷</td>
														<td>综合</td>
														<td class="title">期末家长调查问卷</td>
														<td></td>
														<td><a class="choose-survey">选择该模板</a>
														</td>
													</tr>
													<tr class="items" data-id="18">
														<td>教师问卷</td>
														<td>师生沟通</td>
														<td class="title">期末教师调查问卷（推荐）</td>
														<td></td>
														<td><a class="choose-survey">选择该模板</a>
														</td>
													</tr>
													<tr class="items" data-id="15">
														<td>家长问卷</td>
														<td>综合</td>
														<td class="title">期末家长调查问卷（12题）</td>
														<td></td>
														<td><a class="choose-survey">选择该模板</a>
														</td>
													</tr>
													<tr class="items" data-id="7">
														<td>家长问卷</td>
														<td>综合</td>
														<td class="title">期末家长调查问卷</td>
														<td></td>
														<td><a class="choose-survey">选择该模板</a>
														</td>
													</tr>
												</tbody>
											</table>
										</div> -->
									</div>
								</div>
								<!-- forms 发送通知 end -->
							</div>
							<!-- /.bdbox -->
						</div>
						<!-- /.panel-body -->
					</div>

					<!-- >>>>>>>>>>ming开始写选择模板后，直接到已经绑好页面中去。------------------------ -->
					<div id='banner_been5' style='display:none'>
						<span id='banner_been5_1'
							style='float:left;display:block;min-width:300px;color:#C2672C;'></span>
						<input class="banner_been5" type="button" value="更改">
						<div>
							<button
								style='padding:3px 30px;font-weight:600;margin:10px 15px 0 0;'
								class="btn btn-primary btn-publish" data-loading-text="发送中…"
								type="button" id="notice-submit2">发送</button>
							<button
								style='padding:3px 30px;font-weight:600;margin:10px 0 0 0;background:#EAEFF2;border:1px solid #E3E5E8;color:#656667;'
								class="btn btn-primary btn-publish" data-loading-text="发送中…"
								type="button" id="notice-submit3">取消</button>
						</div>
						<div style='display:none' id='json_select_list'></div>
					</div>
					<!-- ------------------------ <<<<<<<<<<-->

					<!-- /.panel -->
				</div>
			</div>
			<!-- /.row -->
			<!-- 弹出插件 -->
			<div class="modal fade survey-preview-modal" role="dialog">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
							</button>
							<h4 class="modal-title"></h4>
						</div>
						<div class="modal-body">
							<dl id="survey-area"></dl>
						</div>
						<div class="modal-footer">
							<button id="btn-choose" type="button" class="btn btn-primary">选择该模板</button>
						</div>
					</div>
				</div>
			</div>
			<!-- <div class="modal fade survey-release-modal" tabindex="-1"
				role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true"
				data-backdrop="static">
				<div class="modal-dialog modal-sm" style="width:500px;">
					<div class="modal-content" style="width:500px;">
						<div class="modal-body">
							<h3 class="share-confirm">发送成功！</h3>
							<h3 class="share-sure">请选择分类</h3>
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
						<div class="modal-footer">
							<button id="btn-share-survey-tpl-submit" type="button"
								class="btn btn-primary share-sure" data-loading-text="共享中…">确定</button>
							<p class="share-confirm">
								是否将此问卷共享至问卷库中<br>供其他人查看与使用？
							</p>
							<button id="btn-share-survey-tpl-sure" type="button"
								class="btn btn-primary share-confirm">共享</button>
							<button id="btn-share-survey-tpl-cancel" type="button"
								class="btn btn-cancel">不共享</button>
						</div>
						<div class='share-sure'
							style="width:464px;height:300px;margin:10px auto 0;background:url('http://localhost:8080/pycms/files/img/classify_hint.jpg');"></div>
					</div>
				</div>
			</div> -->
		<!-- 	<div class="data">
				<textarea id="data-survey-single">
            <li class="survey-question">
                <div class="survey-drop-area"></div>
                <div class="left">
                    <p>
								<span class="survey-question-type" data-question-type="1">单选</span><span
									class="question-order"></span>
							</p>
                </div>
                <div class="right">
                    <div class="question-edit">
                        <span class="btn-copy fa fa-copy"></span>
                        <span class="btn-del fa fa-remove"></span>
                    </div>
                    <div class="input-group in-none">
                        <input
									class="survey-question-title form-control" type="text"
									maxlength="30" placeholder="单选题标题">
                    </div>
                    <div class="survey-options"></div>
                    <div class="add-option">
                        <img
									src="http://localhost:8080/pycms/files/img/icon-add.png" alt="">
                        <span>加选项</span>
                    </div>
                </div>
            </li>
        </textarea>
				<textarea id="data-survey-multi">
            <li class="survey-question">
                <div class="survey-drop-area"></div>
                <div class="left">
                    <p>
								<span class="survey-question-type" data-question-type="2">多选</span><span
									class="question-order"></span>
							</p>
                </div>
                <div class="right">
                    <div class="question-edit">
                        <span class="btn-copy fa fa-copy"></span>
                        <span class="btn-del fa fa-remove"></span>
                    </div>
                    <div class="input-group in-none">
                        <input
									class="survey-question-title form-control" type="text"
									maxlength="30" placeholder="多选题标题">
                    </div>
                    <div class="survey-options"></div>
                    <div class="add-option">
                        <img
									src="http://localhost:8080/pycms/files/img/icon-add.png" alt="">
                        <span>加选项</span>
                    </div>
                </div>
            </li>
        </textarea>
				<textarea id="data-survey-text">
            <li class="survey-question">
                <div class="survey-drop-area"></div>
                <div class="left">
                    <p>
								<span class="survey-question-type" data-question-type="3">填空</span><span
									class="question-order"></span>
							</p>
                </div>
                left end
                <div class="right">
                    <div class="question-edit">
                        <span class="btn-copy fa fa-copy"></span>
                        <span class="btn-del fa fa-remove"></span>
                    </div>
                    <div class="input-group">
                        <input
									class="survey-question-title form-control" type="text"
									maxlength="30" placeholder="填空题标题">
                    </div>
                </div>
                right end
            </li>
        </textarea>
			</div> -->
		</div>
	</div>
	<div id="download-client-modal" class="modal" tabindex="-1"
		role="dialog" aria-hidden="true" data-backdrop="static">
		<div class="modal-dialog">
			<button class="dialog-close" data-dismiss="modal"></button>
			<a class="btn-download-client"
				href="http://cms.peiyu100.com/download/client" target="_blank"></a>
		</div>
	</div>
	<script type="text/javascript" src="http://localhost:8080/pycms/files/js/jquery.min.js"></script>
	<script type="text/javascript" src="http://localhost:8080/pycms/files/js/jquery-ui.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/bootstrap.min.js"></script>
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
		src="http://localhost:8080/pycms/files/js/jquery.ui.widget.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/jquery.iframe-transport.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/jquery.fileupload.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/metisMenu.min.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/bootstrap-datetimepicker.zh-CN.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/common.js"></script>
	<script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/notice-create.js"></script>
		
		<script type="text/javascript">

	  </script>
</body>
</html>
