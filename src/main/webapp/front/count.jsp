<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
	<%@ page isELIgnored="false"%>
<%@include file="sessionUserSon.jsp" %>
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
<script type="text/javascript" src="js/jquery-1.12.3.js"></script> 

</head>
<body> 


<div >
	<div class="con" >
		<s:if  test="#request.surveyAnswer == null ">
			<div>
			<span style="text-align:center"><font color="red" size="30px" >问卷不存在</font></span>
			</div>
		</s:if>
		<s:else>
			<div style="margin-left:10px;">
				
				<h1 align="center"><s:property value="#request.surveyAnswer.surveyname"/>(结果统计)</h1>
				<s:if test="request.surveyAnswer.number==null||request.surveyAnswer.number==0">
				<div style="text-align:center">
				<h2 ><font color="blue">目前无人接受该问卷的调查</font></h2>
				</div>
						<s:iterator value="#request.surveyAnswer.questionAnswers"  status="status">  
						
						<s:if test="qid != null">
							
							<s:if test="type == 'danxuan'" >
							<div >
		
								<h3><s:property value="#status.count"/>   <s:property  value="title" />&nbsp;&nbsp;[单选题]</h3>
								<s:if test="A != ''">
								<h4>	A: 	<s:property  value="A" />	</h4>
								</s:if>
								<s:if test="B != ''">                                     
								<h4>    B: 	<s:property  value="B" />	</h4>
								</s:if>                                                   
								<s:if test="C != ''">                                     
								<h4>	C: 	<s:property  value="C" />	</h4>
								</s:if>                                                   
								<s:if test="D != ''">                                     
								<h4>	D: 	<s:property  value="D" />	</h4>
								</s:if>
							</div>
							</s:if>
							
						
						
							 <s:if test="type == 'duoxuan'" >
							 <div>
								<h3><s:property value="#status.count"/>   <s:property  value="title" />&nbsp;&nbsp;[多选题]</h3>
								<s:if test="A != ''">
								<h4>	A: 	<s:property  value="A" />	</h4>
								</s:if>
								<s:if test="B != ''">
								<h4>	B: 	<s:property  value="B" />	</h4>
								</s:if>
								<s:if test="C != ''">
								<h4>	C: 	<s:property  value="C" />	</h4>
								</s:if>
								<s:if test="D != ''">
								<h4>	D: 	<s:property  value="D" />	</h4>
								</s:if>
							</div>
							</s:if>
									
						
						
							<s:if test="type == 'jianda'" >
							<div>
								<h3><s:property value="#status.count"/>   <s:property  value="title" /> &nbsp;&nbsp;[简答题]</h3>
							</div>
							</s:if> 
							
						</s:if>
						</s:iterator>
						
				
				
				
				</s:if>
				
				
				
				<s:else>
				<%-- <s:debug></s:debug> --%>
				<div style="text-align:center">
				<h2 ><font color="blue">目前接受该问卷调查的人数为：<strong class="strong"><s:property  value="request.surveyAnswer.number" /></strong> </font></h2>
				
				</div>
				
					
				<s:iterator value="#request.surveyAnswer.questionAnswers"  status="status"> 
			
				<s:if test="qid != null">
					<s:if test="type == 'danxuan'" >
					<div>
						<h3><s:property value="#status.count"/>  : <s:property  value="title" />&nbsp;&nbsp;[单选题]</h3>
								<s:if test="A != ''">
						
								<h4> <s:property  value="A" /> 有 	<s:property  value="ANum" />人 </h4>
						</s:if>	
						<s:if test="B != ''">
						
								<h4> 	<s:property  value="B" />有 <s:property  value="BNum" />人 </h4>
						</s:if>	
						<s:if test="C != ''">
						
								<h4> 	选择<s:property  value="C" /> 有<s:property  value="CNum" />人 </h4>
						</s:if>
						<s:if test="D!= ''">
						
								<h4> <s:property  value="D" /> 	有<s:property  value="DNum" />人 </h4>
								</s:if>			
					 
						
						<h4 align="right" class="h4">所选人数&emsp;&emsp;&emsp;&nbsp; &emsp;&nbsp; 百分比</h4>
						<div >
							
							<s:if test="A != ''">
							<div class="divall">
								<div class="div1" >
								<h4>A: 	<s:property  value="A" /> </h4>
								</div>
								
								<div class="div2" >
								<h4 >
								
								<s:text name="format.number"  >
									<s:param value="ANum"></s:param> 
								</s:text>
								 &emsp;&emsp;&emsp;&nbsp; &emsp;  &emsp;     &emsp;       
								<s:text name="format.percent" >
									<s:param value="APercent"></s:param>  
								</s:text>
								</h4>
								</div>
								
							</div>
							<hr class="hr" > 
							</s:if>
						
							<s:if test="B != ''">
							<div class="divall"> 
								<div class="div1" >
								<h4>B: 	<s:property  value="B" /> </h4>
								</div>
								<div class="div2" >
									<h4>
									<s:text name="format.number"  >
									<s:param value="BNum"></s:param> 
									</s:text>
									 &emsp;&emsp;&emsp;&nbsp; &emsp;  &emsp;    &emsp;        
									<s:text name="format.percent" >
										<s:param value="BPercent"></s:param>  
									</s:text>
									</h4>
									</div>
							</div>
							<hr class="hr"> 
							</s:if>
						
							<s:if test="C != ''">
							<div class="divall"> 
								<div class="div1" >
								<h4>C: 	<s:property  value="C" /> </h4>
								</div>
								<div class="div2" >
									<h4>
									<s:text name="format.number"  >
									<s:param value="CNum"></s:param> 
									</s:text>
									 &emsp;&emsp;&emsp;&nbsp; &emsp;  &emsp;  &emsp;          
									<s:text name="format.percent" >
										<s:param value="CPercent"></s:param>  
									</s:text>
									</h4>
									</div>
							</div>
							<hr class="hr"> 
							</s:if>
						
							
							<s:if test="D != ''">
							<div class="divall"> 
								<div class="div1" >
								<h4>D: 	<s:property  value="D" /> </h4>
								</div>
								<div class="div2" >
									<h4>
									<s:text name="format.number"  >
									<s:param value="DNum"></s:param> 
									</s:text>
									 &emsp;&emsp;&emsp;&nbsp; &emsp;  &emsp;      &emsp;      
									<s:text name="format.percent" >
										<s:param value="DPercent"></s:param>  
									</s:text>
									</h4>
									</div>
							</div>
							<hr class="hr"> 
							</s:if>
							
						</div>	
					
					
					
					</div>
					</s:if>
					
					 <s:if test="type == 'duoxuan'" >
					 <div>
					 	
					 
					 
					 
						<h3><s:property value="#status.count"/>  : <s:property  value="title" />&nbsp;&nbsp;[多选题]</h3>
						<s:if test="A != ''">
						
								<h4> <s:property  value="A" /> 有 	<s:property  value="ANum" />人 </h4>
						</s:if>	
						<s:if test="B != ''">
						
								<h4> 	<s:property  value="B" /> <s:property  value="BNum" />人 </h4>
						</s:if>	
						<s:if test="C != ''">
						
								<h4> 	选择<s:property  value="C" /> <s:property  value="CNum" />人 </h4>
						</s:if>
						<s:if test="D!= ''">
						
								<h4> <s:property  value="D" /> 	<s:property  value="DNum" />人 </h4>
								</s:if>			
					 
						<h3 align="center" class="h3">其中选择
						<strong class="strong">
						<s:iterator value="#request.surveyAnswer.questionAnswers[#status.index].max">
						<s:property/>,
						</s:iterator>
						</strong>
						人数最多，有
						<strong class="strong"><s:property value="maxNum"/></strong>
						人，
						所占百分比为<strong class="strong">
						<s:text name="format.percent" >
							<s:param value="maxPercent"></s:param>  
						</s:text>
						</strong>
						</h3>
						<h3 align="center" class="h3">选择
						<strong class="strong">
						<s:iterator value="#request.surveyAnswer.questionAnswers[#status.index].min">
						<s:property/>,
						</s:iterator>
						</strong>
						
						人最少，有
						<strong class="strong"><s:property value="minNum"/></strong>
						人，
						所占百分比为<strong class="strong">
						<s:text name="format.percent" >
										<s:param value="minPercent"></s:param>  
									</s:text>
						</strong>
						</h3>
						
						
						<h4 align="right" class="h4">所选人数&emsp;&emsp;&emsp;&nbsp; &emsp;&nbsp;  百分比</h4>
						
						<div >
							<s:if test="A != ''">
							<div class="divall">
								<div class="div1" >
								<h4>A: 	<s:property  value="A" /> </h4>
								</div>
								
								<div class="div2" >
								<h4>
								<s:text name="format.number"  >
									<s:param value="ANum"></s:param> 
									</s:text>
									 &emsp;&emsp;&emsp;&nbsp; &emsp;  &emsp;  &emsp;          
									<s:text name="format.percent" >
										<s:param value="APercent"></s:param>  
									</s:text>
								</h4>
								</div>
								
							</div>
							<hr class="hr" > 
							</s:if>
						
							<s:if test="B != ''">
							<div class="divall"> 
								<div class="div1" >
								<h4>B: 	<s:property  value="B" /> </h4>
								</div>
								<div class="div2" >
									<h4>
									<s:text name="format.number"  >
									<s:param value="BNum"></s:param> 
									</s:text>
									 &emsp;&emsp;&emsp;&nbsp; &emsp;  &emsp;     &emsp;       
									<s:text name="format.percent" >
										<s:param value="BPercent"></s:param>  
									</s:text>
									</h4>
									</div>
							</div>
							<hr class="hr"> 
							</s:if>
						
							<s:if test="C != ''">
							<div class="divall"> 
								<div class="div1" >
								<h4>C: 	<s:property  value="C" /> </h4>
								</div>
								<div class="div2" >
									<h4>
									<s:text name="format.number"  >
									<s:param value="CNum"></s:param> 
									</s:text>
									 &emsp;&emsp;&emsp;&nbsp; &emsp;  &emsp;     &emsp;       
									<s:text name="format.percent" >
										<s:param value="DPercent"></s:param>  
									</s:text>
									</h4>
									</div>
							</div>
							<hr class="hr"> 
							</s:if>
						
							
							<s:if test="D != ''">
							<div class="divall"> 
								<div class="div1" >
								<h4>D: 	<s:property  value="D" /> </h4>
								</div>
								<div class="div2" >
									<h4>
									<s:text name="format.number"  >
									<s:param value="DNum"></s:param> 
									</s:text>
									 &emsp;&emsp;&emsp;&nbsp; &emsp;  &emsp; &emsp;           
									<s:text name="format.percent" >
										<s:param value="DPercent"></s:param>  
									</s:text>
									</h4>
									</div>
							</div>
							<hr class="hr"> 
							</s:if>
							
						</div>	
						
						
						
						
						
					</div>
					</s:if>
				
					<s:if test="type == 'jianda'" >
						
						<h3><s:property value="#status.count"/> :  <s:property  value="title" /> &nbsp;&nbsp;[简答题]</h3>
						<h4 ><font color="red">回答如下：</font></h4>
						<s:iterator value="#request.surveyAnswer.questionAnswers[#status.index].key" status="status1">
						<h4><s:property value="#status1.count"/>:&nbsp;&nbsp;<s:property/>  </h4>
						
						</s:iterator>
					</s:if> 
						
				</s:if>
			
				</s:iterator>
				</s:else>
			</div>

		</s:else>



	</div>
</div>


</body>
</html>