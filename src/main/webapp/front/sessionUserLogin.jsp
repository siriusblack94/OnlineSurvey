   <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.bistu.survey.entities.*" %>
    <%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

    User u = (User)session.getAttribute("user");
    if(u != null){
		response.sendRedirect(basePath+"front/mumberHome.jsp");
    	return;
    }
    %>
