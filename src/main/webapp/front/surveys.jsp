<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
	<%@ page isELIgnored="false"%>
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
<link rel="stylesheet" type="text/css" href="css_files/mystyle.css">
</head>
<body> 
<header class="navbar navbar-default">
  <div class="container">
    <div class="navbar-header">
      <a class="navbar-brand" href="index.jsp"><img src="images/front/logo.png"></a></div>
    <nav class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
       <li><a href="index.jsp">首页</a></li>
        <li><a href="survey-list">问卷中心</a></li>
        <li><a href="front/mumberHome.jsp">我的账户</a></li>
        <!-- <li><a href="cases">更多功能</a></li> -->
      </ul>
      
     <s:if test="#session.user != null ">
     
      </s:if><s:else>
       <ul class="nav navbar-nav navbar-right nav-login">
        <li><a class="btn btn-green" href="front/login.jsp">登录</a></li>
        <li><a class="btn btn-blue" href="front/register.jsp">注册</a></li>
      </ul>
      </s:else>
    </nav>
  </div>
</header>


<div class="content" >
	<div class="con" >
			<s:if  test="#request.surveys == null || #request.surveys.size()==0">
			<span style="text-align:center"><font color="red" size="30px" >目前没有发布问卷信息</font></span>
			</s:if>
			<s:else>
			<table border="1"   class="tab">
				
				<s:iterator value="#request.surveys">
				<tr>
					<td class="td1"   >问卷名称：</td>
					<td class="td2"><s:property value="surveyname"/></td>
					
					
					
						
					<td class="td3"> 
						<a href="survey-findByID?sid=${sid }"  class="answer">接受调查</a>
						
					</td>
					
					
				</tr>
				</s:iterator>
			
			</table>
			
			</s:else>



	</div>
</div>
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