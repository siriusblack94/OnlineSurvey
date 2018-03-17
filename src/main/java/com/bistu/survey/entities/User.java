package com.bistu.survey.entities;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class User {
	private Integer uid;// 用户ID，不能被修改 非空唯一
	private String username;// 不能被修改 非空唯一
	private String password;//非空
	private String email;//唯一
	private Date createtime;// 不能被修改 非空
	private String nickname;
	private List<Survey> surveys = new ArrayList<>();
	

	public List<Survey> getSurveys() {
		return surveys;
	}


	public void setSurveys(List<Survey> surveys) {
		this.surveys = surveys;
	}


	public User() {}


	

	public Integer getUid() {
		return uid;
	}


	public void setUid(Integer uid) {
		this.uid = uid;
	}


	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

/*

	@Override
	public String toString() {
		return "User [uid=" + uid + ", username=" + username + ",  email=" + email
				+ ", createtime=" + createtime + ", nickname=" + nickname +  "]";
	}
	*/
	


}
