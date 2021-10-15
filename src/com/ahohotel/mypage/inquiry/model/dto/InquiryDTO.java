package com.ahohotel.mypage.inquiry.model.dto;

import java.io.Serializable;
import java.sql.Date;

public class InquiryDTO implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1802443305529879560L;
	
	int inquiryCode;
	int rowNum;
	int userCode;
	String inquiryTitle;
	String inquiryContent;
	String inquiryAnswer;
	Date inquiryDate;
	String inquiryCategory;
	
	public InquiryDTO() {
	}
	public InquiryDTO(int inquiryCode, int rowNum, int userCode, String inquiryTitle, String inquiryContent,
			String inquiryAnswer, Date inquiryDate, String inquiryCategory) {
		this.inquiryCode = inquiryCode;
		this.rowNum = rowNum;
		this.userCode = userCode;
		this.inquiryTitle = inquiryTitle;
		this.inquiryContent = inquiryContent;
		this.inquiryAnswer = inquiryAnswer;
		this.inquiryDate = inquiryDate;
		this.inquiryCategory = inquiryCategory;
	}
	
	public int getInquiryCode() {
		return inquiryCode;
	}
	public void setInquiryCode(int inquiryCode) {
		this.inquiryCode = inquiryCode;
	}
	public int getRowNum() {
		return rowNum;
	}
	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}
	public int getUserCode() {
		return userCode;
	}
	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}
	public String getInquiryTitle() {
		return inquiryTitle;
	}
	public void setInquiryTitle(String inquiryTitle) {
		this.inquiryTitle = inquiryTitle;
	}
	public String getInquiryContent() {
		return inquiryContent;
	}
	public void setInquiryContent(String inquiryContent) {
		this.inquiryContent = inquiryContent;
	}
	public String getInquiryAnswer() {
		return inquiryAnswer;
	}
	public void setInquiryAnswer(String inquiryAnswer) {
		this.inquiryAnswer = inquiryAnswer;
	}
	public Date getInquiryDate() {
		return inquiryDate;
	}
	public void setInquiryDate(Date inquiryDate) {
		this.inquiryDate = inquiryDate;
	}
	public String getInquiryCategory() {
		return inquiryCategory;
	}
	public void setInquiryCategory(String inquiryCategory) {
		this.inquiryCategory = inquiryCategory;
	}
	
	@Override
	public String toString() {
		return "InquiryDTO [inquiryCode=" + inquiryCode + ", rowNum=" + rowNum + ", userCode=" + userCode
				+ ", inquiryTitle=" + inquiryTitle + ", inquiryContent=" + inquiryContent + ", inquiryAnswer="
				+ inquiryAnswer + ", inquiryDate=" + inquiryDate + ", inquiryCategory=" + inquiryCategory + "]";
	}
}
