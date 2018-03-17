package com.bistu.survey.dao;

import com.bistu.survey.entities.*;
import com.bistu.survey.vo.AnswerVO;
import com.bistu.survey.vo.QuestionVO;
import org.hibernate.Query;
import org.springframework.beans.BeanUtils;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

;

public class AnswerDao extends BaseDao {

	public void save(AnswerVO answerVO) {
		QuestionVO questionVO = new QuestionVO();
		Answer answer = new Answer();
		Survey survey = (Survey) getSession().get(Survey.class, answerVO.getSid());
		User user = (User) getSession().get(User.class, answerVO.getUid());
		answer.setSurvey(survey);
		answer.setUser(user);
		String hql = "Select max(a.number) from Answer a";
		Long number = (Long) getSession().createQuery(hql).uniqueResult();

		if (number == null) {
			number = 1L;
		} else {
			number = number + 1;
		}
		answer.setNumber(number);

		List<QuestionVO> list = answerVO.getQuestions();
		Iterator<QuestionVO> it = list.iterator();

		while (it.hasNext()) {
			questionVO = it.next();
			Question question = (Question) getSession().get(Question.class, questionVO.getQid());
			answer.setQuestion(question);
			if (questionVO.getType().equals("danxuan") || questionVO.getType().equals("jianda")) {
				answer.setResult(questionVO.getResult());

			}
			if (questionVO.getType().equals("duoxuan")) {
				if (questionVO.getA() == null) {
					questionVO.setA("");
				}
				if (questionVO.getB() == null) {
					questionVO.setB("");
				}
				if (questionVO.getC() == null) {
					questionVO.setC("");
				}
				if (questionVO.getD() == null) {
					questionVO.setD("");
				}
				String result = questionVO.getA() + questionVO.getB() + questionVO.getC() + questionVO.getD();
				answer.setResult(result);
			}
			getSession().save(answer);
			getSession().clear();
		}
	}

	public  SurveyAnswer count(Survey survey) {
		Long sum = countBySid(survey);  
		SurveyAnswer surveyAnswer = new SurveyAnswer();
		BeanUtils.copyProperties(survey, surveyAnswer);

		List<QuestionAnswer> questionAnswers = new ArrayList<QuestionAnswer>();
		List<Question> questions = survey.getQuestions();
		Iterator<Question> it = questions.iterator();
		Question question = new Question();
		while(it.hasNext()){
			 question = it.next();
			 QuestionAnswer questionAnswer = new QuestionAnswer();//必须每次new一个新的对象，否则add后一次添加会覆盖前一次。因为对于List<T>来说，如果T是引用类型，那保存的是引用，如果是值类型，保存的是值本身！
		     BeanUtils.copyProperties(question, questionAnswer);
		     questionAnswers.add(questionAnswer);
		}
		surveyAnswer.setQuestionAnswers(questionAnswers);
		
		
		if(sum != null&&sum!=0){
			 surveyAnswer.setNumber(sum);
			 Long ANum;
			 Long BNum;
			 Long CNum;
			 Long DNum;
			 float APercent;
			 float BPercent;
			 float CPercent;
			 float DPercent;
			QuestionAnswer questionAnswer = new QuestionAnswer();
			
			Iterator<QuestionAnswer> it2 = questionAnswers.iterator();

			while(it2.hasNext()){
				questionAnswer = it2.next();
				if(questionAnswer.getType().equals("danxuan")){
					String hql = "select count(*) from Answer a where a.question.qid =? and a.result =?";
					Query query = getSession().createQuery(hql).setInteger(0, questionAnswer.getQid());
					query.setString(1, "A"); 
					ANum = (Long) query.uniqueResult();
					APercent = (float)ANum/sum;
					questionAnswer.setANum(ANum);
					questionAnswer.setAPercent(APercent);
					
					query.setString(1, "B"); 
					BNum=(Long) query.uniqueResult();
					BPercent = (float)BNum/sum;
					questionAnswer.setBNum(BNum);
					questionAnswer.setBPercent(BPercent);
					
					query.setString(1, "C"); 
					CNum=(Long) query.uniqueResult();
					CPercent = (float)CNum/sum;
					questionAnswer.setCNum(CNum);
					questionAnswer.setCPercent(CPercent);
					
					query.setString(1, "D"); 
					DNum=(Long) query.uniqueResult();
					DPercent = (float)DNum/sum;
					questionAnswer.setDNum(DNum);
					questionAnswer.setDPercent(DPercent);
					
					
				}
				if(questionAnswer.getType().equals("duoxuan")){
					Long maxNum;
					Long minNum;
					float maxPercent;
					float minPercent;
					
			
					String hql = "select count(*) from Answer a where a.question.qid =? and a.result =?";
					Query query = getSession().createQuery(hql).setInteger(0, questionAnswer.getQid());
					query.setString(1, "A"); 
					ANum = (Long) query.uniqueResult();
					APercent = (float)ANum/sum;
					questionAnswer.setANum(ANum);
					questionAnswer.setAPercent(APercent);
					
					query.setString(1, "B"); 
					BNum=(Long) query.uniqueResult();
					BPercent = (float)BNum/sum;
					questionAnswer.setBNum(BNum);
					questionAnswer.setBPercent(BPercent);
					
					query.setString(1, "C"); 
					CNum=((Number)query.uniqueResult()).longValue();
					CPercent = (float)CNum/sum;
					questionAnswer.setCNum(CNum);
					questionAnswer.setCPercent(CPercent);
					
					query.setString(1, "D"); 
					DNum=((Number)query.uniqueResult()).longValue();
					DPercent = (float)DNum/sum;
					questionAnswer.setDNum(DNum);
					questionAnswer.setDPercent(DPercent);
					
					String sql2 = "select count(*) c from t_answer t where t.qid =? group by t.result order by c desc limit 1 ";
					Query query2 = getSession().createSQLQuery(sql2).setInteger(0, questionAnswer.getQid());
					maxNum = ((Number)query2.uniqueResult()).longValue();
					questionAnswer.setMaxNum(maxNum);
					maxPercent = (float)maxNum/sum;
					questionAnswer.setMaxPercent(maxPercent);
					
					String sql3 = "select count(*) c from t_answer t where t.qid =? group by t.result order by c asc  limit 1 ";
					Query query3 = getSession().createSQLQuery(sql3).setInteger(0, questionAnswer.getQid());
					minNum = ((Number)query3.uniqueResult()).longValue();
					questionAnswer.setMinNum(minNum);
					minPercent = (float)minNum/sum;
					questionAnswer.setMinPercent(minPercent);
					
					
					List<String> max = new ArrayList<String>();
					List<String> min = new ArrayList<String>();
					
					String sql4 = "select T.result from"
							+ "(select  count(*)c,t.result from t_answer t where t.qid =? group by t.result order by c desc)as T "
							+ "where T.c = "
							+ "(select max(T1.c) from "
							+ "(select  count(*)c,t.result from t_answer t where t.qid =? group by t.result order by c desc)T1) ";
					Query query4 = getSession().createSQLQuery(sql4).setInteger(0, questionAnswer.getQid()).setInteger(1, questionAnswer.getQid());
					max = query4.list();
					questionAnswer.setMax(max);
					
					String sql5 = "select T.result from"
							+ "(select  count(*)c,t.result from t_answer t where t.qid =? group by t.result order by c desc)as T "
							+ "where T.c = "
							+ "(select min(T1.c) from "
							+ "(select  count(*)c,t.result from t_answer t where t.qid =? group by t.result order by c desc)T1) ";
					Query query5 = getSession().createSQLQuery(sql5).setInteger(0, questionAnswer.getQid()).setInteger(1, questionAnswer.getQid());
					min = query5.list();
					questionAnswer.setMin(min);
					
				}
				if(questionAnswer.getType().equals("jianda")){
					List<String> key = new ArrayList<String>();
					
					String hql = "select a.result from Answer a where a.question.qid =?";
					Query query = getSession().createQuery(hql).setInteger(0, questionAnswer.getQid());
					questionAnswer.setKey(query.list());
					
				}
				surveyAnswer.setQuestionAnswers(questionAnswers);
			}
			
			
		}
		System.out.println(surveyAnswer);
		return  surveyAnswer;	
	}
	
	public Long countBySid(Survey survey){
		List<Question> questions = survey.getQuestions();
		Iterator<Question> it = questions.iterator();
		Question question = it.next();
		String hql = "Select count(*) from Answer a where a.question.qid =?";
		return  (Long) getSession().createQuery(hql).setInteger(0, question.getQid()).uniqueResult();
		
	}
	
}
