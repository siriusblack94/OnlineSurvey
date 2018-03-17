<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
  <%@include file="sessionUserSon.jsp" %>
    <%@ page isELIgnored="false"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改用户密码</title>
<base href="<%=basePath%>">
<link href="css_files/bootstrap.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css_files/oneplanet.css">
<script type="text/javascript" src="js/jquery-1.12.3.js"></script> 
<script type="text/javascript" src="js/checkPass.js"></script> 
 <script type="text/javascript">
		$(function(){
				$(".btn").click(function(){
					var pass = document.getElementById("password").value.trim();
					var pass1 = document.getElementById("password1").value.trim();
				    var msg = document.getElementById("spanpa");
				
					var url = "user-changePass";
					var args = {"uservo.oldPass":pass,"uservo.Pass":pass1,"time":new Date()};
					
						if(myFunction()){
							msg.innerHTML = "";
							 $.ajax({
					             type: "post",
					             url: url,
					             data:args,
					             success: function(data){
					            		 if(data==0){
					            		 msg.innerHTML = "<span style='font-size:15px; color:red;'>原密码不正确</span>";
										} 
										if(data==1)
										{
											 msg.innerHTML = "<span style='font-size:15px; color:red;'>密码修改成功</span>";
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
<div style="width: 1500px;margin: 20px; " >
<form class="form-horizontal"  method="post" >
<input type ="hidden" name="action" value="modify">
  <div class="form-group">
    <label class="col-sm-2 control-label">原密码：</label>
    <div class="col-sm-8">
    <input name="uservo.oldPass" type="password"  id="password"  placeholder="请输入原密码,区分大小写"  class="name-input" >
      <p class="form-control-static"></p>
    </div>
  </div>
  <div class="form-group">
    <label  class="col-sm-2 control-label">新密码：</label>
    <div class="col-sm-8">
      <input name="uservo.Pass" type="password" id="password1" placeholder="请输入新密码,区分大小写" class="name-input"  >
    <p class="form-control-static"></p>
    </div></div>
     <div class="form-group">
    <label  class="col-sm-2 control-label">确认新密码：</label>
    <div class="col-sm-8">
      <input name="uservoconfirmPass" type="password" id="password2" placeholder="请输入确认密码,区分大小写" class="name-input" >
    <p class="form-control-static"></p>
    <span id="spanpa" style='font-size:15px; color:red;'> </span>
    </div>
  </div>
  <div class="form-group">
   <label  class="col-sm-2 control-label"></label>
    <div class="col-sm-9">
     <input type="submit" name="btnsubmit" value="保存"  id="btn"
                            class="btn btn-default" >
    </div>
  </div>
</form>

</div>
</body>
</html>