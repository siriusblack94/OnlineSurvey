<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="sessionUserLogin.jsp" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线调查系统登陆</title>
<meta name="description" content="你好">
<meta name="keywords" content="一星球">
<base href="<%=basePath%>">
<link href="css_files/bootstrap.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css_files/site-globe.css">
<link rel="stylesheet" type="text/css" href="css_files/oneplanet.css">
<script type="text/javascript" src="js/jquery-1.12.3.js"></script> 
<script type="text/javascript" src="js/myFunction.js"></script> 
 <script type="text/javascript">
		$(function(){
				$("#sub").click(function(){
					var username = document.getElementById("username").value.trim();
					var password = document.getElementById("password").value.trim();
					var spanvalid =document.getElementById("span-pass");
					
					var url = "user-valid";
					var args = {"username":username,"password":password,"time":new Date()};
					
						if(myFunction()){
							spanvalid.innerHTML = "";
							 $.ajax({
					             type: "post",
					             url: url,
					             data:args,
					             success: function(data){
					            	 if(data==0){
					            		 spanvalid.innerHTML = "<span style='font-size:15px; color:red;'>用户名或密码错误</span>";
										}else{
											window.location.href="<%=basePath%>front/mumberHome.jsp";
										}
						             }
							 });
							 }
		
					return false;
				});
		});  
</script>
	
</head>
<body>
<header class="navbar navbar-default">
  <div class="container">
    <div >
      <a class="navbar-brand" href="index.jsp"><img src="images/front/logo.png"></a></div>
    <nav class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
        <li><a href="index.jsp">首页</a></li>
        <li><a href="survey-list">问卷中心</a></li>
        <li><a href="front/mumberHome.jsp">我的账户</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
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
      <h3 class="text-center">会员入口</h3>
      <form name ="login" id="login"  method="post"  action="user-valid">
   
        <div class="form-group">
            <input id="username" class="form-control" type="text" name="username" maxlength="50" required="required" placeholder="请输入用户名" >
         	<p id="p-name"  style="color: red ;text-align:center; display:block">&nbsp;</p>
         	 <input id="password" class="form-control" type="password" name="password" maxlength="50" placeholder="请输入密码"  required="required" >
         	 <span id="span-pass"  style="color: red ;text-align:center; display:block">&nbsp;</span>
      		<span id="span-valid" style="color: red ;text-align:center; display:block">&nbsp;</span> 
        </div>
      <label>&nbsp;</label>
        <div class="row">
          <!-- <div class="col-md-7">
            <div class="form-group">
              <div class="checkbox">
                <label class="checkbox-inline">
                <input id="checkbox"  type="checkbox" name="remember" value="remember">
                下次自动登录</label>
              </div>
            </div>
          </div> -->
       <!--    <div class="col-md-5 text-right"> <a class="btn btn-link" href="front/recover">忘记密码</a> </div> -->
        </div>
        <button id="sub"    class="btn btn-success btn-block btn-lg"  type="submit" >登录</button>
        <p> <a href="front/register.jsp" class="pull-right">没有账号？立即注册</a> </p>
      </form>
   
   	<div >
      <h5 class="text-center">&nbsp;</h5>
    </div>
  </div>
</div>
</div>
<footer>
  <div class="container">
    <div class="row">
      <div class="weixin col-md-3"> <strong>关注微信</strong><img alt="weixin" src="images/front/weixin.png">
        <p>&nbsp;</p>
      </div>
    </div>
  </div>
  <div class="copyright">©2016 &nbsp;&nbsp;北信科版权所有 </div>
</footer>
</body>
</html>