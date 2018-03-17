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
<link rel="stylesheet" type="text/css" href="css_files/mystyle2.css">
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script> 
<script type="text/javascript" src="js/checkAnswer.js"></script> 

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
      <ul class="nav navbar-nav navbar-right nav-login">
        <li><a class="btn btn-green" href="front/login.jsp">登录</a></li>
        <li><a class="btn btn-blue" href="front/register.jsp">注册</a></li>
      </ul>
    </nav>
  </div>
</header>


<div class="content" >
	<div class="con" >
		<s:if  test="#request.survey == null ">
			<span style="text-align:center"><font color="red" size="30px" >问卷已被删除</font></span>
		</s:if>
		<s:else>
			<div style="margin-left: 10px;">
			<form action="answer-save" method="post" onsubmit="return checkAnswer()">
			
			
				<input type="hidden" value="${request.survey.sid }"   name="answerVO.sid">
				<input type="hidden" value="${request.survey.user.uid }"  name="answerVO.uid"  >
				<h1 align="center"><s:property value="#request.survey.surveyname"/></h1>
				
				<s:iterator value="#request.survey.questions"  status="status"> 
				
				<s:if test="qid != null">
					<input type="hidden" value="${qid }" name="answerVO.questions[<s:property value='#status.index'/>].qid">
					
					<s:if test="type == 'danxuan'" >
					<div class="ti xuanze danxuan">
						
						<input type="hidden" value="${type }" name="answerVO.questions[<s:property value='#status.index'/>].type" >

						<input type="text" value="0" class="tiData">
						<h3><s:property value="#status.count"/>   <s:property  value="title" />&nbsp;&nbsp;[单选题]</h3>
						<s:if test="A != ''">
						<h4>	<input  id="danxuan1" class="radio"  type="radio" name="answerVO.questions[<s:property value='#status.index'/>].result"  value="A" >A: 	<s:property  value="A" />	</h4>
						</s:if>
						<s:if test="B != ''">
						<h4>	<input id="danxuan2" class="radio"  type="radio" name="answerVO.questions[<s:property value='#status.index'/>].result"  value="B" >B: 	<s:property  value="B" />	</h4>
						</s:if>
						<s:if test="C != ''">
						<h4>	<input id="danxuan3" class="radio"  type="radio" name="answerVO.questions[<s:property value='#status.index'/>].result"  value="C" >C: 	<s:property  value="C" />	</h4>
						</s:if>
						<s:if test="D != ''">
						<h4>	<input id="danxuan4" class="radio"  type="radio" name="answerVO.questions[<s:property value='#status.index'/>].result"  value="D" >D: 	<s:property  value="D" />	</h4>
						</s:if>
					</div>
					</s:if>
					
				
				
					 <s:if test="type == 'duoxuan'" >
					 <div class="ti xuanze duoxuan">
					 <input type="text" value="0" class="tiData">	
						<input type="hidden" value="${type }" name="answerVO.questions[<s:property value='#status.index'/>].type" >
						<h3><s:property value="#status.count"/>   <s:property  value="title" />&nbsp;&nbsp;[多选题]</h3>
						<s:if test="A != ''">
						<h4>	<input id="duoxuana" class="radio"  type="checkbox" name="answerVO.questions[<s:property value='#status.index'/>].a"  value="A" >A: 	<s:property  value="A" />	</h4>
						</s:if>
						<s:if test="B != ''">
						<h4>	<input id="duoxuanb" class="radio"  type="checkbox" name="answerVO.questions[<s:property value='#status.index'/>].b"  value="B" >B: 	<s:property  value="B" />	</h4>
						</s:if>
						<s:if test="C != ''">
						<h4>	<input id="duoxuanc" class="radio"  type="checkbox" name="answerVO.questions[<s:property value='#status.index'/>].c"  value="C" >C: 	<s:property  value="C" />	</h4>
						</s:if>
						<s:if test="D != ''">
						<h4>	<input id="duoxuand"  class="radio"  type="checkbox" name="answerVO.questions[<s:property value='#status.index'/>].d"  value="D" >D: 	<s:property  value="D" />	</h4>
						</s:if>
					</div>
					</s:if>
							
				
				
					<s:if test="type == 'jianda'" >
					<div class="ti jianda">
						<input type="hidden" value="${type }" name="answerVO.questions[<s:property value='#status.index'/>].type" >
						<h3><s:property value="#status.count"/>   <s:property  value="title" /> &nbsp;&nbsp;[简答题]</h3>
						<h4><s:textarea  id="jianda"   class="jianda"   name="answerVO.questions[%{#status.index}].result"  >  </s:textarea><h4>
					</div>
					</s:if> 
					
				</s:if>
				</s:iterator>
			
			<div class="inputsub">
				  <input type="submit" value="提交" class="sub" >
			</div> 
			</form>
			</div>	
		</s:else>



	</div>
</div>


</body>
</html>