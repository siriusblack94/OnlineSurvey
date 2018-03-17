<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page isELIgnored="false"%>
 <%@include file="sessionAdminSon.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加用户</title>
<base href="<%=basePath%>admin/">
<script type="text/javascript" src="../js/checkUserAdd.js"></script> 
</head>
<body>
<s:form action="user-add"  method="post">
	<s:textfield id="username" name="userdto.username" label="用户名"></s:textfield>
	<s:textfield id="password" name="userdto.password" label="用户密码"></s:textfield>
	<s:textfield id="email"  name="userdto.email" label="用户邮箱"></s:textfield>
	<s:textfield name="userdto.nickname" label="用户昵称"></s:textfield>
	<span id="msg" style='font-size:15px; color:red;'></span>
	<s:submit onclick="return checkUserAdd()" value="提交"></s:submit>

</s:form>
</body>
</html>