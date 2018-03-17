package com.bistu.survey.actions;

import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.bistu.survey.entities.QuestionAnswer;
import com.bistu.survey.entities.Survey;
import com.bistu.survey.entities.SurveyAnswer;
import com.bistu.survey.service.AnswerService;
import com.bistu.survey.service.SurveyService;
import com.bistu.survey.vo.AnswerVO;
import com.bistu.survey.vo.QuestionVO;
import com.opensymphony.xwork2.ActionSupport;

public class AnswerAction extends ActionSupport implements RequestAware,SessionAware{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private AnswerService answerService;
	private SurveyService surveyService;
	
	
	
	public SurveyService getSurveyService() {
		return surveyService;
	}

	public void setSurveyService(SurveyService surveyService) {
		this.surveyService = surveyService;
	}

	public AnswerService getAnswerService() {
		return answerService;
	}

	public void setAnswerService(AnswerService answerService) {
		this.answerService = answerService;
	}
	
	private Map<String, Object> request;
	
	private Map<String, Object> session;
	
	
	
	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}

	public Map<String, Object> getRequest() {
		return request;
	}

	@Override
	public void setRequest(Map<String, Object> request) {
		this.request=request;
	}
	
	private AnswerVO answerVO;


	
	public AnswerVO getAnswerVO() {
		return answerVO;
	}

	public void setAnswerVO(AnswerVO answerVO) {
		this.answerVO = answerVO;
	}

	private InputStream inputStream;

	public InputStream getInputStream() {
		return inputStream;
	}
	
	
	public String save() throws UnsupportedEncodingException{
		List<QuestionVO> list = answerVO.getQuestions();
		Iterator<QuestionVO> it = list.iterator();
		QuestionVO  questionVO = new QuestionVO();
			while(it.hasNext()){
				questionVO = it.next();
				if(questionVO.getType().equals("danxuan")||questionVO.getType().equals("jianda")){
					if(questionVO.getResult()==null||questionVO.getResult().equals("")){
						session.put("error", "还有问题未作答");
						return "fail";
					}
					
				}
				if(questionVO.getType().equals("duoxuan")){
					if(questionVO.getA() == null&&questionVO.getB() == null&&questionVO.getC() == null&&questionVO.getD() == null){
							session.put("error", "还有问题未作答");
							return "fail";
					}					
				}
			}
		answerService.save(answerVO);
		return "save";
	}
	
	private Integer sid;

	public Integer getSid() {
		return sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	public String countByID(){
		Survey survey = surveyService.findByID(sid);
		SurveyAnswer surveyAnswer = answerService.count(survey);
		request.put("surveyAnswer", surveyAnswer);
		return "countByID";
		
	}
	

}
