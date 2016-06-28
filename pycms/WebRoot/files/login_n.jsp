<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html lang="zh-CN">
<head>
<title>登录</title>
<link rel="stylesheet" type="text/css" href="http://static.peiyu100.com/pycms/css/bootstrap.min.css?v=1444881081">
<link rel="stylesheet" type="text/css" href="http://static.peiyu100.com/pycms/css/login.css?v=1444881081"></head>


</head>

<body>
<div id="wrapper">
<div class="container">
    <form name="form1" class="form-signin" role="form" action="mcservices.do" method="post">
        <h2 align="left" class="form-signin-heading">请登录</h2>
        <p align="left">
          <input id="username" name="username" type="text" class="form-control" placeholder="用户名" value="" required autofocus>
 </p>
        <p>         
          <input id="password" name="password" type="password" class="form-control" placeholder="密码" value="" required>
        </p>
      <div class="checkbox">
            <label>
                <input name="remember" type="checkbox"  value="remember-me"> 记住我            </label>
            <span class="error-msg"></span> </div>
        <button  type="button"   onclick="doSubmit();" >登录</button>
    </form>
</div>
</div>
</body>
</html>
<script language='javascript'>
function doSubmit()
{
alert("1");
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