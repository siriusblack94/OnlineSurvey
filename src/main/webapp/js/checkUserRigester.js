function checkUserRigester(){
	
	var name =  document.getElementById("username").value.trim();
	var pass1 = document.getElementById("password").value.trim();
	var pass2 = document.getElementById("confirmpassword").value.trim();
	var email = document.getElementById("email").value.trim();
	var msg = document.getElementById("msg");
	
	
	if(!checkUserName(name)){
		msg.innerHTML = "用户名为6-18位，支持英文、数字和特殊字符";
		document.getElementById("username").focus();
		return false;
	}
	if(!checkPassword(pass1)){
		msg.innerHTML ="登录密码为6-18位，支持英文、数字和特殊字符";
		document.getElementById("password").focus();
		return false;
	}
	if(pass2==""){
		msg.innerHTML= "确认密码不能为空";
		document.getElementById("confirmpassword").focus();
		return false;	
	}
	if(pass1 != pass2){
		msg.innerHTML="两次密码输入不一致";
		document.getElementById("confirmpassword").focus();
		return false;
	}
	if(!checkEmail(email)){
		msg.innerHTML="email格式输入不正确";
		document.getElementById("email").focus();
		return false;
	}
	return true;
}
function checkUserName(name){
	if(name.length<6 || name.length>18 ){
		return false;
	}
	return true;
}
function checkPassword(pass){
	if(pass.length<6 || pass.length>18 ){
		return false;
	}
	return true;
}
function checkEmail(email){
	var filter  = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	if(email=="" ||filter.test(email)){
	return true;
	}else{
	return false ;
	}
}