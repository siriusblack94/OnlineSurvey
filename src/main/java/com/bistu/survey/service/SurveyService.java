package com.bistu.survey.service;

import java.util.List;



import com.bistu.survey.dao.SurveyDao;
import com.bistu.survey.entities.Answer;
import com.bistu.survey.entities.Survey;
import com.bistu.survey.entities.User;
import com.bistu.survey.vo.SurveyVO;

public class SurveyService {
	private SurveyDao surveyDao;

	
	public void setSurveyDao(SurveyDao surveyDao) {
		this.surveyDao = surveyDao;
	}
	
	public boolean surveyNameIsValid(String surveyname){
		return surveyDao.getSurveyByName(surveyname) == null;
	}
	
	public List<Survey> getAll(){
		return surveyDao.getAll();
	}
	public void delete(Integer sid){
		surveyDao.delete(sid);
	}
	public void saveOrUpdate(Survey survey) throws Exception{
		surveyDao.saveOrUpdate(survey);
	}
	
	public List<Survey> find(User u){
		return 	surveyDao.find(u);
		
	}
	
	public void create(SurveyVO vo,User u) throws Exception{
		surveyDao.create(vo, u);
	}
	public List<Survey> findPublished(User u){
		return 	surveyDao.findPublished(u);
		
	}
	public Survey findByID(Integer sid){
		return surveyDao.findByID(sid);
	}
	public Long count(Integer id){
		return surveyDao.count(id);
	}
	

	
}
