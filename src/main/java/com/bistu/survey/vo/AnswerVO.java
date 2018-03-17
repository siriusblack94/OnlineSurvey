package com.bistu.survey.vo;

import java.util.ArrayList;
import java.util.List;


public class AnswerVO {
	private Integer sid;
	private Integer uid;
	List<QuestionVO> questions = new ArrayList<>();
	
	
	
	
	public AnswerVO() {
	}
	public Integer getSid() {
		return sid;
	}
	public void setSid(Integer sid) {
		this.sid = sid;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public List<QuestionVO> getQuestions() {
		return questions;
	}
	public void setQuestions(List<QuestionVO> questions) {
		this.questions = questions;
	}
	/*@Override
	public String toString() {
		return "AnswerVO [sid=" + sid + ", uid=" + uid + ", questions=" + questions + "]";
	}
	*/
	
	
	
}
