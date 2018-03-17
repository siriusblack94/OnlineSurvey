<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page isELIgnored="false"%>
 <%@include file="sessionUserSon.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线调查系统问卷列表</title>
<base href="<%=basePath%>">
<script type="text/javascript" src="js/jquery-1.12.3.js"></script> 
<link rel="stylesheet" type="text/css" media="screen" href="css_files/css-table.css" />
<script type="text/javascript" src="js/style-table.js"></script>
<script type="text/javascript">
		$(function(){
				$(".delete").click(function(){
					var surveyname= $(this).next(":hidden").val();
					var flag = confirm("确定要删除问卷:"+ surveyname +"？");
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
<s:if  test="#request.usList == null || #request.usList.size()==0">
<font color="red" size="30px">没有问卷信息</font>
</s:if>
<s:else>
<table border="1" align="center"  id="travel">
	<caption>发布的问卷信息如下</caption>
	 <thead> 
		<!-- <td>问卷ID</td>
		<td>问卷名称</td>
		<td>创建时间</td>
		<td>发布状态</td>
		<td>处理</td> -->
		<tr>
            <th scope="row">问卷ID</th>
            <th scope="row">问卷名称</th>
            <th scope="row">创建时间</th>
            <th scope="row">发布状态</th>
            <th scope="row">处理</th>
           
        </tr>        
	</thead>
	
	<s:iterator value="#request.usList">
	 <tbody>
	<tr>
		<td><s:property value="sid"/></td>
		<td><s:property value="surveyname"/></td>
		<td><s:date name="createTime" format="yyyy-MM-dd hh:mm:ss"/></td>
		<%-- <td><s:property value="state"/></td> --%>
		<td>${state}</td>
		
			
		<th>
			<a href="survey-delete?sid=${sid}"  class="delete">删除</a>
			<input name="delete" type="hidden" value="${surveyname}">
		</th>
	</tr>
	 </tbody>
	</s:iterator>
	
</table>
</s:else>
</body>
</html>