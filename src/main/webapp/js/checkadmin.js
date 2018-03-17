	function myFunction(){
		var user = document.getElementById("user").value.trim();
		var pass = document.getElementById("pass").value.trim();
	    var msg = document.getElementById("spanpa");
 
        if (user == null||user == "" ) 
		{
            msg.innerHTML = "用户名不能为空";
			return false;
		}
		
		if (pass == null||pass == "")
		{
            msg.innerHTML = "密码不能为空";	
			return false;
        }
		else
		{
			return true;
		}
		
		
}