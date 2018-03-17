<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
     <%@ page isELIgnored="false"%>
     <%@include file="sessionAdmin.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>后台管理主页</title>
<base href="<%=basePath%>admin/">
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<meta name="keywords" content="在线调查系统">
<meta name="discription" content="在线调查系统">
<link rel="stylesheet" type="text/css" href="../css_files/common.css" />
<link rel="stylesheet" type="text/css" href="../css_files/system.css" />

<script type="text/javascript" language="javascript">   
function iFrameHeight() {   
var ifm= document.getElementById("iframepage");   
var subWeb = document.frames ? document.frames["iframepage"].document : ifm.contentDocument;   
if(ifm != null && subWeb != null) {
   ifm.height = subWeb.body.scrollHeight;
   
}   
}   
</script>
</head>
<body id="sysmain">
	<div class="content">
		<div class="syshead">
			<div class="clearfix">
				<p class="left"><font size="5px" color="green" >一星球在线调查系统</font></p>
				<p class="right"><span style="color: blue">管理员:</span>
				<font size="5px" color="green" >${session.admin.name }</font>
				<a class="outsys" title="退出系统" href="admin-remove" style=" color: black">
				<img src="../images/admin/quit.gif" width="16" height="16"  />退出</a></p>
			</div>
		</div>
		<div class="sysmain clearfix">
			<div class="sysmenua">
				<ul>
					<li><a href="user-list" target="target_area">管理用户信息</a></li>
					<li><a href="user-add.jsp" target="target_area">添加用户</a></li>
					<li><a href="survey-list" target="target_area">管理问卷信息</a></li>
					<li><a href="survey-add" target="target_area">添加问卷</a></li>
					<li><a href="count" target="target_area">统计</a></li>
				</ul>
			</div>
			
			<div class="sysinfo">
			
				<iframe name="target_area" width="80%" id="iframepage" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"     onLoad="iFrameHeight()">
 				</iframe>
			</div> 
		</div>
	</div>


</body>
</html>
<a href="user-list">管理用户信息</a>
<a href="user-add">添加用户</a>
<a href="survey-list">管理问卷信息</a>
<a href="survey-add">添加问卷</a>

</body>
</html>