package com.bistu.survey.entities;

public class Question {
	private Integer qid;
	private String type;// 题目类型
	private String title;// 题目
	private Survey survey;

	private String A;
	private String B;
	private String C;
	private String D;

	public String getA() {
		return A;
	}

	public void setA(String a) {
		A = a;
	}

	public String getB() {
		return B;
	}

	public void setB(String b) {
		B = b;
	}

	public String getC() {
		return C;
	}

	public void setC(String c) {
		C = c;
	}

	public String getD() {
		return D;
	}

	public void setD(String d) {
		D = d;
	}

	public Question() {
	}

	public Integer getQid() {
		return qid;
	}

	public void setQid(Integer qid) {
		this.qid = qid;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Survey getSurvey() {
		return survey;
	}

	public void setSurvey(Survey survey) {
		this.survey = survey;
	}

	/*@Override
	public String toString() {
		return "Question [qid=" + qid + ", type=" + type + ", title=" + title + ", A=" + A + ", B=" + B + ", C=" + C
				+ ", D=" + D + "]";
	}
*/
	
	
}
