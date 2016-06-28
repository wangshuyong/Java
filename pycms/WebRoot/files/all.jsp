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
.tcdPageCode{padding: 15px 20px;text-align: left;color: #ccc;text-align:right;}
.tcdPageCode a{display: inline-block;color: #428bca;display: inline-block;height: 25px;	line-height: 25px;	padding: 0 10px;border: 1px solid #ddd;	margin: 0 2px;border-radius: 4px;vertical-align: middle;}
.tcdPageCode a:hover{text-decoration: none;border: 1px solid #428bca;}
.tcdPageCode span.current{display: inline-block;height: 25px;line-height: 25px;padding: 0 10px;margin: 0 2px;color: #fff;background-color: #428bca;	border: 1px solid #428bca;border-radius: 4px;vertical-align: middle;}
.tcdPageCode span.disabled{	display: inline-block;height: 25px;line-height: 25px;padding: 0 10px;margin: 0 2px;	color: #bfbfbf;background: #f2f2f2;border: 1px solid #bfbfbf;border-radius: 4px;vertical-align: middle;}
</style>

<!-- <script type="text/javascript"
		src="http://localhost:8080/pycms/files/js/jquery.min.js"></script> -->

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
								
										<input class="form-control" id="pageCount" type="hidden" value="">
										<input class="form-control" id="npageNum" type="hidden" value="1">
										<input class="form-control" id="npageRecordSize" type="hidden" value="20">
									
									<div class="input-group">
										<select class="form-control" id="notice-type" name="Information.type">
											<option value="">全部</option>
											<option value="通知">通知</option>
											<option value="作业">作业</option>
											<!-- <option value="投票">投票</option>
											<option value="问卷">问卷</option> -->
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
											
											
										</select>
									</div>
									<div class="input-group">
										<span class="input-group-addon">标题</span> <input
											class="form-control" type="text" id="notice-title" name="Information.title">
									</div>
									<button id="query_basic"   onClick="findTData(1)";
										class="btn btn-default">查询</button>
								
								</div>
								<div class="col-lg-12">
									<table id="notice-table"
										class="table table-bordered table-hover table-striped">
										<thead>
											<tr>
												<th valign="middle">类型</th>
												<th style='width:200px;'>标题</th>
												<th>科目</th>
												<th>回复/参与数</th>
												<th style='width:100px;'>发起人</th>
												<th id='time_sort'>发送时间</th>
												<th>结束时间</th>
												<th colspan="2">管理</th>
											</tr>
										</thead>
										
										

										<!-- 班级动态、全校动态监控 -->
										<tbody id='notice-table-tbody'>
										</tbody>
										
									</table>

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

<script type="text/javascript">
	  var urlFile = $('#wrapper').attr('data-static');
	  var url = $('#wrapper').attr('data-host');
	 

		var npageNum=1;
		var distinguish=0;
	  function  findTData(npageNum){ 
			 $.post( 
			 ""+url+"/all_allInfo",
			 {
			  type:$("#notice-type").val(),
			  author:$("#notice-author").val(),
			  startDate:$("#start-date").val(),
			  endDate:$("#end-date").val(),
			  title:$("#notice-title").val(),
			  npageNum:npageNum,
			  npageRecordSize:$("#npageRecordSize").val(),
			  distinguish:distinguish
			  },
			 function(data){
			 	if(data.endDate!=null){
			 		$("#end-date").val(data.endDate);
			 	}
			 	if(data.startDate!=null){
			 		$("#start-date").val(data.startDate);
			 	}
			 	if(data.type!=null){
			 		$("#notice-type").val(data.type);
			 	}
			 	if(data.title!=null){
			 		$("#notice-title").val(data.title);
			 	}

				//资讯列表信息 
				if(data.informationMaps.length===0){
					$("#notice-table-tbody").html("没有数据");
					$("#pageCount").attr("value",data.pageCount);
					return false;
				}

				var htmlbody;
				var html='';
				var type="";
				var z= /^[0-9]*$/;
				for(var i = 0; i<data.informationMaps.length;i++){
					 debugger; 
					 if(data.informationMaps[i].type=="通知"){
							type=1;
						}
					 if(data.informationMaps[i].type=="作业"){
							type=4;
						}
					 
					html+="<tr  data-notice-id="+data.informationMaps[i].id+" >";
					
					html+="<td><img src='http://localhost:8080/pycms/files/img/icon-notice-"+type+".png' /></td>";
					
					
					
					html+="<td style='width:200px;' class='title'><a href='javascript:;' onclick='newCurr("+data.informationMaps[i].id+","+type+")' >"+data.informationMaps[i].title+"</a></td>";
	
					 if(data.informationMaps[i].subject_id==null){
						 html+="<td></td>";
					 }else{
					 	html+="<td>"+data.informationMaps[i].subject_id+"</td>";
					 }
					 if((z.test(data.informationMaps[i].count))&&(z.test(data.informationMaps[i].participantCount))){
					 	html+="<td>"+data.informationMaps[i].count+"/"+data.informationMaps[i].participantCount+"</td>";
					 }else{
					  	if(z.test(data.informationMaps[i].participantCount)){
					 	 html+="<td>0/"+data.informationMaps[i].participantCount+"</td>";
					 	}else{
					 		if(z.test(data.informationMaps[i].count)){
					 		 	html+="<td>"+data.informationMaps[i].count+"/0</td>";
					 		}else{
					 			html+="<td>0/0</td>";
					 		}
					 	}
					 }
					
					 html+="<td style='width:100px;'>"+data.informationMaps[i].author+"</td><td>"+data.informationMaps[i].createtime+"</td><td>"+data.informationMaps[i].changetime+"</td>";
                     if(data.informationMaps[i].is_top==1){
                     	html += "<td><a class='btn-top-disabled' href='javascript:;' onclick='delCurr("+data.informationMaps[i].id+")'  ><span title='取消置顶' class='fa fa-arrow-up' data-notice-id="+data.informationMaps[i].id+" >取消置顶</span></a></td>";
                     }else{
                        html += "<td><a class='btn-top' href='javascript:;' onclick='delCurr("+data.informationMaps[i].id+")'  ><span class='fa fa-arrow-up' title='置顶' data-notice-id="+data.informationMaps[i].id+" >置顶</span></a></td>";
                     }
                       html += "<td><a   class='btn-del'><span class='fa fa-remove' title='删除'>删除</span></a></td></tr>";
					
				htmlbody+="<tr><td>"+data.informationMaps[i].type+"</td><td style='width:200px;' class='title'>"+data.informationMaps[i].title+"</td><td>"+data.informationMaps[i].subject_id+"</td><td>"+data.informationMaps[i].count+"/"+data.informationMaps[i].participantCount+"</td><td style='width:100px;'>"+data.informationMaps[i].author+"</td><td>"+data.informationMaps[i].createtime+"</td><td>"+data.informationMaps[i].changetime+"</td><td><a >"+data.informationMaps[i].is_top+"</a><a >删除</a></td></tr>";
				}
				//分页内容
				html+=" <tr><td colspan='9'><div align='right'><a  onClick='findTData(1)'; >首页</a><a  onClick='findTData("+(data.npageNum-1)+")'; >上一页</a>"+data.npageNum+"/"+data.pageCount+"<a  onClick='findTData("+(data.npageNum+1)+")';>下一页</a><a  onClick='findTData("+data.pageCount+")';>尾页</a></div></td></tr>";
				$("#notice-table-tbody").html(html);
			
				//老师信息
				var author="<option value=''>选择发布人</option>";
				if(data.teacherMap.length===0){
					return false;
				}
				for(var i = 0; i<data.teacherMap.length;i++){
				if(data.author!=null){
					  $("#notice-author").find("option[text='"+data.author+"']").attr("selected",true);
				}
					author+="<option value="+data.teacherMap[i].name+">"+data.teacherMap[i].name+"</option>";
				}
				$("#notice-author").html(author);
				$("#pageCount").val(data.pageCount);
				$("#npageNum").val(data.npageNum);
				$("#npageRecordSize").val(data.npageRecordSize);
			});	
	 }
   
 $('#notice-table').confirmation({
        selector: '.btn-del',
        placement: 'left',
        title: '确认删除么？',
        btnOkLabel: '删除',
        btnCancelLabel: '取消',
        onConfirm: function(e, element){
        var infmid=$(element).parents('tr').attr('data-notice-id');
            $.post(
            ""+url+"/all_delInfo", 
            {
            infmid:infmid
            }, 
            function(res){
                if(res.zhi) {
                    findTData();
                } else {
                  commModal.alert({content:res.zhi});
                }
            }, 'json');
        }
    }); 
    
function delCurr(id){
	$.post(
		""+url+"/all_saveInfo",
		{
		infmid:id
		},
		function(data){
			findTData(1);
		});       
	   	
} 

function newCurr(id,type){
	if(type=="1"){
		 window.location.href=""+urlFile+"/detail.jsp?id="+id; 
	}else if(type=="4"){
		 window.location.href=""+urlFile+"/detail_homework.jsp?id="+id; 
	}
}
	 
 $(document).ready(function(){
 findTData();
});
</script> 

</body>
</html>