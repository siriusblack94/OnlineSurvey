package com.bistu.survey.entities;

public class UserVO {
	private String  oldPass;
	private String  pass;
	private String confirmPass;
	
	
	public UserVO() {
	}

	public String getOldPass() {
		return oldPass;
	}
	
	public void setOldPass(String oldPass) {
		this.oldPass = oldPass;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getConfirmPass() {
		return confirmPass;
	}
	public void setConfirmPass(String confirmPass) {
		this.confirmPass = confirmPass;
	}
/*
	@Override
	public String toString() {
		return "UserVO [oldPass=" + oldPass + ", pass=" + pass + ", confirmPass=" + confirmPass + "]";
	}
	
	*/
}
