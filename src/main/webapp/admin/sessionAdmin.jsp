   <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.bistu.survey.entities.*" %>
    <%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

    Admin admin = (Admin)session.getAttribute("admin");
    if(admin == null){
    	%>
    	<script>
    	alert('对不起,请登录');
    	window.location='<%=basePath%>admin/login.jsp' 
       </script>
    	<% 
    	return;
    }
    %>
    
