package com.bistu.survey.entities;

import java.util.ArrayList;
import java.util.List;

public class QuestionAnswer {
	private Integer qid;
	private String type;// 题目类型
	private String title;// 题目
	private Survey survey;

	private String A;
	private String B;
	private String C;
	private String D;
	
	private Long ANum;
	private Long BNum;
	private Long CNum;
	private Long DNum;
	private float APercent;
	private float BPercent;
	private float CPercent;
	private float DPercent;
	private List<String> max = new ArrayList<String>();
	private List<String> min = new ArrayList<String>();
	private Long maxNum;
	private Long minNum;
	private float maxPercent;
	private float minPercent;
	private List<String> key = new ArrayList<String>();
	
	
	public QuestionAnswer() {
	}


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


	public Long getANum() {
		return ANum;
	}


	public void setANum(Long aNum) {
		ANum = aNum;
	}


	public Long getBNum() {
		return BNum;
	}


	public void setBNum(Long bNum) {
		BNum = bNum;
	}


	public Long getCNum() {
		return CNum;
	}


	public void setCNum(Long cNum) {
		CNum = cNum;
	}


	public Long getDNum() {
		return DNum;
	}


	public void setDNum(Long dNum) {
		DNum = dNum;
	}


	public float getAPercent() {
		return APercent;
	}


	public void setAPercent(float aPercent) {
		APercent = aPercent;
	}


	public float getBPercent() {
		return BPercent;
	}


	public void setBPercent(float bPercent) {
		BPercent = bPercent;
	}


	public float getCPercent() {
		return CPercent;
	}


	public void setCPercent(float cPercent) {
		CPercent = cPercent;
	}


	public float getDPercent() {
		return DPercent;
	}


	public void setDPercent(float dPercent) {
		DPercent = dPercent;
	}


	public void setMaxNum(Long maxNum) {
		this.maxNum = maxNum;
	}


	public void setMinNum(Long minNum) {
		this.minNum = minNum;
	}


	

	public List<String> getMax() {
		return max;
	}

	public void setMax(List<String> max) {
		this.max = max;
	}

	public List<String> getMin() {
		return min;
	}

	public void setMin(List<String> min) {
		this.min = min;
	}



	public float getMaxPercent() {
		return maxPercent;
	}

	public void setMaxPercent(float maxPercent) {
		this.maxPercent = maxPercent;
	}

	public float getMinPercent() {
		return minPercent;
	}

	public void setMinPercent(float minPercent) {
		this.minPercent = minPercent;
	}

	public List<String> getKey() {
		return key;
	}

	public void setKey(List<String> key) {
		this.key = key;
	}


	public Long getMaxNum() {
		return maxNum;
	}


	public Long getMinNum() {
		return minNum;
	}


/*	@Override
	public String toString() {
		return "QuestionAnswer [qid=" + qid + ", type=" + type + ", title=" + title + ", A=" + A + ", B=" + B + ", C="
				+ C + ", D=" + D + ", ANum=" + ANum + ", BNum=" + BNum + ", CNum=" + CNum + ", DNum=" + DNum
				+ ", APercent=" + APercent + ", BPercent=" + BPercent + ", CPercent=" + CPercent + ", DPercent="
				+ DPercent + ", max=" + max + ", min=" + min + ", maxNum=" + maxNum + ", minNum=" + minNum
				+ ", maxPercent=" + maxPercent + ", minPercent=" + minPercent + ", key=" + key + "]";
	}

*/
	


	
	
}
