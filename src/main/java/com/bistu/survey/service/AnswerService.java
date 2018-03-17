package com.bistu.survey.service;


import com.bistu.survey.dao.AnswerDao;
import com.bistu.survey.entities.Survey;
import com.bistu.survey.entities.SurveyAnswer;
import com.bistu.survey.vo.AnswerVO;

public class AnswerService {
	private AnswerDao answerDao;

	public AnswerDao getAnswerDao() {
		return answerDao;
	}

	public void setAnswerDao(AnswerDao answerDao) {
		this.answerDao = answerDao;
	}
	
	public void save(AnswerVO  answerVO ){
		answerDao.save(answerVO);
	}
	
	public SurveyAnswer count(Survey survey){
		return answerDao.count(survey);
	}
	
}
