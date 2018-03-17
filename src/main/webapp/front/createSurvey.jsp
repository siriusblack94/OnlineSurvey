<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="sessionUserSon.jsp" %>
    <%@ page isELIgnored="false"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线调查系统</title>
	<base href="<%=basePath%>">
	<link rel="stylesheet" href="css_files/style.css">
	<link href="css_files/bootstrap.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css_files/site-globe.css">
<link rel="stylesheet" type="text/css" href="css_files/bootstrap-combined.min.css" rel="stylesheet" media="screen">
<link rel="stylesheet" type="text/css" href="css_files/oneplanet.css">
	<script src="js/jquery-1.8.3.min.js"></script>
</head>




<body>

</header>
<div class="all">
	<div class ="body-all">
	<div class ="surveys">
	<label id="label-1" for="input" class="fs30 survey-name" >请输入问卷标题，必填项 </label>
	<textarea id="input"  class="in" ></textarea>
	</div>
	<div class="release">
		<div class="btns clearfix tac m0a w1000">
		<span class="fs25 type">请选择题目类型：</span>
			<button class="btn-single f2">单选</button>
			<button class="btn-multiple f2">多选</button>
			<button class="btn-jianda  f2">简答</button>
			<button class="commit"> 保存并发布问卷</button>
		</div>
		<div class="contents">
		</div>
	</div>
	
	<span id="span"  style="color: red ;text-align:center; display:block">&nbsp;</span>
	</div>
</div>
	<script>
		$(function(){
			var $singleBtn = $(".release .btns .btn-single");
			var $multipleBtn = $(".release .btns .btn-multiple");
			var $jiandaBtn = $(".release .btns .btn-jianda");

		// 点击单选
		$singleBtn.click(function(event) {
			var number = $(".contents .content").length + 1;
			console.log(number);
			var $tmp = 		$('<div class="content-single content " data-type="danxuan">' +
				'<div class="title clearfix">' +
				'<div class="number fl">' + number + '.</div>' +
				'<span class="fl ">(单选题)题目标题:</span>' +
				'<input type="text" class="fl ques">' +
				'<button class="del">删除</button>' +
				'</div>' +
				'<div class="items">' +
				'<div class="item clearfix">' +
				'<div class="xuhao fl">A.</div>' +
				'<input type="text" class="fl  ques">' +
				'</div>' +
				'<div class="item clearfix">' +
				'<div class="xuhao fl">B.</div>' +
				'<input type="text" class="fl  ques">' +
				'</div>' +
				'<div class="item clearfix">' +
				'<div class="xuhao fl">C.</div>' +
				'<input type="text" class="fl  ques">' +
				'</div>' +
				'<div class="item clearfix">' +
				'<div class="xuhao fl">D.</div>' +
				'<input type="text" class="fl  ques">' +
				'</div>' +
				'</div>' +
				'</div>') ;

			$tmp.appendTo('.contents');
		});

// 点击多选
$multipleBtn.click(function(event) {
	var number = $(".contents .content").length + 1;
	console.log(number);
	var $tmp = 		$('<div class="content-multiple content"  data-type="duoxuan">' +
		'<div class="title clearfix">' +
		'<div class="number fl">' + number + '.</div>' +
		'<span class="fl">(多选题)题目标题:</span>' +
		'<input type="text" class="fl   ques">' +
		'<button class="del">删除</button>' +
		'</div>' +
		'<div class="items">' +
		'<div class="item clearfix">' +
		'<div class="xuhao fl">A.</div>' +
		'<input type="text" class="fl  ques">' +
		'</div>' +
		'<div class="item clearfix">' +
		'<div class="xuhao fl">B.</div>' +
		'<input type="text" class="fl  ques">' +
		'</div>' +
		'<div class="item clearfix">' +
		'<div class="xuhao fl">C.</div>' +
		'<input type="text" class="fl  ques">' +
		'</div>' +
		'<div class="item clearfix">' +
		'<div class="xuhao fl">D.</div>' +
		'<input type="text" class="fl  ques">' +
		'</div>' +
		'</div>' +
		'</div>') ;

	$tmp.appendTo('.contents');
});


// 点击简答
$jiandaBtn.click(function(event) {
	var number = $(".contents .content").length + 1;
	console.log(number);
	var $tmp = $('			<div class="content-jianda content" data-type="jianda">'+
		'<div class="title clearfix">'+
		'<div class="clearfix">'+
		'<div class="number fl">' + number + '.</div>'+
		'<span class="fl">(简答题)题目标题:</span>'+
		'</div>'+
		'<textarea class="db"></textarea>'+
		'<button class="del">删除</button>'+
		'</div>'+
		'</div>');
	$tmp.appendTo('.contents');

});
// 删除
$(".contents").on('click', 'button.del', function(event) {
	$(this).parents(".content").remove();
});

//获取所有值
$("button.commit").click(function(){

	var count = $(".contents .content").length;
	var questions = [];
	var surveyname = $("#input").val();
	for(var i = 0; i < count; i++){
		var $tmp = $(".contents .content").eq(i);
		var type = $tmp.data("type");
		var title = $tmp.find(".title input").val();
		var A;
		var B;
		var C;
		var D;
		
		
		if (type !== "jianda"){
		
			A = $tmp.find(".item").eq(0).find("input").val();

			B = $tmp.find(".item").eq(1).find("input").val();
			
			C = $tmp.find(".item").eq(2).find("input").val();
		
			D = $tmp.find(".item").eq(3).find("input").val();
			
			} else {
				//简答
				title = $tmp.find(".title").find("textarea").val();
				A = "";
				B = "";
				C = "";
				D = "";
				}

		var question = {
				type: type,
				title: title,
				A:A,
				B:B,
				C:C,
				D:D
				};
		questions.push(question);
		};

		var tmp = {
				};
		tmp.surveyname = surveyname;
		tmp.questions = questions;
		console.log( tmp);

		 
		var spanvalid =document.getElementById("span");
 		if (surveyname =="" || count == 0){
 			alert("问卷名称不能为空，至少发布一道问题！");
 		}else{
 	 		if(title ==""){
 	 	 		alert("题目不能为空");

 	 	 		}else{
 	 	 	 		if(type!="jianda"&&(A==""||B=="" ) ){
			 		 	 		alert("选择题至少有两个选项");
 	 	 	 		}else{
 	 	 	 	 			$.ajax({
				
					          url: "survey-create", //后台处理的地址
					          type: 'POST',
					          data:  {tmp1: JSON.stringify(tmp)},
					          dataType: 'text',
					          success:function(data){
					        	  if(data==0){
					            		 spanvalid.innerHTML = "<span style='font-size:15px; color:red;'>发布失败</span>";
										}else{
											alert("发布成功");
											window.location.href="http://localhost:8080/OnlineSurvey/front/mumberHome.jsp";
										}
					          }
				        	 
							});
	 	 	 	 	}
 	 	 	 	}
 	 	}		
	

});
})
</script>
</body>
</html>