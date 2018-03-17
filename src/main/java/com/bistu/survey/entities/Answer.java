package com.bistu.survey.entities;


public class Answer {
	private Integer id;
	private User user;
	private Survey survey;
	private Question question;
	private String  result;
	private Long number;
	
	
	public Answer() {
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Survey getSurvey() {
		return survey;
	}

	public void setSurvey(Survey survey) {
		this.survey = survey;
	}


	
	
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}


	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}


	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	
	
	
	
	public Long getNumber() {
		return number;
	}

	public void setNumber(Long number) {
		this.number = number;
	}

	/*@Override
	public String toString() {
		return "Answer [id=" + id + ", user=" + user + ", survey=" + survey + ", result=" + result + "]";
	}

	*/
}
