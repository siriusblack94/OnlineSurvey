<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线调查系统</title>
<meta name="description" content="你好">
<meta name="keywords" content="一星球">
<base href="<%=basePath%>">
<link href="css_files/bootstrap.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css_files/site-globe.css">
<link rel="stylesheet" type="text/css" href="css_files/oneplanet.css">
</head>
<body>
<header class="navbar navbar-default">
  <div class="container">
    <div class="navbar-header">
      <a class="navbar-brand" href="index.jsp"><img src="images/front/logo.png"></a></div>
    <nav class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
       
        <li><a href="survey-list">问卷中心</a></li>
        <li><a href="front/mumberHome.jsp">我的账户</a></li>
        <!-- <li><a href="cases">更多功能</a></li> -->
      </ul>
      <ul class="nav navbar-nav navbar-right nav-login">
        <li><a class="btn btn-green" href="front/login.jsp">登录</a></li>
        <li><a class="btn btn-blue" href="front/register.jsp">注册</a></li>
      </ul>
    </nav>
  </div>
</header>
<iframe name="target_area"  style="height:750px; width:100%" src="front/hello.html" frameborder="0" scrolling="no" ></iframe>
<footer style="margin-top:0px;">
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
