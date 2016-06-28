<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta name="force-rendering" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge;chrome=1">
<title>登录</title>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/pycms/files/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="http://localhost:8080/pycms/files/css/login.css">

<script language='javascript'>
function doSubmit()
{


	var UserName = document.getElementById("username").value;
	var Password = document.getElementById("password").value;
	if(UserName=="")
	{
		alert("请输入用户名");
		return;
	}
	if(Password=="")
	{
		alert("请输入密码");
		return;
	}

	document.form1.submit();
}
</script>

</head>
<body>
<div id="wrapper">
<div class="container">
    <form name="form1" class="form-signin" role="form" action="mcservices" method="post">
        <h2 class="form-signin-heading">请登录</h2>
        <input id="username" name="username" type="text" class="form-control" placeholder="用户名" value="" required autofocus>
        <input id="password" name="password" type="password" class="form-control" placeholder="密码" value="" required>
                <div class="checkbox">
            <label>
                <input name="remember" type="checkbox"  value="remember-me"> 记住我
            </label>
            <span class="error-msg"></span>
        </div>
        <button  class="btn btn-lg btn-primary btn-block" data-loading-text="登录中…" type="submit" onclick="doSubmit();">登录</button>
    </form>
</div>
</div>
<script type="text/javascript" src="http://localhost:8080/pycms/files/js/jquery.min.js"></script>
<script type="text/javascript" src="http://localhost:8080/pycms/files/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://localhost:8080/pycms/files/js/bootstrap-growl.js"></script>
<script type="text/javascript" src="http://localhost:8080/pycms/files/js/login.js"></script>
</body>
</html>