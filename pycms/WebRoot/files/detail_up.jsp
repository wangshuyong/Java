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
<link rel="dns-prefetch" href="//static.peiyu100.com">
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
<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/pycms/files/css/notice.css">
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
		data-host="http://localhost:8080/pycms/" data-role="school_admin">
		<!-- Navigation -->
		<nav class="navbar navbar-cms navbar-static-top" role="navigation">
			<div class="navbar-header">
				<a class="navbar-brand" href="http://localhost:8080/pycms/">陪育CMS（产品测试学校）</a>
			</div>
			<div class="nav navbar-top-links navbar-right"
				style="margin-right:0;">
				<li><span>欢迎您！测试</span>
				</li>
				<li><a href="http://localhost:8080/pycms/signout"><i
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
								<li><a 
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
		<div id="page-wrapper" data-role="school_admin" data-type="school"
			data-is-banner="0" feed-id="7134">
			<div style='display:none' id='is_edit'>0</div>
			<div class="row">
				<div class="col-lg-12">
					<!-- btn-heading end -->
					<div class="panel panel-default">
						<div class="panel-body">
							<div>
								<ul class="list">
									<li class="notice on" style="border-left:none"><a href="#">发送学校动态</a>
									</li>
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
												class="glyphicon glyphicon-plus"></i> <span>选择图片</span> <input
												id="notice-image-upload" type="file" name="file"
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
										<div class="form-6" style='display:none'>
											<label class="col-sm-2 control-label ">关闭评论</label>
											<div class="notice-need-reply" style="margin-top:23px;">
												<input id="notice-is-reply" type="checkbox"> <label
													for="notice-is-reply">如勾选此项，则任何用户不允许在该条通知下进行评论。</label>
											</div>
										</div>
										<button id="notice-submit-compile" type="button"
											data-loading-text="发布中…"
											class="btn btn-primary btn-publish notice-live-hide">重新发布</button>
										<button id="notice-submit-compile-cancel" type="button"
											data-loading-text="发送中…"
											class="btn btn-primary btn-publish notice-live-hide">取消</button>
										<button id="notice-live-submit" type="button"
											data-loading-text="发送中…"
											class="btn btn-primary btn-publish notice-live-show"
											style="display: none">发送视频直播</button>
									</div>
								
									<!-- list-1 消息通知 end -->
									<!-- list-2 发送作业 end -->
									<!-- list-2 发起提问 end -->
									<!-- list-3问卷调查 end -->
									<!-- 问卷模板库 start -->
									<div class="survey-tpl">
										
										<div class="col-lg-12">
									
										</div>
									</div>
								</div>
								<!-- forms 发送通知 end -->
							</div>
							<!-- /.bdbox -->
						</div>
						<!-- /.panel-body -->
					</div>

					<!-- >>>>>>>>>>ming开始写选择模板后，直接到已经绑好页面中去。------------------------ -->
					
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
			
			<div class="data">
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
                <!-- left end -->
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
                <!-- right end -->
            </li>
        </textarea>
			</div>
		</div>
	</div>
	<div id="download-client-modal" class="modal" tabindex="-1"
		role="dialog" aria-hidden="true" data-backdrop="static">
		<div class="modal-dialog">
			<button class="dialog-close" data-dismiss="modal"></button>
			<a class="btn-download-client"
				href="http://localhost:8080/pycms/download/client" target="_blank"></a>
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
	var Request = new Object(); 
	request = GetRequest(); 
	var id = request["id"];
	alert("1="+id);
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
			  alert(data.infm.title);
			    alert(data.infm.content);
			 	 $("#notice-title").html("<input  id='notice-title' type='text' class='form-control' maxlength='50' value='"+data.infm.title+"'>");
			 	 $("#notice-content").val(data.infm.content);
			 	
			
				 //没有附件
			    $("#files").html("<li data-file-id='b11d49ce00d8016a6c54ba8fa7477782c164dae78389ad5b508b377162793414c4620712802bec027ed7d84c4bd40065caba02bfb1e57f3fb9c453ab2b11af9583eec7c254e78c2ebad68ea5b7950c48'><i class='icon-clip fa fa-paperclip'></i> <span>2f0722c2-a744-4c44-9ec5-779eef5101c8.gif &nbsp;</span><i class='btn-file-del fa fa-remove'></i></li>");
			  
			  if(data.infm.status==1){
			 
			 	 $("#quote-reply-modal").html();

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