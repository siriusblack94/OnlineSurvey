package com.bistu.survey.entities;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class SurveyAnswer {
	private Integer sid;// 问卷ID,不能被修改，非空唯一
	private String surveyname;// 非空唯一
	private String state;// 状态：发布没发布
	private Date createTime;// 不能被修改 非空
	private User user;
	private Long number;

	private List<QuestionAnswer> questionAnswers = new ArrayList<QuestionAnswer>();

	public SurveyAnswer() {
	}

	public Long getNumber() {
		return number;
	}

	public void setNumber(Long number) {
		this.number = number;
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

	public List<QuestionAnswer> getQuestionAnswers() {
		return questionAnswers;
	}

	public void setQuestionAnswers(List<QuestionAnswer> questionAnswers) {
		this.questionAnswers = questionAnswers;
	}

	/*@Override
	public String toString() {
		return "SurveyAnswer [sid=" + sid + ", surveyname=" + surveyname + ", state=" + state + ", createTime="
				+ createTime + ", number=" + number + ", questionAnswers=" + questionAnswers + "]";
	}

*/
	
}
