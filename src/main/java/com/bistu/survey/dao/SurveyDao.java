package com.bistu.survey.dao;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.springframework.beans.BeanUtils;

import com.bistu.survey.entities.Answer;
import com.bistu.survey.entities.Question;
import com.bistu.survey.entities.Survey;
import com.bistu.survey.entities.User;
import com.bistu.survey.vo.SurveyVO;

public class SurveyDao extends BaseDao{
	public List<Survey> getAll(){
		String hql ="From Survey"; 
		
		return getSession().createQuery(hql).list();
		
	}
	public void delete(Integer sid){
		Survey survey = (Survey) getSession().get(Survey.class, sid);
						getSession().delete(survey);
	}
	public void saveOrUpdate(Survey survey)throws Exception { 
			getSession().saveOrUpdate(survey);

	}
	public Survey getSurveyByName(String surveyname){
		String hql ="From Survey s where s.surveyname =? ";
		return (Survey) getSession().createQuery(hql).setString(0, surveyname).uniqueResult();
	}
	
	public List<Survey> find(User u){
		String hql ="From Survey s where s.user.uid = ?"; 
		Query query = getSession().createQuery(hql).setInteger(0, u.getUid());
		return query.list();
	}
	
	public void create(SurveyVO vo,User u) throws Exception{
		
			Survey su = new Survey();
			BeanUtils.copyProperties(vo, su);;
			su.setCreateTime(new Date());
			su.setState("已发布");
			su.setUser(u);
			List<Question> questions = su.getQuestions();  
			Question question  = null;
			Iterator<Question> it = questions.iterator();
			getSession().persist(su);
			while(it.hasNext()){
				try{
					getSession().clear();
					question = it.next();
					question.setSurvey(su);
					getSession().persist(question);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
	
	}
	public List<Survey> findPublished(User u){
		String hql ="From Survey s where s.user.uid = ?and s.state=?"; 
		Query query = getSession().createQuery(hql).setInteger(0, u.getUid()).setString(1, "已发布");
		return query.list();
	}
	
	public Survey findByID(Integer sid){
		Survey survey =	(Survey) getSession().get(Survey.class, sid);
		String hql = "From Question q where q.survey.sid = ? ";
		Query query = getSession().createQuery(hql).setInteger(0, sid);
		List<Question> list = query.list();
		survey.setQuestions(list);
		
		return survey;
	}
	public Long count(Integer id){
		String hql = "Select count(*) from Question q where q.survey.sid =? ";
		Query query = getSession().createQuery(hql).setInteger(0, id);
		return (Long) query.uniqueResult();
		
		
	}
	

	
	
}
