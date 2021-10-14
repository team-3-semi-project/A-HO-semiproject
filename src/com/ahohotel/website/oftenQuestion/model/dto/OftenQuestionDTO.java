package com.ahohotel.website.oftenQuestion.model.dto;

import java.io.Serializable;

public class OftenQuestionDTO implements Serializable{

	private static final long serialVersionUID = -7312259588235084282L;

	private int oqCode;
	private String oqTitle;
	private String oqContent;
	
	public OftenQuestionDTO() {
	}

	public OftenQuestionDTO(int oqCode, String oqTitle, String oqContent) {
		this.oqCode = oqCode;
		this.oqTitle = oqTitle;
		this.oqContent = oqContent;
	}

	public int getOqCode() {
		return oqCode;
	}

	public void setOqCode(int oqCode) {
		this.oqCode = oqCode;
	}

	public String getOqTitle() {
		return oqTitle;
	}

	public void setOqTitle(String oqTitle) {
		this.oqTitle = oqTitle;
	}

	public String getOqContent() {
		return oqContent;
	}

	public void setOqContent(String oqContent) {
		this.oqContent = oqContent;
	}

	@Override
	public String toString() {
		return "OftenQuestionDTO [oqCode=" + oqCode + ", oqTitle=" + oqTitle + ", oqContent=" + oqContent + "]";
	}
	
	
}
