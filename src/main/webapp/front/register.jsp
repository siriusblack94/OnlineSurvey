<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="sessionUserLogin.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线调查系统注册</title>
<meta name="description" content="你好">
<meta name="keywords" content="一星球">
<base href="<%=basePath%>">
<link href="css_files/bootstrap.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css_files/site-globe.css">
<link rel="stylesheet" type="text/css" href="css_files/oneplanet.css">
<script type="text/javascript" src="js/checkUserRigester.js"></script> 
</head>
<body>
<header class="navbar navbar-default">
  <div class="container">
    <div> 
      <a class="navbar-brand" href="index.jsp"><img src="images/front/logo.png"></a></div>
     <nav class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
        <li><a href="index.jsp">首页</a></li>
        <li><a href="survey-list">问卷中心</a></li>
        <li><a href="front/mumberHome.jsp">我的账户</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right ">
        <li><a class="btn btn-green" href="front/login.jsp">登录</a></li>
        <li><a class="btn btn-blue" href="front/register.jsp">注册</a></li>
      </ul>
    </nav>
  </div>
</header>
<div class="container">
  <div class="header">
    <h4 class="text-center text-muted">在线调查系统</h4>
  </div>
  <div class="login-layout">
    <div class="stage">
      <h3 class="text-center">注册新用户</h3>
      <form name = "register" id="register" action="user-add" method="post" onSubmit="return checkUserRigester()">
      
        <div class="form-group">
            <input id="username" class="form-control" type="text" name="userdto.username" maxlength="50" placeholder="请输入用户名" required="required">
            <label >&nbsp;</label>
         	 <input id="password" class="form-control" type="password" name="userdto.password" maxlength="50" placeholder="请输入密码" required="required">
           <label >&nbsp;</label>
         	 <input id="confirmpassword"  class="form-control" type="password" name="userdto.confirmpassword" maxlength="50" placeholder="请输入确认密码" required="required" >
            <label >&nbsp;</label>
         	 <input id="email"  class="form-control" type="text" name="userdto.email" maxlength="50" placeholder="请输入email,可选项" >
         	<span id="msg" style='font-size:15px; color:red;'></span>
        </div>
       	 
        <p>&nbsp;</p>
     		<button class="btn btn-success btn-block btn-lg" name= "bncreat" type="submit"  >创建用户</button>        
        <p> <a href="front/login.jsp" class="pull-right">已有账户，马上登录</a> </p>
      </form>
    </div>
    <div >
      <h5 class="text-center">&nbsp;</h5>
    </div>
  </div>
</div>
<footer>
  <div class="container">
    <div class="row">
      <div class="weixin col-md-3"> <strong>关注微信</strong>
      <img alt="weixin" src="images/front/weixin.png">
        <p></p>
      </div>
    </div>
  </div>
  <div class="copyright">©2016 &nbsp;&nbsp;北信科版权所有 </div>
</footer>
</body>
</html>
