function checkSurveyadd(){
	var pass = document.getElementById("surveyname").value.trim();

    var msg = document.getElementById("aaa");

    if (pass == null||pass == "" ) 
	{
        msg.innerHTML = "问卷名称不能为空";
		return false;
	}
	else{
		return true;
	}
	
	
}
