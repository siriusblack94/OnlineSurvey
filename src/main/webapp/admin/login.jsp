<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="sessionAdminLogin.jsp" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<title>后台管理入口</title>
<base href="<%=basePath%>admin/">
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<meta name="keywords" content="一星球在线调查系统">
<meta name="discription" content="一星球在线调查系统">
<link rel="stylesheet" type="text/css" href="../css_files/common.css" />
<link rel="stylesheet" type="text/css" href="../css_files/system.css" />
<script type="text/javascript" src="../js/jquery-1.12.3.js"></script> 
<script type="text/javascript" src="../js/checkadmin.js"></script> 
 <script type="text/javascript">
	$(function(){
		$(".btn").click(function(){
		
			var user = document.getElementById("user").value.trim();
			var pass = document.getElementById("pass").value.trim();
			var msg = document.getElementById("spanpa");
			var url = "admin-valid";
			var args = {"admin.name":user,"admin.pass":pass,"time":new Date()};
			 
				if(myFunction()){
					msg.innerHTML = "";
					
					 $.ajax({
			             type: "post",
			             url: url,
			             data:args,
			             success: function(data){
			            	 if(data==0){
			            		 msg.innerHTML = "<span style='font-size:15px; color:red;'>用户名或密码错误</span>";
								}else{
									window.location.href="<%=basePath%>admin/main.jsp";
								}
				            }
					 });
					 }

			return false;
		});
});     
</script>
</head>
<body id="loginpage">
	<div id="login" class="clearfix">
		<div class="main clearfix">
			<div class="logbox">
				<div class="header">
					<p style="text-align:center"> 一星球在线调查系统</p>
				</div>
				<div class="web_login" id="web_login">
					<form id="loginform"  name="loginform" action="" method="post" target="_self">
						<div class="inputOuter">
                            <input type="text" class="inputstyle" id="user" name="admin.name" value="" tabindex="1">
                        </div>
						<div class="inputOuter">
                            <input type="password" class="inputstyle password" id="pass" name="admin.pass" value="" maxlength="16" tabindex="2"> 
                      		 <span id="spanpa" style='font-size:15px; color:red;'> </span>
                        </div>
                        
                        <div class="submit">	
	                        <a class="login_button" href="">
	                            <input type="submit" tabindex="6" value="登 录" class="btn" id="btn">
	                        </a>
                        </div>
					</form>	
				</div>
				<!-- <a style="float:right;font-size:15px;color:grad;" href="">重置密码</a> -->
			</div>
			
		</div>
	</div>
</body>
</html>
