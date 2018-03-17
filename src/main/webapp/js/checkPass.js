function myFunction(){
		var pass = document.getElementById("password").value.trim();
		var pass1 = document.getElementById("password1").value.trim();
		var pass2 = document.getElementById("password2").value.trim();
	    var msg = document.getElementById("spanpa");
 
        if (pass == null||pass == "" ) 
		{
            msg.innerHTML = "原密码不能为空";
			return false;
		}
		if (pass.length<6 || pass.length>18 )
		{
			msg.innerHTML = "原密码为6-16位";
			return false;
		}
		if (pass1 == null||pass1 == "")
		{
            msg.innerHTML = "新密码不能为空";	
			return false;
        }
		if (pass1.length<6 || pass1.length>18 )
		{
			msg.innerHTML = "新密码为6-16位";
			return false;
		}
		if(pass1 == pass)
		{
			msg.innerHTML = "新密码与原密码不能相同";
			return false;
		}
		if(pass2 !== pass1)
		{
			msg.innerHTML = "确认密码与新密码不相同";
			return false;
		}
		else{
			return true;
		}
		
		
}

 