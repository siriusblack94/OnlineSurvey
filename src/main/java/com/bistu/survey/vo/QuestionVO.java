package com.bistu.survey.vo;

public class QuestionVO {
	private Integer qid;
	private String  result;
	private String type;
	private String a;
	private String b;
	private String c;
	private String d;
	
	
	
	public QuestionVO() {
	}
	
	
	public Integer getQid() {
		return qid;
	}
	public void setQid(Integer qid) {
		this.qid = qid;
	}
	
	
	
	
	public String getResult() {
		return result;
	}


	public void setResult(String result) {
		this.result = result;
	}


	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getA() {
		return a;
	}
	public void setA(String a) {
		this.a = a;
	}
	public String getB() {
		return b;
	}
	public void setB(String b) {
		this.b = b;
	}
	public String getC() {
		return c;
	}
	public void setC(String c) {
		this.c = c;
	}
	public String getD() {
		return d;
	}
	public void setD(String d) {
		this.d = d;
	}


	/*@Override
	public String toString() {
		return "QuestionVO [qid=" + qid + ", result=" + result + ", type=" + type + ", a=" + a + ", b=" + b + ", c=" + c
				+ ", d=" + d + "]";
	}*/
	
	
	
	
}
