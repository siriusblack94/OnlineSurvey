<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@include file="sessionUser.jsp" %>
    <%@ page isELIgnored="false"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
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
<link rel="stylesheet" type="text/css" href="css_files/bootstrap-combined.min.css" rel="stylesheet" media="screen">
<link rel="stylesheet" type="text/css" href="css_files/oneplanet.css">
</head>
<body>
<script type="text/javascript" language="javascript">   
function iFrameHeight() {   
var ifm= document.getElementById("iframepage");   
var subWeb = document.frames ? document.frames["iframepage"].document : ifm.contentDocument;   
if(ifm != null && subWeb != null) {
   ifm.height = subWeb.body.scrollHeight;
   ifm.width = subWeb.body.scrollWidth;
}   
}   
</script>
<header class="navbar navbar-default">
  <div class="container">
    <div class="navbar-header">
      <a class="navbar-brand" href="<%=basePath%>"><img src="images/front/logo.png"></a></div>
    <nav class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
        <li><a href="<%=basePath%>">首页</a></li>
        <li><a href="survey-list">问卷中心</a></li>
        <li><a href="front/mumberHome.jsp">我的账户</a></li>
        
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li ><font size=""   color="green">欢迎:&nbsp;<s:property value="#session.user.username"/></font></li>
        <li>&nbsp;</li>
        <li><a style="color: blue "  href="user-remove">注销</a></li>
      </ul>  
    </nav>
  </div>
</header>
<div style="min">
<div class="container-fluid" id="LG">
	<div class="row-fluid">
		<div class="span15">
			<div class="row-fluid">
				<div class="span2">
					<ul class="nav nav-list">
						<li class="color">
							<strong>账户中心</strong>
						</li>
						<li >
						<a   href="front/userModify.jsp" target="target_area">&nbsp;&nbsp;个人信息</a>
						</li>
						
						<li>
							<a href="front/changePassword.jsp" target="target_area">&nbsp;&nbsp;修改登录密码</a>
						</li>
						<li class="color">
							<strong>我的问卷</strong>
						</li>
						
						<li>
							<a href="survey-find" target="target_area">&nbsp;&nbsp;我发布的问卷信息</a>
						</li>
						
						<li>
							<a href="front/createSurvey.jsp" target="target_area">&nbsp;&nbsp;创建并发布问卷</a>
						</li>
						
						<li>
							<a href="survey-findPublished" target="target_area">&nbsp;&nbsp;发布问卷结果统计</a>
						</li>
						
						<li>
						<!-- 	<a href="#" target="target_area">&nbsp;&nbsp;草稿箱</a> -->
						</li>
						
						<li class="divider" >
						</li>
						<li class="help">
							<a href="images/front/bangzhu.png">帮助</a>
						</li>
					</ul>
				</div>
				<div class="span10">
				<iframe name="target_area"    frameborder="0" scrolling="yes"  onLoad="iFrameHeight()"  class="ifra"  src="front/hello.html" ></iframe>
				</div>
			</div>
		</div>  
	</div>
</div></div>

</body>
</html>