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
<link rel="stylesheet" type="text/css" media="screen" href="css_files/css-table.css" />
<script type="text/javascript" src="js/style-table.js"></script>
</head>
<body>
<s:if  test="#request.publishedList == null || #request.publishedList.size()==0">
<font color="red" size="30px">没有发布的问卷信息</font>
</s:if>
<s:else>

<table border="1" align="center"  id="travel">
<caption>点击问卷名称查看统计结果</caption>
<s:iterator value="#request.publishedList">



	<tbody>
	<tr>
		<th>问卷名称  ：</th>
		<td style="width: 80%;color:#0000ff; "><a style="color:#0000ff; " href="answer-countByID?sid=${sid }"  class="answer"><s:property value="surveyname"/></a></td>
	</tr> 
</s:iterator>
</table>


</s:else>
</body>
</html>