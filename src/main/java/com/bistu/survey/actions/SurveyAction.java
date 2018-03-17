package com.bistu.survey.actions;


import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.alibaba.fastjson.JSON;
import com.bistu.survey.entities.Answer;
import com.bistu.survey.entities.Survey;
import com.bistu.survey.entities.User;
import com.bistu.survey.service.SurveyService;
import com.bistu.survey.service.UserService;
import com.bistu.survey.vo.SurveyVO;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;


public class SurveyAction  extends ActionSupport implements RequestAware,ModelDriven<Survey>,Preparable,SessionAware{
		public static final long serialVersionUID = 1L;
		private SurveyService surveyService;
		private UserService userService;
		public void setUserService(UserService userService) {
			this.userService = userService;
		}
		
		public void setSurveyService(SurveyService surveyService) {
			this.surveyService = surveyService;
		}
		private Map<String, Object> request;
		private Map<String, Object> session;
		@Override
		public void setRequest(Map<String, Object> request) {
			this.request = request;
		}
		
		
		@Override
		public void setSession(Map<String, Object> session) {
			this.session=session;
			
		}

		public String list(){
			request.put("surveys", surveyService.getAll());
			return "list";
			
		}
		
		public String add(){
			request.put("users", userService.getUsers());
			return "add";
		}
		
		private Integer sid;

		public void setSid(Integer sid) {
			this.sid = sid;
		}

		private InputStream inputStream;

		public InputStream getInputStream() {
			return inputStream;
		}

		public String delete() {
			try {
				surveyService.delete(sid);
				inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
			} catch (Exception e) {
				e.printStackTrace();
				try {
					inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
				} catch (UnsupportedEncodingException e1) {
					e1.printStackTrace();
				}
			}
			return "success";
		}
		
		public String save(){
			model.setCreateTime(new Date());
			model.setState("未发布");
			try {
				surveyService.saveOrUpdate(model);
			} catch (Exception e) {
			return "error"	;
			}
			return "save";
		}
		
		public void prepareSave(){
			model = new Survey();
		}
		
		private String surveyname;
		
		public void setSurveyname(String surveyname) {
			this.surveyname = surveyname;
		}

		public String validateName() throws UnsupportedEncodingException{
			if(surveyService.surveyNameIsValid(surveyname)){
				inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
			}else{
				inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
			}
			return"success";
		}
		
		@Override
		public void prepare() throws Exception {
			
		}
		private Survey model;
		@Override
		public Survey getModel() {
			return model;
		}
		
		
		
		private Survey survey;
		public Survey getSurvey() {
			return survey;
		}

		public void setSurvey(Survey survey) {
			this.survey = survey;
		}
		
		
		
		private String tmp1;

		public String getTmp1() {
			return tmp1;
		}

		public void setTmp1(String tmp1) {
			this.tmp1 = tmp1;
		}

		public String create() throws UnsupportedEncodingException{
			SurveyVO vo = JSON.parseObject(tmp1,SurveyVO.class);
			User u = (User) session.get("user");
			try {
				surveyService.create(vo, u);
			} catch (Exception e) {
				e.printStackTrace();
				inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
			}
		
			return "create";
			
		}
		
		public String find(){
			User u = (User) session.get("user");
			List list = surveyService.find(u);
			request.put("usList", list);
			return "find";
			
		}
		
		public String findPublished(){
			User u = (User) session.get("user");
			List list = surveyService.findPublished(u);
			request.put("publishedList", list);
			return "findPublished";
		}
		
		
		
		
		
		public String findByID(){
			Survey survey = surveyService.findByID(sid);
			request.put("survey", survey);
			
			return "survey";
			
		}

		
	
}
