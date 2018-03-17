<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page isELIgnored="false"%>
 <%@include file="sessionAdminSon.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>账户列表</title>
<base href="<%=basePath%>admin/">
<script type="text/javascript" src="../js/jquery-1.12.3.js"></script> 
<script type="text/javascript">
		$(function(){
				$(".delete").click(function(){
					var username= $(this).next(":hidden").val();
					var flag = confirm("确定要删除用户:"+ username +"？");
						if(flag){
							var $tr = $(this).parent().parent();
							var url = this.href;
							var args = {"time":new Date()};
							$.post(url,args,function(data){
									if(data==1){
										alert("删除成功");
										$tr.remove();
									}else{
										alert("删除失败");
									}
								});	
						}
					return false;
				});
		})
</script>
</head>
<body>
<s:if  test="#request.users == null || #request.users.size()==0">
<font color="red" size="30px">没有用户信息</font>
</s:if>
<s:else>
<table border="1" align="center">
	<tr>
		<td>用户ID</td>
		<td>用户名</td>
		<td>email</td>
		<td>创建时间</td>
		<td>昵称</td>
		<td>处理</td>
	</tr>
	<s:iterator value="#request.users"  >
	<tr>
		<td><s:property value="uid"/></td>
		<td><s:property value="username"/></td>
		<td><s:property value="email"/></td>
		<td>
		<s:date name="createtime" format="yyyy-MM-dd hh:mm:ss"/>
		</td>
		<td>${nickname}</td>	<%-- <s:property value="nickname"/> --%>
		<td>
			<a href="user-delete?uid=${uid}"  class="delete">  删除</a>
			<input name="delete" type="hidden" value="${username}">
		</td>
		
	</tr>
	</s:iterator>
</table>
</s:else>
</body>
</html>