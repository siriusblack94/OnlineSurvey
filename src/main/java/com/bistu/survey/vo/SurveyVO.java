package com.bistu.survey.vo;

import java.util.List;

import com.bistu.survey.entities.Question;



public class SurveyVO {

	
	private String surveyname;// 非空唯一
	
	
	
	public String getSurveyname() {
		return surveyname;
	}




	public void setSurveyname(String surveyname) {
		this.surveyname = surveyname;
	}




	private List<Question> questions;




	public List<Question> getQuestions() {
		return questions;
	}




	public void setQuestions(List<Question> questions) {
		this.questions = questions;
	}




	/*@Override
	public String toString() {
		return "SurveyVO [surveyname=" + surveyname + ", questions=" + questions + "]";
	}
*/




	
}
