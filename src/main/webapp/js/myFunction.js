	function myFunction(){
		var user = document.getElementById("username").value.trim();
		var pass = document.getElementById("password").value.trim();
		
	    var msg1 = document.getElementById("span-pass");
 
        if (user == null||user == "" ) 
		{
            msg1.innerHTML = "用户名不能为空";
			return false;
		}
		if (user.length<6 || user.length>18 )
		{
			msg1.innerHTML = "用户名为6-16位";
			return false;
		}else {
		
		}
		if (pass == null||pass == "")
		{
            msg1.innerHTML = "密码不能为空";	
			return false;
        }
		if (pass.length<6 || pass.length>18 )
		{
			msg1.innerHTML = "密码为6-16位";
			return false;
		}else
		{
			
			return true;
		}
		
		
}

 