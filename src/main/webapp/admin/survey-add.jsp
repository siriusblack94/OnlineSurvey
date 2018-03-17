<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page isELIgnored="false"%>
 <%@include file="sessionAdminSon.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加问卷</title>
<base href="<%=basePath%>admin/">
<!-- <base href="http://localhost:8080/OnlineSurvey/admin/"> -->
<script type="text/javascript" src="../js/jquery-1.12.3.js"></script> 
<script type="text/javascript" src="../js/checkSurvey-add.js"></script> 
	<script type="text/javascript">
		$(function(){
				$(".qq").change(function(){
					var  val = $(this).val();
					val  = $.trim(val);
					var $this =$(this);
					$this.nextAll("font").remove();
					if(val !=""){
					
						var url ="survey-validateName";
						var  args = {"surveyname":val,"time":new Date()};
						$.post(url,args,function(data){
							if(data == "1"){
								$this.after("<font color='blue'>问卷名称可用！</font>");
							}else if(data=="0"){
								$this.after("<font color='green'>问卷名称重复！</font>");
							}else{
								
							}
							
						});
						}else{
							$this.after("<font color='green'>问卷名称不能为空！</font>");
							this.focus();
						}
					
				});
		})
		</script>

</head>
<body>
<s:form name="Survey" action="survey-save"  method="post">
	<s:textfield name="surveyname" label="问卷名称" id="surveyname" class="qq" requiredLabel="true" >
	</s:textfield>
	<s:select list="#request.users"
			listKey="uid" listValue="username" id="user" name="user.uid" label="所属用户" ></s:select>
			
	<span id="aaa"></span>
	<s:submit onclick="return checkSurveyadd()" value="提交"></s:submit>

</s:form>
</body>
</html>