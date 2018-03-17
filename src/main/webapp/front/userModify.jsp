<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@include file="sessionUserSon.jsp" %>
    <%@ page isELIgnored="false"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>一星球问卷调查系统</title>
<base href="<%=basePath%>">
<link href="css_files/bootstrap.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css_files/oneplanet.css">
</head>
<body>
<div style="width: 1500px;margin: 20px;  ">
<form class="form-horizontal"  action="user-modify" method="post">
<input type ="hidden" name="action" value="modify">
  <div class="form-group">
    <label class="col-sm-2 control-label">用户名：</label>
    <div class="col-sm-8">
    <input name="user.username" type="text"  id="username" readonly="readonly" class="name-input" value="${session.user.username}">
      <p class="form-control-static"></p>
    </div>
  </div>
  <div class="form-group">
    <label  class="col-sm-2 control-label">E-mail：</label>
    <div class="col-sm-8">
      <input name="user.email" type="email" id="email" placeholder="请输入E-mail" class="name-input"  value="${session.user.email}">
    <p class="form-control-static"></p>
    </div></div>
     <div class="form-group">
    <label  class="col-sm-2 control-label">昵称&nbsp;&nbsp;：</label>
    <div class="col-sm-8">
      <input name="user.nickname" type="text" id="nickname" placeholder="请输入昵称" class="name-input" value="${session.user.nickname}">
    <p class="form-control-static"></p>
    </div>
  </div>
  <div class="form-group">
   <label  class="col-sm-2 control-label"></label>
    <div class="col-sm-8">
     <input type="submit" name="btnsubmit" value="保存"  id="btnsubmit"
                            class="btn btn-default" >
                       <span><s:property value="#request.msg"/></span>
    </div>
  </div>
</form>

</div>
</body>
</html>