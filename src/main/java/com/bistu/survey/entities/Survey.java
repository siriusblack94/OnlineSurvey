package com.bistu.survey.entities;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Survey {
	private Integer sid;// 问卷ID,不能被修改，非空唯一
	private String surveyname;// 非空唯一
	private String state;// 状态：发布没发布
	private Date createTime;// 不能被修改 非空
    private User user;
	private List<Question> questions = new ArrayList<Question>();

	public Survey() {

	}

	public Integer getSid() {
		return sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	public String getSurveyname() {
		return surveyname;
	}

	public void setSurveyname(String surveyname) {
		this.surveyname = surveyname;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public List<Question> getQuestions() {
		return questions;
	}

	public void setQuestions(List<Question> questions) {
		this.questions = questions;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}


	
	
}