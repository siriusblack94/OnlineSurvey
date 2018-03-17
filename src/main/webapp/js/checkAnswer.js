function allTextFull(){
	var $textareas = $(".ti textarea");
	
	for (var i = 0; i < $textareas.length; i++){
		if ($.trim($($textareas[i]).val()) === "") {
			console.log("第" + i +"个textarea为空");
			return false;
		}
	}
	return true;
	
}

function checkAnswer(){

	//选择
	var $tiDatas = $(".ti .tiData");
	for (var i = 0; i < $tiDatas.length; i++){
		var value = $($tiDatas[i]).val();
		var number = parseInt(value);
		if (number <= 0){
			alert("有选择题未作答！")
			return false;
		}
	}
	//填空
	if (!allTextFull()){
		alert("有简答题未填写！")
		return false;
	}
	
	return true;
}




$(function(){
	var $checks = $(".ti input[type='checkbox']");
	var $radios = $(".ti input[type='radio']");
	
	//duoxuan
	$checks.click(function(){
		var count = parseInt($(this).parents(".ti").find(".tiData").val());
		if ($(this).attr("checked")){
//			console.log("check选中");
			count++;
			$(this).parents(".ti").find(".tiData").val(count + "");
		} else {
//				console.log("check未选中");
				count--;
				$(this).parents(".ti").find(".tiData").val(count + "");
		}
//		console.log(count);
	})
	
	
	//danxuan
		$radios.click(function(){
		var count = parseInt($(this).parents(".ti").find(".tiData").val());
		if ($(this).attr("checked")){
//			console.log("check选中");
			count++;
			$(this).parents(".ti").find(".tiData").val(count + "");
		} else {
//				console.log("check未选中");
				count--;
				$(this).parents(".ti").find(".tiData").val(count + "");
		}
		console.log(count);
	})
})


 